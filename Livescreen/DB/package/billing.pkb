DROP PACKAGE BODY LIVESCREEN.BILLING;

CREATE OR REPLACE PACKAGE BODY LIVESCREEN.BILLING
AS
   /******************************************************************************
      NAME:       BILLING
      PURPOSE:

      REVISIONS:
      Ver        Date        Author           Description
      ---------  ----------  ---------------  ------------------------------------
      1.0        2/18/2013      manucian86       1. Created this package body.
   ******************************************************************************/

   /******************************************************************************
      Dung cho java module
   ******************************************************************************/
   FUNCTION GET_CHARGE_FEE (pMSISDN        IN VARCHAR2,
                            pServiceType   IN NUMBER,
                            pCOS           IN VARCHAR2)
      RETURN NUMBER
   IS
      v_result               NUMBER;

      v_service_fee_amount   NUMBER;
      v_discount             NUMBER;
      v_rate_discount        NUMBER;
   BEGIN
      SELECT MAX (amount)
        INTO v_service_fee_amount
        FROM lsb_service_fee_billing
       WHERE     servicetype = pServicetype
             AND COS_ID = pCOS
             AND SYSDATE >= starttime
             AND SYSDATE <= endtime;

      v_result := v_service_fee_amount;

      BEGIN
         SELECT NVL (discount, 0), NVL (ratediscount, 0)
           INTO v_discount, v_rate_discount
           FROM lsb_discount_billing
          WHERE     pMSISDN LIKE msisdn || '%'
                AND SYSDATE >= starttime
                AND SYSDATE <= endtime
                AND ROWNUM <= 1;

         IF v_discount > 0
         THEN
            v_result := v_service_fee_amount - v_discount;
         ELSIF v_rate_discount > 0
         THEN
            v_result :=
                 v_service_fee_amount
               - (v_service_fee_amount * v_rate_discount / 100);
         END IF;

         RETURN v_result;
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            -- Truong hop trong ServiceFeeBilling có du lieu
            -- Còn trong DiscountBilling ko co
            -- thi van lay gia tri Amount làm ChargeFee tra ve
            RETURN v_result;
      END;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         -- Cho biet trong bang ServiceFeeBilling ko co du lieu
         v_result := 7000;                                              -- -1;
         RETURN v_result;
      WHEN OTHERS
      THEN
         v_result := -100;
         RETURN v_result;
   END;

   FUNCTION GET_MONTHLY_BILLING_CHARGE_FEE (
      pMSISDN              IN VARCHAR2,
      pCOS                 IN VARCHAR2,
      pServiceFeeBilling   IN t_tbl_service_fee_billing,
      pDiscountBilling     IN t_tbl_discount_billing)
      RETURN NUMBER
   IS
      v_result   NUMBER := 7000;
   --      v_amount   NUMBER;
   --      v_discount        NUMBER;
   --      v_rate_discount   NUMBER;
   BEGIN
      DBMS_OUTPUT.PUT_LINE (
         'tbl_service_fee_billing.COUNT = ' || pServiceFeeBilling.COUNT);
      DBMS_OUTPUT.PUT_LINE (
         'tbl_discount_billing.COUNT = ' || pDiscountBilling.COUNT);

      -- Loop trong ServiceFeeBilling list lay Amount
      -- có COS (DE0, DE1) tuong ung
      FOR i IN 1 .. pServiceFeeBilling.COUNT
      LOOP
         DBMS_OUTPUT.PUT_LINE ('cos_id = ' || pServiceFeeBilling (i).cos_id);

         IF pCOS = pServiceFeeBilling (i).cos_id
         THEN
            v_result := pServiceFeeBilling (i).amount;

            DBMS_OUTPUT.PUT_LINE ('----- v_result = ' || v_result);

            EXIT;
         END IF;
      END LOOP;

      -- Loop trong DiscountBilling list lay Discount hoac RateDiscount
      -- có MSISDN tuong ung
      FOR i IN 1 .. pDiscountBilling.COUNT
      LOOP
         IF pMSISDN LIKE pDiscountBilling (i).MSISDN || '%'
         THEN
            IF pdiscountbilling (i).discount > 0
            THEN
               v_result := v_result - pdiscountbilling (i).discount;
            ELSIF pdiscountbilling (i).ratediscount > 0
            THEN
               v_result :=
                    v_result
                  - (v_result * pdiscountbilling (i).ratediscount / 100);
            END IF;

            EXIT;
         END IF;
      END LOOP;

      RETURN v_result;
   END;

   PROCEDURE CHARGE_FEE_PROVISIONING
   IS
      v_err_num                 NUMBER;
      v_err_msg                 VARCHAR2 (1000);

      v_row_limit               PLS_INTEGER;

      TYPE t_tbl_msisdn IS TABLE OF VARCHAR2 (20);

      TYPE t_tbl_cos_id IS TABLE OF VARCHAR2 (15);

      tbl_msisdn                t_tbl_msisdn;
      tbl_cos_id                t_tbl_cos_id;

      CURSOR c_monthly_billing
      IS
         SELECT mb.msisdn, s.cos_id
           FROM lsb_monthly_billing mb, profile s
          WHERE mb.msisdn = s.msisdn AND mb.state = 20;

      CURSOR c_service_fee_billing
      IS
         SELECT *
           FROM lsb_service_fee_billing
          WHERE     starttime <= SYSDATE
                AND endtime >= SYSDATE
                AND servicetype = 2;

      CURSOR c_discount_billing
      IS
         SELECT *
           FROM lsb_discount_billing
          WHERE     starttime <= SYSDATE
                AND endtime >= SYSDATE
                AND discounttype = 2;

      tbl_service_fee_billing   t_tbl_service_fee_billing;
      tbl_discount_billing      t_tbl_discount_billing;

      v_charge_fee              NUMBER;
   BEGIN
      insert_events ('DATABASE',
                     'CHARGE_FEE_PROVISIONING',
                     'begin CHARGE_FEE_PROVISIONING',
                     0);

      v_row_limit := 1000;

      ---
      OPEN c_service_fee_billing;

      FETCH c_service_fee_billing
      BULK COLLECT INTO tbl_service_fee_billing;

      CLOSE c_service_fee_billing;

      ---
      OPEN c_discount_billing;

      FETCH c_discount_billing
      BULK COLLECT INTO tbl_discount_billing;

      CLOSE c_discount_billing;

      DBMS_OUTPUT.PUT_LINE (
         'tbl_service_fee_billing.COUNT = ' || tbl_service_fee_billing.COUNT);
      DBMS_OUTPUT.PUT_LINE (
         'tbl_discount_billing.COUNT = ' || tbl_discount_billing.COUNT);

      ---
      OPEN c_monthly_billing;

      LOOP
         FETCH c_monthly_billing
         BULK COLLECT INTO tbl_msisdn, tbl_cos_id
         LIMIT v_row_limit;

         DBMS_OUTPUT.PUT_LINE ('tbl_msisdn.COUNT = ' || tbl_msisdn.COUNT);
         DBMS_OUTPUT.PUT_LINE ('tbl_cos_id.COUNT = ' || tbl_cos_id.COUNT);

         FOR indx IN 1 .. tbl_msisdn.COUNT
         LOOP
            v_charge_fee :=
               BILLING.GET_MONTHLY_BILLING_CHARGE_FEE (
                  tbl_msisdn (indx),
                  tbl_cos_id (indx),
                  tbl_service_fee_billing,
                  tbl_discount_billing);

            --            DBMS_OUTPUT.put_line (
            --                  'msisdn = '
            --               || tbl_msisdn (indx)
            --               || ' cos = '
            --               || tbl_cos_id (indx)
            --               || ' charge_fee = '
            --               || v_charge_fee);

            UPDATE lsb_monthly_billing
               SET charg_fee = v_charge_fee, state = 2
             WHERE msisdn = tbl_msisdn (indx);
         END LOOP;

         EXIT WHEN tbl_msisdn.COUNT < v_row_limit;
      END LOOP;

      CLOSE c_monthly_billing;

      COMMIT;

      insert_events ('DATABASE',
                     'CHARGE_FEE_PROVISIONING',
                     'end CHARGE_FEE_PROVISIONING',
                     0);
   EXCEPTION
      WHEN OTHERS
      THEN
         v_err_num := SQLCODE;
         v_err_msg := SUBSTR (SQLERRM, 1, 1000);
         insert_events ('DATABASE',
                        'CHARGE_FEE_PROVISIONING',
                        'ERROR: ' || v_err_msg,
                        3);
   END;


   FUNCTION GET_SYS_PTR (wPtr_type   IN VARCHAR2,
                         wPtr_name   IN VARCHAR2,
                         DefValue    IN VARCHAR2 DEFAULT NULL)
      RETURN VARCHAR2
   IS
      retval   VARCHAR2 (400);
   --mCount number;
   BEGIN
      SELECT ptr_val
        INTO retval
        FROM lsb_sys_ptr
       WHERE ptr_type = wPtr_type AND ptr_name = wPtr_name;

      RETURN retval;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         Retval := DefValue;
         RETURN retval;
      WHEN OTHERS
      THEN
         Retval := DefValue;
         RETURN retval;
   END;

   PROCEDURE CREATE_TABLE_PARTITION
   IS
      err_msg          VARCHAR2 (1000);
      v_max_part       VARCHAR2 (20);
      v_sql            VARCHAR2 (500);

      v_date           DATE;
      v_today_add_10   DATE;
   BEGIN
      v_today_add_10 := SYSDATE + 10;

      --   -- BUSY_SMS_HIS
      --   -- Chia partition theo ngay
      --   SELECT SUBSTR (MAX (a.partition_name), 2)
      --     INTO v_max_part
      --     FROM user_tab_partitions a
      --    WHERE table_name = 'BUSY_SMS_HIS';
      --
      --   v_date := TO_DATE (v_max_part, 'yyyymmdd');
      --
      --   WHILE v_date < v_today_add_10
      --   LOOP
      --      v_sql :=
      --            'alter table busy_sms_his add partition P'
      --         || TO_CHAR (v_date + 1, 'yyyymmdd')
      --         || ' values less than ('
      --         || TO_CHAR (v_date + 2, 'yyyymmdd')
      --         || ')';
      --
      --      EXECUTE IMMEDIATE (v_sql);
      --
      --      DBMS_OUTPUT.put_line (v_sql);
      --
      --      v_date := v_date + 1;
      --   END LOOP;

      -- LSB_CHARG_HIS
      -- Chia partition theo thang
      SELECT SUBSTR (MAX (a.partition_name), 2)
        INTO v_max_part
        FROM user_tab_partitions a
       WHERE table_name = 'LSB_CHARG_HIS';

      v_date := TO_DATE (v_max_part, 'yyyymm');

      WHILE v_date < v_today_add_10
      LOOP
         v_sql :=
               'alter table LSB_CHARG_HIS add partition P'
            || TO_CHAR (ADD_MONTHS (v_date, 1), 'yyyymm')
            || ' values less than ('
            || TO_CHAR (ADD_MONTHS (v_date, 2), 'yyyymm')
            || ')';

         EXECUTE IMMEDIATE (v_sql);

         DBMS_OUTPUT.put_line (v_sql);

         v_date := ADD_MONTHS (v_date, 1);
      END LOOP;
   EXCEPTION
      WHEN OTHERS
      THEN
         err_msg := SUBSTR (SQLERRM, 1, 1000);
         INSERT_EVENTS ('DATABASE',
                        'CREATE PARTITION PROCESS',
                        'Create table partitions ERR:' || err_msg,
                        3);
   END;

   /*
       Original Source:
           BusySMS
       Original Name:
           daily_bill_process
   */
   PROCEDURE DAILY_PROVISIONING
   IS
      v_err_num               NUMBER;
      v_err_msg               VARCHAR2 (1000);

      v_yesterday             DATE;
      v_today                 DATE;

      v_dd_today              PLS_INTEGER;

      v_row_limit             PLS_INTEGER;
      v_row_count             PLS_INTEGER;

      TYPE t_tbl_subscriber_msisdn IS TABLE OF profile.msisdn%TYPE;

      tbl_subscriber_msisdn   t_tbl_subscriber_msisdn;
      v_canhbaohuy_msg        VARCHAR2 (400);

      v_dd_next_5_day         PLS_INTEGER;
      v_next_5_day_str        VARCHAR2 (20);
   BEGIN
      -- LOG
      insert_events ('DATABASE',
                     'DAILY_PROVISIONING',
                     'begin DAILY_PROVISIONING',
                     0);
      v_row_limit := 3000;

      -- Ngay thu 55
      v_dd_next_5_day := TO_CHAR (SYSDATE + 5, 'dd');
      v_canhbaohuy_msg := get_sys_ptr ('SMS', 'SMS_CANHBAOHUY');

      -- 'dd' ngay hom nay
      SELECT TO_CHAR (SYSDATE, 'dd') INTO v_dd_today FROM DUAL;

      SELECT TRUNC (SYSDATE), TRUNC (SYSDATE - 1)
        INTO v_today, v_yesterday
        FROM DUAL;

      /*
         Xoa cac lsb_bill voi profile status la DEACTIVE (> 10)
         nhung phai qua 1 thang ke tu ngay tru cuoc gan nhat
      */
      IF (TO_CHAR (SYSDATE + 1, 'dd') = '01')
      THEN
         DELETE lsb_bill a
          WHERE     data_part >= v_dd_today
                AND last_date_charg < v_yesterday -- v_yesterday co the thay bang sysdate - 28
                AND EXISTS
                       (SELECT msisdn
                          FROM profile b
                         WHERE a.msisdn = b.msisdn AND b.status_id > 10); -- deactived
      ELSE
         DELETE lsb_bill a
          WHERE     data_part = v_dd_today
                AND last_date_charg < v_yesterday -- v_yesterday co the thay bang sysdate - 28
                AND EXISTS
                       (SELECT msisdn
                          FROM profile b
                         WHERE a.msisdn = b.msisdn AND b.status_id > 10); -- deactived
      END IF;

      COMMIT;

      /*
         *** FIXED: Tranh truong hop hy huu, hiem khi xay ra
         *** Khi java module khong insert duoc vao lsb_bill
         *** khi Subs dang ky dich vu

         Insert, update cac record co status == [suspend, active]
         trong lsb_subsriber vao bang lsb_bill
      */
      MERGE INTO lsb_bill b
           USING (SELECT a.msisdn,
                         NVL (a.activetime, SYSDATE) registered_time
                    FROM profile a
                   WHERE     a.last_update_date >= v_yesterday
                         AND a.last_update_date < v_today
                         -- suspend or active status
                         AND a.status_id < 10
                         AND a.cos_id = 'DE1') t
              ON (b.msisdn = t.msisdn)
      WHEN MATCHED
      THEN
         UPDATE SET status = 1           -- Th?a, status ko quan tr?ng (HuyNX)
      WHEN NOT MATCHED
      THEN
         INSERT     (b.msisdn,
                     b.last_date_charg,
                     b.status,
                     DATA_PART)
             VALUES (t.msisdn,
                     t.registered_time,
                     9,
                     TO_CHAR (registered_time, 'dd'));

      COMMIT;


      /*
         Set retry = 0 doi voi cac lsb_bill da charge thanh cong
      */
      UPDATE lsb_monthly_billing a
         SET RETRY = 0
       WHERE     (state = 4 OR STATE = 40)
             AND lastupdate >= v_yesterday
             AND lastupdate < v_today;

      COMMIT;

      /*
         Insert cac lsb_month_message_req phuc vu viec gui thong bao
         cho cac subs da qua 55 ngay retry charge cuoc
      */
      v_next_5_day_str := TO_CHAR (SYSDATE + 5, 'dd/mm/yyyy');
      v_canhbaohuy_msg :=
         REPLACE (v_canhbaohuy_msg, '$date$', v_next_5_day_str);

      FOR i IN 0 .. 9
      LOOP
         INSERT INTO LSB_MONTH_COMMAND_REQ (ID,
                                            MSISDN,
                                            COMMAND,
                                            STATE,
                                            SOURCE_REQ,
                                            LAST_UPDATE)
            SELECT SEQ_LSB_MONTH_COMMAND_REQ.NEXTVAL,
                   msisdn,
                   55,
                   1,
                   'MON',
                   SYSDATE
              FROM lsb_monthly_billing a
             WHERE     a.data_part = i
                   AND state = 50
                   AND mon_retry >= 1
                   AND EXISTS
                          (SELECT 1
                             FROM lsb_bill b
                            WHERE     a.msisdn = b.msisdn
                                  AND b.data_part = v_dd_next_5_day);

         COMMIT;
      END LOOP;


      /*
         Set status = 2 cho cac lsb_monthly_billing can mang di charge
         (lsb_bill.data_part = today, co ngay tru cuoc la ngay hom nay)
      */
      IF (TO_CHAR (SYSDATE + 1, 'dd') = '01')
      THEN
         MERGE INTO lsb_monthly_billing b
              USING (SELECT a.msisdn, a.last_date_charg
                       FROM lsb_bill a, profile pr
                      WHERE     a.msisdn = pr.msisdn
                            AND PR.cos_id = 'DE1'
                            AND data_part >= v_dd_today
                            AND last_date_charg < TRUNC (SYSDATE - 1)) t
                 ON (b.msisdn = t.msisdn)
         WHEN MATCHED
         THEN
            UPDATE SET
               state = 20,
               typesub = 1,
               lastupdate = NULL,
               error_detail = NULL,
               mon_retry = mon_retry + DECODE (b.state,  40, 0,  50, 1,  0)
         WHEN NOT MATCHED
         THEN
            INSERT     (b.msisdn,
                        b.state,
                        b.retry,
                        b.lastupdate,
                        b.error_detail,
                        b.data_part,
                        typesub)
                VALUES (t.msisdn,
                        20,
                        0,
                        NULL,
                        NULL,
                        SUBSTR (t.msisdn, -1),
                        1);

         COMMIT;
      ELSE
         MERGE INTO lsb_monthly_billing b
              USING (SELECT a.msisdn, a.last_date_charg
                       FROM lsb_bill a, profile pr
                      WHERE     a.msisdn = pr.msisdn
                            AND PR.cos_id = 'DE1'
                            AND data_part = v_dd_today
                            AND last_date_charg < TRUNC (SYSDATE - 1)) t
                 ON (b.msisdn = t.msisdn)
         WHEN MATCHED
         THEN
            UPDATE SET
               state = 20,
               typesub = 1,
               lastupdate = NULL,
               error_detail = NULL,
               mon_retry = mon_retry + DECODE (b.state,  40, 0,  50, 1,  0)
         WHEN NOT MATCHED
         THEN
            INSERT     (b.msisdn,
                        b.state,
                        b.retry,
                        b.lastupdate,
                        b.error_detail,
                        b.data_part,
                        typesub)
                VALUES (t.msisdn,
                        20,
                        0,
                        NULL,
                        NULL,
                        SUBSTR (t.msisdn, -1),
                        1);

         COMMIT;
      END IF;


      /*
         Xoa cac lsb_monthly_billing co profile tuong ung
         dang co status = DEACTIVE
      */
      WHILE (TRUE)
      LOOP
            DELETE lsb_monthly_billing a
             WHERE     (state = 5 OR state = 50)
                   AND EXISTS
                          (SELECT 1
                             FROM profile b
                            WHERE a.msisdn = b.msisdn AND b.status_id > 10)
                   AND ROWNUM <= v_row_limit
         RETURNING msisdn
              BULK COLLECT INTO tbl_subscriber_msisdn;

         v_row_count := SQL%ROWCOUNT;

         IF (v_row_count > 0)
         THEN
            FORALL i
                IN tbl_subscriber_msisdn.FIRST .. tbl_subscriber_msisdn.LAST
               DELETE lsb_bill
                WHERE msisdn = tbl_subscriber_msisdn (i);

            COMMIT;
         END IF;

         EXIT WHEN v_row_count < v_row_limit;
      END LOOP;


      /*
         Set state = 2 voi cac lsb_monthly_billing con lai
         dang co state = 50 (charge ko thanh cong)
      */
      WHILE (TRUE)
      LOOP
         UPDATE lsb_monthly_billing
            SET state = 20
          WHERE state = 50 AND ROWNUM <= v_row_limit;

         v_row_count := SQL%ROWCOUNT;
         COMMIT;
         EXIT WHEN v_row_count < v_row_limit;
      END LOOP;

      insert_events ('DATABASE',
                     'DAILY_PROVISIONING',
                     'end DAILY_PROVISIONING',
                     0);
   EXCEPTION
      WHEN OTHERS
      THEN
         v_err_num := SQLCODE;
         v_err_msg := SUBSTR (SQLERRM, 1, 1000);
         insert_events ('DATABASE',
                        'DAILY_PROVISIONING',
                        'ERROR: ' || v_err_msg,
                        3);
   END;

   PROCEDURE HANDLE_CHARGING_RESULT
   AS
      v_now_minus_1_minute     DATE;
      v_err_num                NUMBER;
      v_err_msg                VARCHAR2 (1000);
      v_msisdn_count           PLS_INTEGER;
      v_msisdn_suspend_count   PLS_INTEGER;
      v_row_limit              PLS_INTEGER;

      TYPE t_tbl_msisdn IS TABLE OF lsb_monthly_billing.msisdn%TYPE;

      TYPE t_tbl_retry IS TABLE OF lsb_monthly_billing.retry%TYPE;

      TYPE t_tbl_typesub IS TABLE OF lsb_monthly_billing.typesub%TYPE;

      TYPE t_tbl_lastupdate IS TABLE OF lsb_monthly_billing.lastupdate%TYPE;

      TYPE t_tbl_command_state IS TABLE OF lsb_monthly_billing.state%TYPE;

      TYPE t_tbl_error_detail
         IS TABLE OF lsb_monthly_billing.error_detail%TYPE;

      TYPE t_tbl_number IS TABLE OF PLS_INTEGER;

      tbl_msisdn               t_tbl_msisdn;
      tbl_msisdn_suspend       t_tbl_msisdn;
      tbl_retry                t_tbl_retry;
      tbl_typesub              t_tbl_typesub;
      tbl_lastupdate           t_tbl_lastupdate;
      tbl_error_detail         t_tbl_error_detail;
      tbl_last_date_charg      t_tbl_number;
      tbl_command_state        t_tbl_command_state;

      v_grun_end               NUMBER;
      v_grun_begin             NUMBER;
      v_dd_today               PLS_INTEGER;

      v_msg_pending            VARCHAR2 (400);
   BEGIN
      -- dinh ky 10 phut chay mot lan:

      -- xac dinh cac yeu cau huy --> huy dang ky.
      -- xac dinh cac msisdn tru tien thanh cong gui thong bao da tru tien.

      insert_events ('DATABASE',
                     'HANDLE_CHARGING_RESULT',
                     'begin HANDLE_CHARGING_RESULT',
                     0);

      v_row_limit := 1000;

      -- Mot phut truoc day
      SELECT SYSDATE - 1 / 1440 INTO v_now_minus_1_minute FROM DUAL;

      v_dd_today := TO_CHAR (SYSDATE, 'dd');

      v_msg_pending := get_sys_ptr ('SMS', 'SMS_PENDING_ALERT');

      v_grun_begin := DBMS_UTILITY.get_time;

      /*
         Set profile.status = 0 (Pending)
         voi cac lsb_monthly_billing co state = 5 (Charge ko thanh cong)
      */
      v_msisdn_count := v_row_limit;
      v_msisdn_suspend_count := v_row_limit;

      WHILE (TRUE)
      LOOP
         -- Lay cac monthly billing co state = 5 (Charge ko thanh cong)
         -- va subs dang active
         --    + insert month_command_req
         --    + set monthly_billing.state = 50
         IF v_msisdn_count >= v_row_limit
         THEN
            SELECT mb.msisdn
              BULK COLLECT INTO tbl_msisdn
              FROM lsb_monthly_billing mb, profile pr
             WHERE     PR.MSISDN = MB.MSISDN
                   AND mb.state = 5
                   AND pr.status_id < 10
                   AND pr.status_id > 0
                   AND ROWNUM <= v_row_limit;

            v_msisdn_count := tbl_msisdn.COUNT;

            IF v_msisdn_count > 0
            THEN
               -- Insert vao lsb_month_message_req de thong bao toi Subs
               FORALL i IN tbl_msisdn.FIRST .. tbl_msisdn.LAST
                  INSERT INTO LSB_MONTH_COMMAND_REQ (ID,
                                                     MSISDN,
                                                     COMMAND,
                                                     STATE,
                                                     SOURCE_REQ,
                                                     LAST_UPDATE)
                       VALUES (SEQ_LSB_MONTH_COMMAND_REQ.NEXTVAL,
                               tbl_msisdn (i),
                               0,                                  -- suspend,
                               1,
                               'MON',
                               SYSDATE);

               -- Set state = 50 cho biet da xu ly
               -- (Chuyen trang thai Subs, thong bao, ...)

               FORALL i IN tbl_msisdn.FIRST .. tbl_msisdn.LAST
                  UPDATE lsb_monthly_billing
                     SET state = 50, typesub = 1
                   WHERE     data_part = SUBSTR (tbl_msisdn (i), -1)
                         AND msisdn = tbl_msisdn (i);

               COMMIT;
            END IF;
         END IF;

         -- Lay cac monthly billing co state = 5 (Charge ko thanh cong)
         -- va subs dang suspend
         --    + chi set monthly_billing.state = 50
         IF v_msisdn_suspend_count >= v_row_limit
         THEN
            SELECT mb.msisdn
              BULK COLLECT INTO tbl_msisdn_suspend
              FROM lsb_monthly_billing mb, profile pr
             WHERE     PR.MSISDN = MB.MSISDN
                   AND mb.state = 5
                   AND pr.status_id = 0
                   AND ROWNUM <= v_row_limit;

            v_msisdn_suspend_count := tbl_msisdn_suspend.COUNT;

            IF v_msisdn_suspend_count > 0
            THEN
               FORALL i
                   IN tbl_msisdn_suspend.FIRST .. tbl_msisdn_suspend.LAST
                  UPDATE lsb_monthly_billing
                     SET state = 50, typesub = 1
                   WHERE     data_part = SUBSTR (tbl_msisdn_suspend (i), -1)
                         AND msisdn = tbl_msisdn_suspend (i);

               COMMIT;
            END IF;
         END IF;

         EXIT WHEN     v_msisdn_count < v_row_limit
                   AND v_msisdn_suspend_count < v_row_limit;
      END LOOP;

      v_grun_end := DBMS_UTILITY.get_time;
      insert_events (
         'DATABASE',
         'HANDLE_CHARGING_RESULT',
         '--> SUSPEND PROCESS ' || v_grun_begin || ' - ' || v_grun_end,
         0);



      /*
         Set status = 3 (FORCE_ACTIVE) voi cac lsb_monthly_billing
         retry charge cuoc thanh cong
      */
      v_grun_begin := DBMS_UTILITY.get_time;

      WHILE (TRUE)
      LOOP
         SELECT msisdn
           BULK COLLECT INTO tbl_msisdn
           FROM lsb_monthly_billing
          WHERE state = 4 AND retry > 1 AND ROWNUM <= v_row_limit;

         IF tbl_msisdn.COUNT > 0
         THEN
            FORALL i IN tbl_msisdn.FIRST .. tbl_msisdn.LAST
               INSERT INTO LSB_MONTH_COMMAND_REQ (ID,
                                                  MSISDN,
                                                  COMMAND,
                                                  STATE,
                                                  SOURCE_REQ,
                                                  LAST_UPDATE)
                    VALUES (SEQ_LSB_MONTH_COMMAND_REQ.NEXTVAL,
                            tbl_msisdn (i),
                            3,                                -- force_active,
                            1,
                            'MON',
                            SYSDATE);

            -- Set state = 40 (Da xu ly cac Subs charge cuoc thanh cong)
            FORALL i IN tbl_msisdn.FIRST .. tbl_msisdn.LAST
               UPDATE lsb_monthly_billing
                  SET state = 40, typesub = 1, retry = 0
                WHERE     data_part = SUBSTR (tbl_msisdn (i), -1)
                      AND msisdn = tbl_msisdn (i);

            -- Set data_part là 'dd' cua ngay hom nay (Ngay charge thanh cong)
            FORALL i IN tbl_msisdn.FIRST .. tbl_msisdn.LAST
               UPDATE lsb_bill
                  SET data_part = v_dd_today
                WHERE msisdn = tbl_msisdn (i) AND data_part <> v_dd_today;

            COMMIT;
         END IF;

         EXIT WHEN tbl_msisdn.COUNT < v_row_limit;
      END LOOP;

      v_grun_end := DBMS_UTILITY.get_time;
      insert_events (
         'DATABASE',
         'HANDLE_CHARGING_RESULT',
         '--> FORCE_ACTIVE PROCESS ' || v_grun_begin || ' - ' || v_grun_end,
         0);

      /*
         Voi nhung thue bao no cuoc qua 2 thang,
         tao req yeu cau huy dich vu
         va xoa khoi theo doi cuoc
      */
      v_grun_begin := DBMS_UTILITY.get_time;

      WHILE (TRUE)
      LOOP
            DELETE lsb_monthly_billing
             WHERE     (   (state = 50 AND mon_retry >= 2)         -- Deactive
                        OR state = 501                              -- Huy SIM
                        OR state = 405)                             -- Doi chu
                   AND lastupdate <= v_now_minus_1_minute
                   AND ROWNUM <= v_row_limit
         RETURNING msisdn,
                   retry,
                   typesub,
                   lastupdate,
                   error_detail,
                   state
              BULK COLLECT INTO tbl_msisdn,
                   tbl_retry,
                   tbl_typesub,
                   tbl_lastupdate,
                   tbl_error_detail,
                   tbl_command_state;

         IF tbl_msisdn.COUNT > 0
         THEN
            FORALL i IN tbl_msisdn.FIRST .. tbl_msisdn.LAST
               INSERT INTO LSB_MONTH_COMMAND_REQ (ID,
                                                  MSISDN,
                                                  COMMAND,
                                                  STATE,
                                                  SOURCE_REQ,
                                                  LAST_UPDATE)
                    VALUES (SEQ_LSB_MONTH_COMMAND_REQ.NEXTVAL,
                            tbl_msisdn (i),
                            tbl_command_state (i),                       -- 1,
                            1,
                            'MON',
                            SYSDATE);

            FORALL i IN tbl_msisdn.FIRST .. tbl_msisdn.LAST
               INSERT INTO LSB_CHARG_HIS (msisdn,
                                          state,
                                          retry,
                                          typesub,
                                          lastupdate,
                                          error_detail,
                                          data_part)
                    VALUES (tbl_msisdn (i),
                            tbl_command_state (i),                      -- 50,
                            tbl_retry (i),
                            1,
                            tbl_lastupdate (i),
                            tbl_error_detail (i),
                            TO_CHAR (tbl_lastupdate (i), 'yyyymm'));

            FORALL i IN tbl_msisdn.FIRST .. tbl_msisdn.LAST
               DELETE lsb_bill
                WHERE msisdn = tbl_msisdn (i);

            COMMIT;
         END IF;

         EXIT WHEN tbl_msisdn.COUNT < v_row_limit;
      END LOOP;

      v_grun_end := DBMS_UTILITY.get_time;
      insert_events (
         'DATABASE',
         'HANDLE_CHARGING_RESULT',
         '--> CANCEL PROCESS ' || v_grun_begin || ' - ' || v_grun_end,
         0);


      v_grun_end := DBMS_UTILITY.get_time;
      insert_events ('DATABASE',
                     'HANDLE_CHARGING_RESULT',
                     'end HANDLE_CHARGING_RESULT',
                     0);
   EXCEPTION
      WHEN OTHERS
      THEN
         v_err_num := SQLCODE;
         v_err_msg := SUBSTR (SQLERRM, 1, 1000);
         insert_events ('DATABASE',
                        'HANDLE_CHARGING_RESULT',
                        'ERROR: ' || v_err_msg,
                        3);
   END;


   PROCEDURE RECHARG_PROCESS
   IS
      err_num                   NUMBER;
      err_msg                   VARCHAR2 (1000);
      row_limit                 PLS_INTEGER;

      TYPE cos_id_arr_type IS TABLE OF profile.msisdn%TYPE;

      TYPE msisdn_arr_type IS TABLE OF lsb_monthly_billing.msisdn%TYPE;

      TYPE state_arr_type IS TABLE OF lsb_monthly_billing.state%TYPE;

      TYPE money_arr_type IS TABLE OF lsb_monthly_billing.charg_fee%TYPE;

      arr_cos_id                cos_id_arr_type;

      arr_msisdn                msisdn_arr_type;
      arr_state                 state_arr_type;
      arr_out_msisdn            msisdn_arr_type;
      arr_money                 money_arr_type;

      dd_msg                    PLS_INTEGER;

      CURSOR c_service_fee_billing
      IS
         SELECT *
           FROM lsb_service_fee_billing
          WHERE     starttime <= SYSDATE
                AND endtime >= SYSDATE
                AND servicetype = 2;

      CURSOR c_discount_billing
      IS
         SELECT *
           FROM lsb_discount_billing
          WHERE     starttime <= SYSDATE
                AND endtime >= SYSDATE
                AND discounttype = 2;

      tbl_service_fee_billing   t_tbl_service_fee_billing;
      tbl_discount_billing      t_tbl_discount_billing;

      v_charge_fee              NUMBER;
   BEGIN
      insert_events ('DATABASE',
                     'RECHARG_PROCESS',
                     'begin RECHARG_PROCESS',
                     0);
      row_limit := 3000;
      dd_msg := TO_CHAR (SYSDATE + 5, 'dd');

      /*
         BEGIN: Tong hop ket qua sau khi charge
      */
      -- Lay toan bo monthly_billing co state = 4, 5, 40, 50
      -- va ton tai MSISDN trong charge_request voi state = 1
      SELECT msisdn, state, charg_fee
        BULK COLLECT INTO arr_msisdn, arr_state, arr_money
        FROM lsb_monthly_billing a
       WHERE     state IN (4, 5, 50, 40)
             AND EXISTS
                    (SELECT 1
                       FROM lsb_charge_request b
                      WHERE a.msisdn = b.msisdn AND b.state = 1);

      IF arr_msisdn.COUNT > 0
      THEN
         FOR j IN arr_msisdn.FIRST .. arr_msisdn.LAST
         LOOP
            IF arr_state (j) = 4 OR arr_state (j) = 40
            THEN
               INSERT INTO LSB_MONTH_COMMAND_REQ (ID,
                                                  MSISDN,
                                                  COMMAND,
                                                  STATE,
                                                  SOURCE_REQ,
                                                  LAST_UPDATE)
                    VALUES (SEQ_LSB_MONTH_COMMAND_REQ.NEXTVAL,
                            arr_msisdn (j),
                            3,
                            -- force_active
                            -- khoi phuc thanh cong
                            1,
                            'MON',
                            SYSDATE);
            ELSE
               INSERT INTO LSB_MONTH_COMMAND_REQ (ID,
                                                  MSISDN,
                                                  COMMAND,
                                                  STATE,
                                                  SOURCE_REQ,
                                                  LAST_UPDATE)
                    VALUES (SEQ_LSB_MONTH_COMMAND_REQ.NEXTVAL,
                            arr_msisdn (j),
                            51,
                            -- khoi phuc ko thanh cong
                            1,
                            'MON',
                            SYSDATE);
            END IF;
         -- Vi hien tai ko can thong bao cho subs khi yeu cau khoi phuc
         -- khong thanh cong nen ko can xu ly state = 5, 50
         END LOOP;
      END IF;

      -- Voi cac lsb_monthly_billing.state = 4, 40, 5, 50
      -- update trang thai da xu ly lsb_charge_request
      FORALL j IN arr_msisdn.FIRST .. arr_msisdn.LAST
         DELETE lsb_charge_request
          WHERE msisdn = arr_msisdn (j) AND state = 1;

      COMMIT;

      /*
         END: Tong hop ket qua sau khi charge
      */



      /*
         BEGIN: Mang di xu ly cac charge_request
      */
      ---
      OPEN c_service_fee_billing;

      FETCH c_service_fee_billing
      BULK COLLECT INTO tbl_service_fee_billing;

      CLOSE c_service_fee_billing;

      ---
      OPEN c_discount_billing;

      FETCH c_discount_billing
      BULK COLLECT INTO tbl_discount_billing;

      CLOSE c_discount_billing;

      ---
      SELECT DISTINCT cr.msisdn, pr.cos_id
        BULK COLLECT INTO arr_msisdn, arr_cos_id
        FROM lsb_charge_request cr, profile pr
       WHERE cr.msisdn = pr.msisdn AND cr.state = 0;

      IF (arr_msisdn.COUNT > 0)
      THEN
         --         FORALL i IN arr_msisdn.FIRST .. arr_msisdn.LAST
         --               UPDATE lsb_monthly_billing
         --                  SET state = 2, lastupdate = NULL, error_detail = NULL
         --                WHERE msisdn = arr_msisdn (i) AND state = 50
         --            RETURNING msisdn
         --                 BULK COLLECT INTO arr_out_msisdn;

         FOR indx IN 1 .. arr_msisdn.COUNT
         LOOP
            -- lay phi thoi diem hien tai cua thue bao yeu cau KP
            v_charge_fee :=
               BILLING.GET_MONTHLY_BILLING_CHARGE_FEE (
                  arr_msisdn (indx),
                  arr_cos_id (indx),
                  tbl_service_fee_billing,
                  tbl_discount_billing);

               -- Update monthly_billing.state = 2 de duoc mang di tru phi
               UPDATE lsb_monthly_billing
                  SET state = 2,
                      lastupdate = NULL,
                      error_detail = NULL,
                      charg_fee = v_charge_fee,
                      priority = 1
                WHERE msisdn = arr_msisdn (indx) AND state = 50
            RETURNING msisdn
                 BULK COLLECT INTO arr_out_msisdn;
         END LOOP;

         IF arr_out_msisdn.COUNT > 0
         THEN
            FORALL i IN arr_out_msisdn.FIRST .. arr_out_msisdn.LAST
               INSERT INTO lsb_recharge_wait_resp (msisdn, last_update)
                    VALUES (arr_out_msisdn (i), SYSDATE);
         END IF;

         -- Update toan bo cac lsb_charge_request.state = 0 thanh state = 1
         -- bao gom cac cac yeu cau KP ko hop le
         -- (nhung se ko bi xoa di trong lsb_recharge_request
         -- vi ko ton tai ban ghi trong lsb_monthly_billing)
         FORALL i IN arr_msisdn.FIRST .. arr_msisdn.LAST
            UPDATE lsb_charge_request
               SET state = 1
             WHERE msisdn = arr_msisdn (i);

         --delete bs_charge_request where msisdn = arr_msisdn(i);
         COMMIT;
      END IF;

      /*
         END: Mang di xu ly cac charge_request
      */

      insert_events ('DATABASE',
                     'RECHARG_PROCESS',
                     'end RECHARG_PROCESS',
                     0);
   EXCEPTION
      WHEN OTHERS
      THEN
         err_num := SQLCODE;
         err_msg := SUBSTR (SQLERRM, 1, 1000);
         insert_events ('DATABASE',
                        'RECHARG_PROCESS',
                        'ERROR: ' || err_msg,
                        3);
   END;


   PROCEDURE INSERT_EVENTS (log_username   IN VARCHAR2,
                            log_action     IN VARCHAR2,
                            log_describe   IN VARCHAR2,
                            log_level      IN NUMBER)
   IS
   BEGIN
      INSERT INTO lsb_omap_log (log_username,
                                log_action,
                                log_describe,
                                log_time,
                                log_level)
           VALUES (log_username,
                   log_action,
                   log_describe,
                   SYSDATE,
                   log_level);

      COMMIT;
   END;

   FUNCTION ISNEEDBILLING (p_msisdn VARCHAR2)
      RETURN INTEGER
   IS
      msisdn     VARCHAR2 (30);
      v_result   NUMBER := 0;
   /****************
      Kiem tra xem da tru cuoc chua
      Tránh tru?ng h?p charge r?i, ch?n l?p charge
      Ð?i lo?i ki?m tra trong b?ng BILL n?u có MSISDN r?i thì ko charge n?a
   ****************/

   BEGIN
      SELECT msisdn
        INTO msisdn
        FROM lsb_bill
       WHERE msisdn = p_msisdn;

      IF (msisdn IS NOT NULL)
      THEN
         v_result := 1;
      END IF;

      RETURN v_result;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN 0;
   END;

   PROCEDURE INS_LSB_BILL (
      in_MSISDN            IN LSB_BILL.MSISDN%TYPE,
      in_LAST_DATE_CHARG   IN LSB_BILL.LAST_DATE_CHARG%TYPE,
      in_DATA_PART         IN LSB_BILL.DATA_PART%TYPE,
      in_CHARG_FEE         IN LSB_BILL.CHARG_FEE%TYPE)
   IS
   BEGIN
      INSERT INTO LSB_BILL (MSISDN,
                            LAST_DATE_CHARG,
                            DATA_PART,
                            CHARG_FEE)
           VALUES (in_MSISDN,
                   in_LAST_DATE_CHARG,
                   in_DATA_PART,
                   in_CHARG_FEE);

      COMMIT;
   END INS_LSB_BILL;

   PROCEDURE CLEAR_MONTH_COMMAND_REQ_TABLE
   IS
   BEGIN
      DELETE LSB_MONTH_COMMAND_REQ
       WHERE STATE = 3;
   END CLEAR_MONTH_COMMAND_REQ_TABLE;

   PROCEDURE CLEAR_CHARGE_REQUEST_TABLE
   IS
   BEGIN
      DELETE LSB_CHARGE_REQUEST
       WHERE SYSDATE - DATE_REQ > 7;
   END CLEAR_CHARGE_REQUEST_TABLE;
END BILLING;
/
