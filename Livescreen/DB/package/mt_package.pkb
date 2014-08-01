DROP PACKAGE BODY LIVESCREEN.MT_PACKAGE;

CREATE OR REPLACE PACKAGE BODY LIVESCREEN.MT_PACKAGE
AS
   /******************************************************************************
       NAME:       MT_PACKAGE
       PURPOSE:

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        07/26/2013  manucian86       1. Created this package body.
    ******************************************************************************/

   -- Khong dung toi 2 bang: MTPKG_FEE, MTPKG_DISCOUNT nua
   FUNCTION GET_CHARG_FEE (pMSISDN      IN VARCHAR2, -- Hien tai khong dung toi
                           pPkgdID      IN VARCHAR2,
                           pChargType   IN NUMBER)
      RETURN NUMBER
   IS
      v_err_msg     VARCHAR2 (1023);
      v_result      NUMBER;

      v_charg_fee   NUMBER;
   BEGIN
      -- Lay fee, dau vao: PackageDetailID, ChargeType = 'ACTIVE' or 'RECURRENT'
      SELECT CASE pChargType
                WHEN MT_PACKAGE.CHARG_TYPE_ACTIVE THEN ACTIVE_FEE
                ELSE RECURRENT_FEE
             END
        INTO v_charg_fee
        FROM MTPKG_PACKAGE_DETAIL
       WHERE PKGD_ID = pPkgdID;

      v_result := v_charg_fee;

      RETURN v_result;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         v_err_msg :=
            SUBSTR (
               SQLERRM || CHR (10) || DBMS_UTILITY.format_error_backtrace,
               1,
               1023);

         INSERT_ACTION_LOG (
            'DATABASE',
            'HANDLE_CHARGING_RESULT',
            'ERROR: ' || pMSISDN || '; ' || pPkgdID || ':' || v_err_msg,
            3);

         -- Cho biet trong bang MTPKG_FEE ko co du lieu
         v_result := 0;
         RETURN v_result;
      WHEN OTHERS
      THEN
         v_result := -100;
         RETURN v_result;
   END;

   --   FUNCTION GET_CHARG_FEE (pMSISDN      IN VARCHAR2,
   --                           pPkgdID      IN VARCHAR2,
   --                           pChargType   IN NUMBER)
   --      RETURN NUMBER
   --   IS
   --      v_result          NUMBER;
   --
   --      v_charg_fee       NUMBER;
   --      v_discount        NUMBER;
   --      v_rate_discount   NUMBER;
   --   BEGIN
   --      -- Lay fee, dau vao: PackageDetailID, ChargeType = 'ACTIVE' or 'RECURRENT'
   --      SELECT MAX (fee)
   --        INTO v_charg_fee
   --        FROM MTPKG_FEE
   --       WHERE     charg_type = pChargType
   --             AND PKGD_ID = pPkgdID
   --             AND SYSDATE >= start_time
   --             AND SYSDATE <= end_time;
   --
   --      v_result := v_charg_fee;
   --
   --      BEGIN
   --           -- Lay discount or rate_discount
   --           -- dau vao: Dau so thue bao, ChargeType, PackageID
   --           SELECT MAX (NVL (discount, 0)), MAX (NVL (rate_discount, 0))
   --             INTO v_discount, v_rate_discount
   --             FROM MTPKG_DISCOUNT
   --            WHERE     pMSISDN LIKE MSISDNS || '%'
   --                  AND charg_type = pChargType
   --                  AND PKGD_ID = pPkgdID
   --                  AND SYSDATE >= start_time
   --                  AND SYSDATE <= end_time
   --         GROUP BY discount, rate_discount;
   --
   --         IF v_discount > 0
   --         THEN
   --            v_result := v_charg_fee - v_discount;
   --         ELSIF v_rate_discount > 0
   --         THEN
   --            v_result := v_charg_fee - (v_charg_fee * v_rate_discount / 100);
   --         END IF;
   --
   --         RETURN v_result;
   --      EXCEPTION
   --         WHEN NO_DATA_FOUND
   --         THEN
   --            -- Truong hop trong MTPKG_FEE c? du lieu
   --            -- C?n trong MTPKG_DISCOUNT ko co
   --            -- thi van lay gia tri FEE l?m ChargeFee tra ve
   --            RETURN v_result;
   --      END;
   --   EXCEPTION
   --      WHEN NO_DATA_FOUND
   --      THEN
   --         -- Cho biet trong bang MTPKG_FEE ko co du lieu
   --         v_result := 0;
   --         RETURN v_result;
   --      WHEN OTHERS
   --      THEN
   --         v_result := -100;
   --         RETURN v_result;
   --   END;

   FUNCTION GET_RECURRING_CHARG_FEE (
      pMSISDN          IN VARCHAR2,
      pPkgdID          IN VARCHAR2,
      pChargType       IN NUMBER,
      pFeeTable        IN t_tbl_MTPKG_FEE,
      pDiscountTable   IN t_tbl_MTPKG_DISCOUNT)
      RETURN NUMBER
   IS
      v_result   NUMBER := 7000;
   --      v_fee   NUMBER;
   --      v_discount        NUMBER;
   --      v_rate_discount   NUMBER;
   BEGIN
      --      DBMS_OUTPUT.PUT_LINE (
      --         'pFeeTable.COUNT = ' || pFeeTable.COUNT);
      --      DBMS_OUTPUT.PUT_LINE (
      --         'pDiscountTable.COUNT = ' || pDiscountTable.COUNT);

      -- Loop trong MTPKG_FEE list lay FEE
      -- c? CHARG_TYPE (active, recharge) va PKGD_ID tuong ung
      FOR i IN 1 .. pFeeTable.COUNT
      LOOP
         --         DBMS_OUTPUT.PUT_LINE ('PKGD_ID = ' || pFeeTable (i).PKGD_ID);

         IF     pChargType = pFeeTable (i).CHARG_TYPE
            AND pPkgdID = pFeeTable (i).PKGD_ID
         THEN
            v_result := pFeeTable (i).fee;

            --            DBMS_OUTPUT.PUT_LINE ('----- v_result = ' || v_result);

            EXIT;
         END IF;
      END LOOP;

      -- Loop trong DiscountBilling list lay Discount hoac RateDiscount
      -- c? MSISDN tuong ung
      FOR i IN 1 .. pDiscountTable.COUNT
      LOOP
         IF pMSISDN LIKE pDiscountTable (i).MSISDNS || '%'
         THEN
            IF pDiscountTable (i).discount > 0
            THEN
               v_result := v_result - pDiscountTable (i).discount;
            ELSIF pDiscountTable (i).rate_discount > 0
            THEN
               v_result :=
                    v_result
                  - (v_result * pDiscountTable (i).rate_discount / 100);
            END IF;

            EXIT;
         END IF;
      END LOOP;

      RETURN v_result;
   END;

   PROCEDURE LOAD_FEE_DISCOUNT_TEMP_TABLE (in_RELOAD NUMBER)
   IS
      n_temp   PLS_INTEGER;
   BEGIN
      SELECT COUNT (*) INTO n_temp FROM MTPKG_TMP_FEE_DISCOUNT;

      IF in_RELOAD = 1
      THEN
         EXECUTE IMMEDIATE 'TRUNCATE TABLE LIVESCREEN.MTPKG_TMP_FEE_DISCOUNT';
      END IF;

      IF n_temp <= 0 OR in_RELOAD = 1
      THEN
         INSERT INTO LIVESCREEN.MTPKG_TMP_FEE_DISCOUNT (PKGD_ID,
                                                        CHARG_TYPE,
                                                        MSISDNS,
                                                        CHARG_FEE)
              SELECT MTPKG_FEE.PKGD_ID,
                     MTPKG_FEE.CHARG_TYPE,
                     MSISDNS,
                     CASE
                        WHEN DISCOUNT IS NULL
                        THEN
                             MAX (NVL (FEE, 0))
                           - MAX (NVL (FEE, 0)) * NVL (RATE_DISCOUNT, 0) / 100
                        ELSE
                           MAX (NVL (FEE, 0)) - DISCOUNT
                     END
                        CHARG_FEE
                FROM    MTPKG_FEE
                     LEFT OUTER JOIN
                        MTPKG_DISCOUNT
                     ON     (MTPKG_FEE.CHARG_TYPE = MTPKG_DISCOUNT.CHARG_TYPE)
                        AND (MTPKG_FEE.PKGD_ID = MTPKG_DISCOUNT.PKGD_ID)
            GROUP BY MTPKG_FEE.PKGD_ID,
                     MTPKG_FEE.CHARG_TYPE,
                     MSISDNS,
                     FEE,
                     DISCOUNT,
                     RATE_DISCOUNT;
      END IF;
   END;

   -- TEST UNIT: DONE
   PROCEDURE PREPARE_EXTEND_MESSAGE
   IS
      v_err_msg           VARCHAR2 (1023);

      v_auto_extend_msg   VARCHAR2 (255);

      n_hour              PLS_INTEGER;
      n_day               PLS_INTEGER;
   BEGIN
      -- duongma sua
      -- v_auto_extend_msg := MT_PACKAGE.GET_MTPKG_CONFIG ('SMS', 'SMS_MTPKG_AUTO_EXTEND');
      v_auto_extend_msg :=
         MT_PACKAGE.GET_MTPKG_CONFIG ('SMS', 'SMS_MONTHLY_EXTEND_PREPARE');

      -- Thong bao gia han goi cuoc truoc 2 ngay
      FOR i IN 0 .. 3
      LOOP
         /*SELECT TO_NUMBER (TO_CHAR ( (SYSDATE + 2) + (i / 24), 'DD')),
                TO_NUMBER (TO_CHAR ( (SYSDATE + 2) + (i / 24), 'HH24'))
           INTO n_day, n_hour
           FROM DUAL;

         INSERT INTO LIVESCREEN.MTPKG_MESSAGE_QUEUE (MSISDN,
                                                     STATUS,
                                                     RESP_TYPE,
                                                     SEND_TIME,
                                                     CONTENT,
                                                     PRIORITY)
            SELECT B.MSISDN,
                   0,
                   MT_PACKAGE.RESP_TYPE_SMS,
                   B.NEXT_CHARG_TIME - 2,
                   REPLACE (
                      REPLACE (v_auto_extend_msg, '~TEN_GOI~', PD.PKGD_NAME),
                      '~GIA_CUOC_CUA_GOI~',
                      PD.RECURRENT_FEE),
                   1                                         -- hight priority
              FROM MTPKG_SUBSCRIBER S, MTPKG_PACKAGE_DETAIL PD, MTPKG_BILL B
             WHERE     B.DATA_PART = n_day
                   AND B.SUB_DATA_PART = n_hour
                   AND S.MSISDN = B.MSISDN
                   AND S.PKGD_ID = B.PKGD_ID
                   AND S.STATUS < 10
                   AND B.PKGD_ID = PD.PKGD_ID
                   AND B.INSERTED_EXTEND_MSG = 0;*/

         SELECT TO_NUMBER (TO_CHAR ( (SYSDATE + 1) + (i / 24), 'DD')),
                TO_NUMBER (TO_CHAR ( (SYSDATE + 1) + (i / 24), 'HH24'))
           INTO n_day, n_hour
           FROM DUAL;

         INSERT INTO LIVESCREEN.MTPKG_MESSAGE_QUEUE (MSISDN,
                                                     STATUS,
                                                     RESP_TYPE,
                                                     SEND_TIME,
                                                     CONTENT,
                                                     PRIORITY)
            SELECT B.MSISDN,
                   0,
                   MT_PACKAGE.RESP_TYPE_SMS,
                   B.NEXT_CHARG_TIME - 1,
                   REPLACE (
                      REPLACE (
                         REPLACE (v_auto_extend_msg,
                                  '[TEN GOI]',
                                  PD.PKGD_NAME),
                         '[GIA CUOC CUA GOI]',
                         PD.RECURRENT_FEE),
                      '[MAGOI]',
                      PD.PKGD_ID),
                   1                                         -- hight priority
              FROM MTPKG_SUBSCRIBER S, MTPKG_PACKAGE_DETAIL PD, MTPKG_BILL B
             WHERE     B.DATA_PART = n_day
                   AND B.SUB_DATA_PART = n_hour
                   AND S.MSISDN = B.MSISDN
                   AND S.PKGD_ID = B.PKGD_ID
                   AND S.STATUS < 10
                   AND B.PKGD_ID = PD.PKGD_ID
                   AND B.INSERTED_EXTEND_MSG = 0
                   AND PD.pkgd_type = MT_PACKAGE.PKGD_TYPE_MONTHLY;

         -- Set flag cho biet da tao thong bao
         UPDATE MTPKG_BILL B
            SET B.INSERTED_EXTEND_MSG = 1
          WHERE     B.DATA_PART = n_day
                AND B.SUB_DATA_PART = n_hour
                AND B.INSERTED_EXTEND_MSG = 0;

         COMMIT;
      END LOOP;

      INSERT_ACTION_LOG ('DATABASE',
                         'PREPARE_EXTEND_MESSAGE',
                         'DONE: PREPARE_EXTEND_MESSAGE',
                         0);
   EXCEPTION
      WHEN OTHERS
      THEN
         v_err_msg :=
            SUBSTR (
               SQLERRM || CHR (10) || DBMS_UTILITY.format_error_backtrace,
               1,
               1023);

         INSERT_ACTION_LOG ('DATABASE',
                            'PREPARE_EXTEND_MESSAGE',
                            'ERROR: ' || v_err_msg,
                            3);
   END;

   -- TEST UNIT: DONE
   PROCEDURE RESPONSE_PROVISIONING
   IS
      v_err_msg   VARCHAR2 (1023);

      d_begin     DATE;
      d_end       DATE;
   BEGIN
      SELECT SYSDATE, SYSDATE + MT_PACKAGE.RESP_PROV_TOL / 1440
        INTO d_begin, d_end
        FROM DUAL;

      MERGE INTO MTPKG_MESSAGE_QUEUE MQ
           USING (SELECT S1.MSISDN,
                         C1.RESP_TYPE,
                         LC.SEND_TIME,
                         C1.SUBCONTENTS,
                         S1.PKGD_ID
                    FROM MTPKG_SUBSCRIBER S1
                         JOIN MTPKG_PACKAGE_DETAIL PD
                            ON S1.PKGD_ID = PD.PKGD_ID
                         JOIN MTPKG_PACKAGE P
                            ON P.PKG_ID = PD.PKG_ID
                         JOIN MTPKG_CONTENT C1
                            ON (C1.PKG_ID = P.PKG_ID AND C1.status = 1)
                         JOIN (SELECT pkgd_id,
                                      TO_DATE (
                                            TO_CHAR (SYSDATE, 'YYYY-MM-DD')
                                         || ' '
                                         || TO_CHAR (SEND_TIME, 'HH24:MI:SS'),
                                         'YYYY-MM-DD HH24:MI:SS')
                                         send_time
                                 FROM mtpkg_schedule
                                WHERE     status = 0
                                      AND (   time_type = 0
                                           OR (    time_type = 1
                                               AND ',' || time_select || ',' LIKE
                                                         '%,'
                                                      || TO_CHAR (SYSDATE,
                                                                  'DY')
                                                      || ',%')
                                           OR (    time_type = 2
                                               AND ',' || time_select || ',' LIKE
                                                         '%,'
                                                      || TO_NUMBER (
                                                            TO_CHAR (SYSDATE,
                                                                     'dd'))
                                                      || ',%'))
                                      AND TO_DATE (
                                                TO_CHAR (SYSDATE,
                                                         'YYYY-MM-DD')
                                             || ' '
                                             || TO_CHAR (SEND_TIME,
                                                         'HH24:MI:SS'),
                                             'YYYY-MM-DD HH24:MI:SS') BETWEEN d_begin
                                                                          AND d_end) LC
                            ON PD.PKGD_ID = LC.pkgd_id
                   WHERE P.STATUS = 1 AND S1.STATUS < 10 AND S1.STATUS > 0) T
              ON (    MQ.MSISDN = T.MSISDN
                  AND MQ.PKGD_ID = T.PKGD_ID
                  AND MQ.SEND_TIME = T.SEND_TIME)                 -- Tranh lap
      WHEN NOT MATCHED
      THEN
         INSERT     (MSISDN,
                     STATUS,
                     RESP_TYPE,
                     SEND_TIME,
                     CONTENT,
                     PRIORITY,
                     PKGD_ID)
             VALUES (T.MSISDN,
                     0,
                     T.RESP_TYPE,
                     T.SEND_TIME,
                     T.SUBCONTENTS,
                     0,
                     T.PKGD_ID);

      COMMIT;

      INSERT_ACTION_LOG ('DATABASE',
                         'RESPONSE_PROVISIONING',
                         'DONE: RESPONSE_PROVISIONING',
                         0);
   EXCEPTION
      WHEN OTHERS
      THEN
         v_err_msg :=
            SUBSTR (
               SQLERRM || CHR (10) || DBMS_UTILITY.format_error_backtrace,
               1,
               1023);

         INSERT_ACTION_LOG ('DATABASE',
                            'RESPONSE_PROVISIONING',
                            'ERROR: ' || v_err_msg,
                            3);
   END;

   -- TEST UNIT: DONE
   PROCEDURE DAILY_WORK
   IS
      v_err_msg                VARCHAR2 (1023);

      TYPE t_tbl_subscriber_MSISDN IS TABLE OF MTPKG_SUBSCRIBER.MSISDN%TYPE;

      TYPE t_tbl_subscriber_PKGD_ID IS TABLE OF MTPKG_SUBSCRIBER.PKGD_ID%TYPE;

      tbl_subscriber_MSISDN    t_tbl_subscriber_MSISDN;
      tbl_subscriber_PKGD_ID   t_tbl_subscriber_PKGD_ID;

      n_row_count              PLS_INTEGER;

      d_yesterday              DATE;
      d_today                  DATE;
   BEGIN
      INSERT_ACTION_LOG ('DATABASE',
                         'DAILY_WORK',
                         'TODO: DAILY_WORK',
                         0);

      SELECT TRUNC (SYSDATE), TRUNC (SYSDATE - 1)
        INTO d_today, d_yesterday
        FROM DUAL;

      ------------------------------------------------------------------------------------------------------------------
      -- Xoa cac MTPKG_CHARG_RECURRING, MTPKG_BILL
      -- doi voi cac MTPKG_SUBSCRIBER tuong ung
      -- dang co STATUS > 10
      --
      -- TEST UNIT: DONE
      --
      WHILE (TRUE)
      LOOP
            DELETE MTPKG_CHARG_RECURRING CR
             WHERE     (STATUS = 5 OR STATUS = 50)
                   AND EXISTS
                          (SELECT 1
                             FROM MTPKG_SUBSCRIBER S
                            WHERE     CR.MSISDN = S.MSISDN
                                  AND CR.PKGD_ID = S.PKGD_ID
                                  AND S.STATUS > 10 and s.status < 20) -- NguyenTH fix on 2013-12-19
                   AND ROWNUM <= MT_PACKAGE.ROW_LIMIT
         RETURNING MSISDN, PKGD_ID
              BULK COLLECT INTO tbl_subscriber_MSISDN, tbl_subscriber_PKGD_ID;

         n_row_count := SQL%ROWCOUNT;

         IF (n_row_count > 0)
         THEN
            FORALL i
                IN tbl_subscriber_MSISDN.FIRST .. tbl_subscriber_MSISDN.LAST
               DELETE MTPKG_BILL
                WHERE     MSISDN = tbl_subscriber_MSISDN (i)
                      AND PKGD_ID = tbl_subscriber_PKGD_ID (i);

            COMMIT;
         END IF;

         EXIT WHEN n_row_count < MT_PACKAGE.ROW_LIMIT;
      END LOOP;

      ------------------------------------------------------------------------------------------------------------------
      -- Fix truong hop ton tai SUBSCRIBER voi STATUS < 10
      -- nhung khong ton tai MTPKG_BILL
      --
      -- TEST UNIT: DONE
      --
      MERGE INTO MTPKG_BILL B
           USING (SELECT S.MSISDN,
                         S.PKGD_ID,
                           S.REGISTER_TIME
                         + CASE P.PKGD_TYPE
                              WHEN PKGD_TYPE_DAILY THEN USAGE_DAY_DAILY
                              WHEN PKGD_TYPE_WEEKLY THEN USAGE_DAY_WEEKLY
                              ELSE USAGE_DAY_MONTHLY
                           END
                            NEXT_CHARG_TIME,
                         PKGD_TYPE
                    FROM MTPKG_SUBSCRIBER S, MTPKG_PACKAGE_DETAIL P
                   WHERE     S.PKGD_ID = P.PKGD_ID
                         AND S.LAST_UPDATE >= d_yesterday
                         AND S.LAST_UPDATE < d_today
                         -- suspend or active status
                         AND S.status < 10) T
              ON (B.MSISDN = T.MSISDN AND B.PKGD_ID = T.PKGD_ID)
      WHEN NOT MATCHED
      THEN
         INSERT     (B.MSISDN,
                     B.pkgd_id,
                     B.next_charg_time,
                     B.data_part,
                     B.sub_data_part,
                     B.last_update)
             VALUES (T.MSISDN,
                     T.pkgd_id,
                     T.NEXT_CHARG_TIME,
                     TO_NUMBER (TO_CHAR (T.NEXT_CHARG_TIME, 'DD')),
                     TO_NUMBER (TO_CHAR (T.NEXT_CHARG_TIME, 'HH24')),
                     SYSDATE);

      COMMIT;

      ------------------------------------------------------------------------------------------------------------------
      -- Set RETRY = 0 doi voi cac MTPKG_BILL da charge thanh cong ngay hom qua
      --
      --      UPDATE MTPKG_CHARG_RECURRING
      --         SET RETRY = 0
      --       WHERE     (status = 4 OR status = 40)
      --             AND last_update >= d_yesterday
      --             AND last_update < d_today;
      --
      --      COMMIT;

      INSERT_ACTION_LOG ('DATABASE',
                         'DAILY_WORK',
                         'DONE: DAILY_WORK',
                         0);
   EXCEPTION
      WHEN OTHERS
      THEN
         v_err_msg :=
            SUBSTR (
               SQLERRM || CHR (10) || DBMS_UTILITY.format_error_backtrace,
               1,
               1023);

         INSERT_ACTION_LOG ('DATABASE',
                            'DAILY_WORK',
                            'ERROR: ' || v_err_msg,
                            3);
   END;

   -- TEST UNIT: DONE
   PROCEDURE RECURRENT_PROVISIONING
   IS
      v_err_msg                     VARCHAR2 (1023);

      n_today_dd                    PLS_INTEGER;

      n_row_count                   PLS_INTEGER;

      TYPE t_tbl_charg_recurring_MSISDN
         IS TABLE OF MTPKG_CHARG_RECURRING.MSISDN%TYPE;

      TYPE t_tbl_charg_recurring_PKGD_ID
         IS TABLE OF MTPKG_CHARG_RECURRING.PKGD_ID%TYPE;

      TYPE t_tbl_bill_NEXT_CHARG_TIME
         IS TABLE OF MTPKG_BILL.NEXT_CHARG_TIME%TYPE;

      tbl_charg_recurring_MSISDN    t_tbl_charg_recurring_MSISDN;
      tbl_charg_recurring_PKGD_ID   t_tbl_charg_recurring_PKGD_ID;
      tbl_bill_NEXT_CHARG_TIME      t_tbl_bill_NEXT_CHARG_TIME;

      n_day                         PLS_INTEGER;
      n_hour                        PLS_INTEGER;
   BEGIN
      -- 'dd' ngay hom nay
      SELECT TO_CHAR (SYSDATE, 'DD') INTO n_today_dd FROM DUAL;

      ------------------------------------------------------------------------------------------------------------------
      -- Set STATUS = 20 cho cac Subs can mang di tru cuoc
      --
      -- UNIT TEST: DONE
      --
      FOR i IN 0 .. PROVISIONING_TOLERANCE    -- Gio hien tai va 1 gio sap toi
      LOOP
         SELECT TO_NUMBER (TO_CHAR (SYSDATE + (i / 24), 'DD')),
                TO_NUMBER (TO_CHAR (SYSDATE + (i / 24), 'HH24'))
           INTO n_day, n_hour
           FROM DUAL;

         -- ACTIVE
         MERGE INTO MTPKG_CHARG_RECURRING CR
              USING (SELECT B.MSISDN, B.PKGD_ID, B.NEXT_CHARG_TIME
                       FROM MTPKG_BILL B, MTPKG_SUBSCRIBER S
                      WHERE     B.DATA_PART = n_day
                            AND B.SUB_DATA_PART = n_hour
                            AND (  B.NEXT_CHARG_TIME
                                 - PROVISIONING_TOLERANCE_PLUS / 24 < SYSDATE)
                            AND B.MSISDN = S.MSISDN
                            AND B.PKGD_ID = S.PKGD_ID
                            AND S.STATUS < 10
                            AND S.STATUS > 0
                            AND B.IS_PROVISIONED = 0) T
                 ON (CR.MSISDN = T.MSISDN AND CR.PKGD_ID = T.PKGD_ID)
         WHEN MATCHED
         THEN
            UPDATE SET CR.STATUS = 20,
                       CR.CHARG_TIME = T.NEXT_CHARG_TIME,
                       CR.LAST_UPDATE = SYSDATE,
                       CR.LAST_UPDATE_BY = 'RECURRENT_PROVISIONING ACTIVE',
                       CR.ERROR_DETAIL = '_'
         WHEN NOT MATCHED
         THEN
            INSERT     (CR.MSISDN,
                        CR.PKGD_ID,
                        CR.STATUS,
                        CR.RETRY,
                        CR.CHARG_TIME,
                        CR.LAST_UPDATE,
                        CR.LAST_UPDATE_BY,
                        CR.ERROR_DETAIL,
                        CR.DATA_PART)
                VALUES (T.MSISDN,
                        T.PKGD_ID,
                        20,
                        0,
                        T.NEXT_CHARG_TIME,
                        SYSDATE,
                        'RECURRENT_PROVISIONING ACTIVE',
                        NULL,
                        SUBSTR (T.MSISDN, -1));

         COMMIT;

         -- TEMP SUBSCRIBER
         MERGE INTO MTPKG_CHARG_RECURRING CR
              USING (SELECT B.MSISDN, B.PKGD_ID, B.NEXT_CHARG_TIME
                       FROM MTPKG_BILL B, MTPKG_SUBSCRIBER S
                      WHERE     B.DATA_PART = n_day
                            AND B.SUB_DATA_PART = n_hour
                            AND B.MSISDN = S.MSISDN
                            AND B.PKGD_ID = S.PKGD_ID
                            AND S.STATUS = 20) T
                 ON (CR.MSISDN = T.MSISDN AND CR.PKGD_ID = T.PKGD_ID)
         WHEN NOT MATCHED
         THEN
            INSERT     (CR.MSISDN,
                        CR.PKGD_ID,
                        CR.STATUS,
                        CR.RETRY,
                        CR.CHARG_TIME,
                        CR.LAST_UPDATE,
                        CR.LAST_UPDATE_BY,
                        CR.ERROR_DETAIL,
                        CR.DATA_PART)
                VALUES (T.MSISDN,
                        T.PKGD_ID,
                        20,
                        1,        -- De xu ly gan giong voi Suspend Subscriber
                        T.NEXT_CHARG_TIME,
                        SYSDATE,
                        'RECURRENT_PROVISIONING TEMP SUBSCRIBER',
                        NULL,
                        SUBSTR (T.MSISDN, -1));

         COMMIT;


         -- SUSPEND, TEMP SUBSCRIBER
         WHILE (TRUE)
         LOOP
            SELECT CR.MSISDN, CR.PKGD_ID, B.NEXT_CHARG_TIME
              BULK COLLECT INTO tbl_charg_recurring_MSISDN,
                   tbl_charg_recurring_PKGD_ID,
                   tbl_bill_NEXT_CHARG_TIME
              FROM MTPKG_BILL B
                   INNER JOIN MTPKG_CHARG_RECURRING CR
                      ON (B.MSISDN = CR.MSISDN) AND (B.PKGD_ID = CR.PKGD_ID)
                   INNER JOIN MTPKG_SUBSCRIBER S
                      ON (S.MSISDN = B.MSISDN) AND (S.PKGD_ID = B.PKGD_ID)
             WHERE     B.DATA_PART = n_day
                   AND B.SUB_DATA_PART = n_hour
                   AND (B.NEXT_CHARG_TIME - PROVISIONING_TOLERANCE_PLUS / 24 <
                           SYSDATE)
                   AND ROWNUM <= MT_PACKAGE.ROW_LIMIT
                   AND (S.STATUS = 0 OR S.STATUS = 20)
                   AND CR.STATUS = 50
                   AND CR.RETRY > 0 -- Cu mang di tru cuoc la retry = retry + 1
                   AND CR.RETRY < MAX_DELAY_DAY + 1
                   AND B.IS_PROVISIONED = 0;

            n_row_count := SQL%ROWCOUNT;

            IF (n_row_count > 0)
            THEN
               FORALL i
                   IN tbl_charg_recurring_MSISDN.FIRST ..
                      tbl_charg_recurring_MSISDN.LAST
                  UPDATE MTPKG_CHARG_RECURRING
                     SET CHARG_TIME = tbl_bill_NEXT_CHARG_TIME (i),
                         STATUS = 20,
                         LAST_UPDATE = SYSDATE,
                         LAST_UPDATE_BY = 'RECURRENT_PROVISIONING RETRY'
                   WHERE     MSISDN = tbl_charg_recurring_MSISDN (i)
                         AND PKGD_ID = tbl_charg_recurring_PKGD_ID (i);

               COMMIT;
            END IF;

            EXIT WHEN n_row_count < MT_PACKAGE.ROW_LIMIT;
         END LOOP;


         ------------------------------------------------------------------------------------------------------------------
         -- Update MTPKG_BILL.IS_PROVISIONED = TRUE
         --
         -- TEST UNIT: DONE
         --
         WHILE (TRUE)
         LOOP
            SELECT CR.MSISDN, CR.PKGD_ID
              BULK COLLECT INTO tbl_charg_recurring_MSISDN,
                   tbl_charg_recurring_PKGD_ID
              FROM    MTPKG_BILL B
                   INNER JOIN
                      MTPKG_CHARG_RECURRING CR
                   ON (B.MSISDN = CR.MSISDN AND B.PKGD_ID = CR.PKGD_ID)
             WHERE     B.DATA_PART = n_day
                   AND B.SUB_DATA_PART = n_hour
                   AND ROWNUM <= MT_PACKAGE.ROW_LIMIT
                   AND CR.STATUS = 20;

            n_row_count := SQL%ROWCOUNT;

            IF (n_row_count > 0)
            THEN
               FORALL i
                   IN tbl_charg_recurring_MSISDN.FIRST ..
                      tbl_charg_recurring_MSISDN.LAST
                  UPDATE MTPKG_BILL
                     SET IS_PROVISIONED = 1
                   WHERE     MSISDN = tbl_charg_recurring_MSISDN (i)
                         AND PKGD_ID = tbl_charg_recurring_PKGD_ID (i);

               COMMIT;
            END IF;

            EXIT WHEN n_row_count < MT_PACKAGE.ROW_LIMIT;
         END LOOP;
      END LOOP;


      ------------------------------------------------------------------------------------------------------------------
      -- Update recurrent charge fee
      --
      -- TEST UNIT: DONE
      --
      FOR i IN 0 .. 9
      LOOP
         UPDATE MTPKG_CHARG_RECURRING CR
            SET CHARG_FEE =
                   (SELECT NVL (RECURRENT_FEE, 0)
                      FROM MTPKG_PACKAGE_DETAIL PD
                     WHERE CR.PKGD_ID = PD.PKGD_ID),
                STATUS = 2
          WHERE CR.DATA_PART = i AND CR.STATUS = 20;

         COMMIT;
      END LOOP;

      INSERT_ACTION_LOG ('DATABASE',
                         'RECURRENT_PROVISIONING',
                         'DONE: RECURRENT_PROVISIONING',
                         0);
   EXCEPTION
      WHEN OTHERS
      THEN
         v_err_msg :=
            SUBSTR (
               SQLERRM || CHR (10) || DBMS_UTILITY.format_error_backtrace,
               1,
               1023);

         INSERT_ACTION_LOG ('DATABASE',
                            'RECURRENT_PROVISIONING',
                            'ERROR: ' || v_err_msg,
                            3);
   END;


   PROCEDURE RECOVER_PROCESS
   IS
      v_err_msg                  VARCHAR2 (1023);

      --
      TYPE msisdn_arr_type IS TABLE OF MTPKG_CHARG_RECURRING.MSISDN%TYPE;

      TYPE pkgd_id_arr_type IS TABLE OF MTPKG_CHARG_RECURRING.PKGD_ID%TYPE;

      TYPE status_arr_type IS TABLE OF MTPKG_CHARG_RECURRING.STATUS%TYPE;

      TYPE money_arr_type IS TABLE OF MTPKG_CHARG_RECURRING.CHARG_FEE%TYPE;

      --
      arr_msisdn                 msisdn_arr_type;
      arr_status                 status_arr_type;
      arr_charg_fee              money_arr_type;

      --
      arr_pkgd_id                pkgd_id_arr_type;

      --
      arr_out_msisdn             msisdn_arr_type;
      arr_out_pkgd_id            pkgd_id_arr_type;

      v_msg_recover_successful   VARCHAR2 (255);
      v_msg_recover_failed       VARCHAR2 (255);
   BEGIN
      INSERT_ACTION_LOG ('DATABASE',
                         'RECOVER_PROCESS',
                         'TODO: RECOVER_PROCESS',
                         0);

      v_msg_recover_successful :=
         MT_PACKAGE.GET_MTPKG_CONFIG ('SMS', 'SMS_RECOVER_SUCCESSFUL');

      v_msg_recover_failed :=
         MT_PACKAGE.GET_MTPKG_CONFIG ('SMS', 'SMS_RECOVER_FAILED');

      -- Lay toan bo monthly_billing co STATUS = 4, 5, 40, 50
      -- va ton tai MSISDN, PKGD_ID trong MTPKG_RECOVER_REQ voi STATUS = 1
      SELECT MSISDN,
             PKGD_ID,
             STATUS,
             CHARG_FEE
        BULK COLLECT INTO arr_msisdn,
             arr_pkgd_id,
             arr_status,
             arr_charg_fee
        FROM MTPKG_CHARG_RECURRING a
       WHERE     STATUS IN (4, 5, 40, 50)
             AND EXISTS
                    (SELECT 1
                       FROM MTPKG_RECOVER_REQ b
                      WHERE     a.MSISDN = b.MSISDN
                            AND A.PKGD_ID = B.PKGD_ID
                            AND b.STATUS = 1);

      IF arr_msisdn.COUNT > 0
      THEN
         FOR j IN arr_msisdn.FIRST .. arr_msisdn.LAST
         LOOP
            IF arr_status (j) = 4 OR arr_status (j) = 40
            THEN
               UPDATE LIVESCREEN.MTPKG_SUBSCRIBER
                  SET STATUS = 3,
                      LAST_UPDATE = SYSDATE,
                      LAST_UPDATE_BY = 'RECOVER_PROCESS'
                WHERE MSISDN = arr_msisdn (j) AND PKGD_ID = arr_pkgd_id (j);

               INSERT INTO LIVESCREEN.MTPKG_MESSAGE_QUEUE (MSISDN,
                                                           PKGD_ID,
                                                           STATUS,
                                                           RESP_TYPE,
                                                           SEND_TIME,
                                                           CONTENT,
                                                           PRIORITY)
                    VALUES (arr_msisdn (j),
                            arr_pkgd_id (j),
                            0,
                            MT_PACKAGE.RESP_TYPE_SMS,
                            SYSDATE,
                            v_msg_recover_successful,
                            1);                              -- hight priority
            ELSE
               INSERT INTO LIVESCREEN.MTPKG_MESSAGE_QUEUE (MSISDN,
                                                           PKGD_ID,
                                                           STATUS,
                                                           RESP_TYPE,
                                                           SEND_TIME,
                                                           CONTENT,
                                                           PRIORITY)
                    VALUES (arr_msisdn (j),
                            arr_pkgd_id (j),
                            0,
                            MT_PACKAGE.RESP_TYPE_SMS,
                            SYSDATE,
                            v_msg_recover_failed,
                            1);                              -- hight priority
            END IF;
         -- Vi hien tai ko can thong bao cho subs khi yeu cau khoi phuc
         -- khong thanh cong nen ko can xu ly STATUS = 5, 50
         END LOOP;

         -- Voi cac MTPKG_CHARG_RECURRING.STATUS = 4, 40, 5, 50
         -- update trang thai da xu ly MTPKG_RECOVER_REQ
         FORALL j IN arr_msisdn.FIRST .. arr_msisdn.LAST
            DELETE MTPKG_RECOVER_REQ
             WHERE     MSISDN = arr_msisdn (j)
                   AND PKGD_ID = arr_pkgd_id (j)
                   AND STATUS = 1;

         COMMIT;
      END IF;

      -- Mang di xu ly cac MTPKG_RECOVER_REQ
      --
      -- TEST UNIT: DONE
      --
      SELECT DISTINCT RR.MSISDN, RR.PKGD_ID
        BULK COLLECT INTO arr_msisdn, arr_pkgd_id
        FROM MTPKG_RECOVER_REQ RR, MTPKG_SUBSCRIBER S
       WHERE     RR.MSISDN = S.MSISDN
             AND RR.PKGD_ID = S.PKGD_ID
             AND RR.STATUS = 0;

      IF (arr_msisdn.COUNT > 0)
      THEN
         FOR indx IN 1 .. arr_msisdn.COUNT
         LOOP
               -- Update MTPKG_CHARG_RECURRING.STATUS = 2 de duoc mang di tru phi
               UPDATE MTPKG_CHARG_RECURRING CR
                  SET STATUS = 2,
                      error_detail = NULL,
                      charg_fee =
                         (SELECT NVL (RECURRENT_FEE, 0)
                            FROM MTPKG_PACKAGE_DETAIL PD
                           WHERE CR.PKGD_ID = PD.PKGD_ID),
                      priority = 1,
                      LAST_UPDATE = SYSDATE,
                      LAST_UPDATE_BY = 'RECOVER_PROCESS'
                WHERE     CR.DATA_PART = SUBSTR (arr_msisdn (indx), -1)
                      AND CR.MSISDN = arr_msisdn (indx)
                      AND CR.PKGD_ID = arr_pkgd_id (indx)
                      AND CR.STATUS = 50
            RETURNING MSISDN, PKGD_ID
                 BULK COLLECT INTO arr_out_msisdn, arr_out_pkgd_id;
         END LOOP;

         IF arr_out_msisdn.COUNT > 0
         THEN
            FORALL i IN arr_out_msisdn.FIRST .. arr_out_msisdn.LAST
               INSERT INTO MTPKG_RECOVER_WAIT (MSISDN, PKGD_ID, last_update)
                    VALUES (arr_out_msisdn (i), arr_out_pkgd_id (i), SYSDATE);
         END IF;

         -- Update toan bo cac MTPKG_RECOVER_REQ.STATUS = 0 thanh STATUS = 1
         -- bao gom cac cac yeu cau KP ko hop le
         -- (nhung se ko bi xoa di trong MTPKG_RECOVER_REQ
         -- vi ko ton tai ban ghi trong MTPKG_CHARG_RECURRING)
         FORALL i IN arr_msisdn.FIRST .. arr_msisdn.LAST
            UPDATE MTPKG_RECOVER_REQ
               SET STATUS = 1
             WHERE MSISDN = arr_msisdn (i) AND PKGD_ID = arr_pkgd_id (i);

         -- delete MTPKG_RECOVER_REQ where MSISDN = arr_msisdn2(i);
         COMMIT;
      END IF;


      INSERT_ACTION_LOG ('DATABASE',
                         'RECOVER_PROCESS',
                         'DONE: RECOVER_PROCESS',
                         0);
   EXCEPTION
      WHEN OTHERS
      THEN
         v_err_msg :=
            SUBSTR (
               SQLERRM || CHR (10) || DBMS_UTILITY.format_error_backtrace,
               1,
               1023);

         INSERT_ACTION_LOG ('DATABASE',
                            'RECOVER_PROCESS',
                            'ERROR: ' || v_err_msg,
                            3);
   END;

   PROCEDURE HANDLE_CHARGING_RESULT
   AS
      v_now_minus_1_minute       DATE;
      v_err_msg                  VARCHAR2 (1023);
      v_row_limit                PLS_INTEGER;

      TYPE t_tbl_msisdn IS TABLE OF MTPKG_CHARG_RECURRING.MSISDN%TYPE;

      TYPE t_tbl_pkgd_id IS TABLE OF MTPKG_CHARG_RECURRING.PKGD_ID%TYPE;

      TYPE t_tbl_retry IS TABLE OF MTPKG_CHARG_RECURRING.retry%TYPE;

      TYPE t_tbl_next_charg_time IS TABLE OF MTPKG_BILL.NEXT_CHARG_TIME%TYPE;

      TYPE t_tbl_day IS TABLE OF PLS_INTEGER;

      TYPE t_tbl_hour IS TABLE OF PLS_INTEGER;

      --duongma them
      TYPE t_tbl_pkgd_name IS TABLE OF mtpkg_package_detail.pkgd_name%TYPE;

      TYPE t_tbl_recurrent_fee
         IS TABLE OF mtpkg_package_detail.recurrent_fee%TYPE;

      TYPE t_tbl_pkgd_type IS TABLE OF mtpkg_package_detail.pkgd_type%TYPE;

      tbl_msisdn                 t_tbl_msisdn;
      tbl_pkgd_id                t_tbl_pkgd_id;

      tbl_next_charg_time        t_tbl_next_charg_time;
      tbl_old_day                t_tbl_day;
      tbl_old_hour               t_tbl_hour;

      v_grun_end                 NUMBER;
      v_grun_begin               NUMBER;

      -- duongma them
      v_daily_extend_success     VARCHAR2 (1024);
      v_weekly_extend_success    VARCHAR2 (1024);
      v_monthly_extend_success   VARCHAR2 (1024);

      v_sms                      VARCHAR2 (1024);
      v_send_time                DATE;
      v_sub_time                 NUMBER;
      v_fee                      VARCHAR2(500);

      tbl_pkgd_name              t_tbl_pkgd_name;
      tbl_recurrent_fee          t_tbl_recurrent_fee;
      tbl_pkgd_type              t_tbl_pkgd_type;
   BEGIN
      INSERT_ACTION_LOG ('DATABASE',
                         'HANDLE_CHARGING_RESULT',
                         'TODO: HANDLE_CHARGING_RESULT',
                         0);

      v_row_limit := 1000;

      -- Mot phut truoc day
      SELECT SYSDATE - 1 / 1440 INTO v_now_minus_1_minute FROM DUAL;

      v_grun_begin := DBMS_UTILITY.get_time;


      --  CHARGE: FAILED
      WHILE (TRUE)
      LOOP
         -- ACTIVE -> SUSPEND
         SELECT mb.MSISDN, MB.PKGD_ID
           BULK COLLECT INTO tbl_msisdn, tbl_pkgd_id
           FROM MTPKG_CHARG_RECURRING mb, MTPKG_SUBSCRIBER pr
          WHERE     PR.MSISDN = MB.MSISDN
                AND PR.PKGD_ID = MB.PKGD_ID
                AND mb.STATUS = 5
                AND pr.STATUS < 10
                AND pr.STATUS > 0
                AND ROWNUM <= v_row_limit;

         FORALL i IN tbl_msisdn.FIRST .. tbl_msisdn.LAST
            UPDATE MTPKG_CHARG_RECURRING CR
               SET STATUS = 50,
                   LAST_UPDATE = SYSDATE,
                   LAST_UPDATE_BY = 'HANDLE_CHARGING_RESULT SUSPEND'
             WHERE     DATA_PART = SUBSTR (tbl_msisdn (i), -1)
                   AND MSISDN = tbl_msisdn (i)
                   AND PKGD_ID = tbl_pkgd_id (i);

         COMMIT;

         FORALL i IN tbl_msisdn.FIRST .. tbl_msisdn.LAST
            UPDATE MTPKG_BILL
               SET DATA_PART = TO_NUMBER (TO_CHAR (NEXT_CHARG_TIME + 1, 'DD')),
                   SUB_DATA_PART =
                      TO_NUMBER (TO_CHAR (NEXT_CHARG_TIME + 1, 'HH24')),
                   NEXT_CHARG_TIME = NEXT_CHARG_TIME + 1,
                   LAST_UPDATE = SYSDATE,
                   IS_PROVISIONED = 0
             WHERE MSISDN = tbl_msisdn (i) AND PKGD_ID = tbl_pkgd_id (i);

         COMMIT;

         -- Subscriber Status: Active -> Suspend
         FORALL i IN tbl_msisdn.FIRST .. tbl_msisdn.LAST
            UPDATE MTPKG_SUBSCRIBER
               SET STATUS = 0, LAST_UPDATE = SYSDATE
             WHERE MSISDN = tbl_msisdn (i) AND PKGD_ID = tbl_pkgd_id (i);

         COMMIT;

         EXIT WHEN tbl_msisdn.COUNT < v_row_limit;
      END LOOP;


      WHILE (TRUE)
      LOOP
         -- SUSPEND, TEMP SUBSCRIBER: RETRY AGAIN
         SELECT mb.MSISDN, MB.PKGD_ID
           BULK COLLECT INTO tbl_msisdn, tbl_pkgd_id
           FROM MTPKG_CHARG_RECURRING mb, MTPKG_SUBSCRIBER pr
          WHERE     PR.MSISDN = MB.MSISDN
                AND PR.PKGD_ID = MB.PKGD_ID
                AND mb.STATUS = 5
                AND (pr.STATUS = 0 OR pr.STATUS = 20)
                AND ROWNUM <= v_row_limit;

         FORALL i IN tbl_msisdn.FIRST .. tbl_msisdn.LAST
            UPDATE MTPKG_CHARG_RECURRING
               SET STATUS = 50,
                   LAST_UPDATE = SYSDATE,
                   LAST_UPDATE_BY = 'HANDLE_CHARGING_RESULT RETRY'
             WHERE     DATA_PART = SUBSTR (tbl_msisdn (i), -1)
                   AND MSISDN = tbl_msisdn (i)
                   AND PKGD_ID = tbl_pkgd_id (i);

         COMMIT;

         FORALL i IN tbl_msisdn.FIRST .. tbl_msisdn.LAST
            UPDATE MTPKG_BILL
               SET DATA_PART = TO_NUMBER (TO_CHAR (NEXT_CHARG_TIME + 1, 'DD')),
                   SUB_DATA_PART =
                      TO_NUMBER (TO_CHAR (NEXT_CHARG_TIME + 1, 'HH24')),
                   NEXT_CHARG_TIME = NEXT_CHARG_TIME + 1,
                   LAST_UPDATE = SYSDATE,
                   IS_PROVISIONED = 0
             WHERE MSISDN = tbl_msisdn (i) AND PKGD_ID = tbl_pkgd_id (i);

         COMMIT;

         EXIT WHEN tbl_msisdn.COUNT < v_row_limit;
      END LOOP;


      v_grun_end := DBMS_UTILITY.get_time;
      INSERT_ACTION_LOG (
         'DATABASE',
         'HANDLE_CHARGING_RESULT',
            '--> FAILED CHARGING PROCESS '
         || v_grun_begin
         || ' - '
         || v_grun_end,
         0);

      ------------------------------------------------------------------------------------------------------------------
      -- Set Active Status cho 3 truong hop
      --   1. Charge thanh cong lan dau (retry = 0)
      --   2. Charge thanh cong sau khi retry (retry >= 1)
      --   3. Charge thanh cong cac TEMP SUBSCRIBER (retry >= 1)
      --
      v_grun_begin := DBMS_UTILITY.get_time;

      -- duongma moi them
      v_daily_extend_success :=
         MT_PACKAGE.GET_MTPKG_CONFIG ('SMS', 'SMS_DAILY_EXTEND_SUCCESS');
      v_weekly_extend_success :=
         MT_PACKAGE.GET_MTPKG_CONFIG ('SMS', 'SMS_WEEKLY_EXTEND_SUCCESS');
      v_monthly_extend_success :=
         MT_PACKAGE.GET_MTPKG_CONFIG ('SMS', 'SMS_MONTHLY_EXTEND_SUCCESS');

      FOR k IN 0 .. 9
      LOOP
         WHILE (TRUE)
         LOOP
            SELECT CR.MSISDN,
                   CR.PKGD_ID,
                   B.DATA_PART,
                   B.SUB_DATA_PART,
                   CASE PD.PKGD_TYPE
                      WHEN MT_PACKAGE.PKGD_TYPE_DAILY
                      THEN
                         CR.CHARG_TIME + MT_PACKAGE.USAGE_DAY_DAILY
                      WHEN MT_PACKAGE.PKGD_TYPE_WEEKLY
                      THEN
                         CR.CHARG_TIME + MT_PACKAGE.USAGE_DAY_WEEKLY
                      ELSE
                         CR.CHARG_TIME + MT_PACKAGE.USAGE_DAY_MONTHLY
                   END,
                   PD.PKGD_NAME,
                   PD.PKGD_TYPE,
                   PD.RECURRENT_FEE
              BULK COLLECT INTO tbl_msisdn,
                   tbl_pkgd_id,
                   tbl_old_day,
                   tbl_old_hour,
                   tbl_next_charg_time,
                   tbl_pkgd_name,
                   tbl_pkgd_type,
                   tbl_recurrent_fee
              FROM MTPKG_BILL B,
                   MTPKG_CHARG_RECURRING CR,
                   MTPKG_PACKAGE_DETAIL PD
             WHERE     CR.DATA_PART = k
                   AND B.MSISDN = CR.MSISDN
                   AND B.PKGD_ID = CR.PKGD_ID
                   AND CR.PKGD_ID = PD.PKGD_ID
                   AND CR.STATUS = 4
                   AND ROWNUM <= v_row_limit;

            IF tbl_msisdn.COUNT > 0
            THEN
               -- MTPKG_CHARG_RECURRING
               FORALL i IN tbl_msisdn.FIRST .. tbl_msisdn.LAST
                  UPDATE MTPKG_CHARG_RECURRING
                     SET STATUS = 40,
                         retry = 0,
                         LAST_UPDATE = SYSDATE,
                         LAST_UPDATE_BY = 'HANDLE_CHARGING_RESULT ACTIVE'
                   WHERE     data_part = SUBSTR (tbl_msisdn (i), -1)
                         AND MSISDN = tbl_msisdn (i)
                         AND PKGD_ID = tbl_pkgd_id (i);

               -- MTPKG_BILL
               FORALL i IN tbl_msisdn.FIRST .. tbl_msisdn.LAST
                  UPDATE MTPKG_BILL
                     SET data_part = TO_CHAR (tbl_next_charg_time (i), 'DD'),
                         sub_data_part =
                            TO_CHAR (tbl_next_charg_time (i), 'HH24'),
                         next_charg_time = tbl_next_charg_time (i),
                         expired_time = tbl_next_charg_time (i),
                         last_update = SYSDATE,
                         IS_PROVISIONED = 0
                   WHERE     DATA_PART = tbl_old_day (i)
                         AND SUB_DATA_PART = tbl_old_hour (i)
                         AND MSISDN = tbl_msisdn (i)
                         AND PKGD_ID = tbl_pkgd_id (i);

               -- MTPKG_CHARG_RECURRING
               -- Chi cho 2 TH:
               --    Suspend -> Active
               --    Temp Register -> Active
               -- Truong hop KP job RECOVER_PROCESS da xu ly
               FORALL i IN tbl_msisdn.FIRST .. tbl_msisdn.LAST
                  UPDATE MTPKG_SUBSCRIBER
                     SET STATUS = 3, LAST_UPDATE = SYSDATE
                   WHERE     MSISDN = tbl_msisdn (i)
                         AND PKGD_ID = tbl_pkgd_id (i)
                         AND STATUS = 0; -- ### check lai co nen them status = 20 ko?

               --===========================================================================================


               -- Gui tin khi thanh cong gia han
               FOR i IN 1 .. tbl_msisdn.COUNT
               LOOP
                  BEGIN
                     ----------------------------------------
                     -- INSERT VASGATE
                     INSERT INTO VASGATE_SYNC (REQ_ID,
                                               MSISDN,
                                               REQ_TIME,
                                               STATUS,
                                               REQ_MSG,
                                               EXTEND_TIME,
                                               PRICE,
                                               PACKAGE,
                                               RETRY,
                                               STATE,
                                               LASTUPDATE,
                                               ERROR_DETAIL,
                                               SERVICE_ID,
                                               CHANNEL)
                          VALUES (
                                       SUBSTR (tbl_msisdn (i),
                                               3,
                                               LENGTH (tbl_msisdn (i)))
                                    || SEQ_VASGATE.NEXTVAL,
                                    SUBSTR (tbl_msisdn (i),
                                            3,
                                            LENGTH (tbl_msisdn (i))),
                                    TO_CHAR (SYSDATE,
                                             'dd/mm/yyyy hh24:mi:ss'),
                                    4,
                                    'SYSTEM',
                                    func_extend_time (4,
                                                      tbl_pkgd_type (i),
                                                      SYSDATE),
                                    tbl_recurrent_fee (i),
                                    tbl_pkgd_id (i),
                                    0,
                                    0,
                                    SYSDATE,
                                    '',
                                    '2881',
                                    'SYSTEM');

                     ---------------------------------
                     v_fee := tbl_recurrent_fee (i);

                     IF (tbl_pkgd_type(i) = MT_PACKAGE.PKGD_TYPE_DAILY)
                     THEN                                              -- NGAY
                        SELECT (TRUNC (SYSDATE) - TRUNC (register_time))
                          INTO v_sub_time
                          FROM mtpkg_subscriber
                         WHERE     msisdn = tbl_msisdn (i)
                               AND pkgd_id = tbl_pkgd_id (i)
                               AND status < 10
                               AND status > 0;

                        v_sms := '';

                        IF (v_sub_time > 0 AND MOD (v_sub_time, 14) = 0)
                        THEN
                           v_fee := v_fee || 'd/ngay';
                           v_sms :=
                              REPLACE (
                                 REPLACE (
                                    REPLACE (
                                       REPLACE (v_daily_extend_success,
                                                '[Ten goi tin]',
                                                tbl_pkgd_name (i)),
                                       '[MAGOI]',
                                       tbl_pkgd_id (i)),
                                    '[Xd/ngay]',
                                    v_fee),
                                 '[dd/mm/yyyy]',
                                 TO_CHAR (tbl_next_charg_time (i),
                                          'dd/mm/yyyy'));
                        END IF;
                     ELSIF (tbl_pkgd_type (i) = MT_PACKAGE.PKGD_TYPE_WEEKLY)
                     THEN                                              -- TUAN
                        v_fee := v_fee || 'd/7ngay';
                        v_sms :=
                           REPLACE (
                              REPLACE (
                                 REPLACE (
                                    REPLACE (v_weekly_extend_success,
                                             '[Ten goi tin]',
                                             tbl_pkgd_name (i)),
                                    '[MAGOI]',
                                    tbl_pkgd_id (i)),
                                 '[Xd/7ngay]',
                                 v_fee),
                              '[dd/mm/yyyy]',
                              TO_CHAR (tbl_next_charg_time (i), 'dd/mm/yyyy'));
                     ELSE                                             -- THANG
                        v_fee := v_fee || 'd/30ngay';
                        v_sms :=
                           REPLACE (
                              REPLACE (
                                 REPLACE (
                                    REPLACE (v_monthly_extend_success,
                                             '[Ten goi tin]',
                                             tbl_pkgd_name (i)),
                                    '[MAGOI]',
                                    tbl_pkgd_id (i)),
                                 '[Xd/30ngay]',
                                v_fee),
                              '[dd/mm/yyyy]',
                              TO_CHAR (tbl_next_charg_time (i), 'dd/mm/yyyy'));
                     END IF;

                     v_send_time := SYSDATE;

                     IF (TO_DATE (
                               TO_CHAR (TRUNC(SYSDATE), 'dd/mm/yyyy')
                            || ' 07:00:00',
                            'dd/mm/yyyy hh24:mi:ss') > SYSDATE)
                     THEN
                        v_send_time :=
                           TO_DATE (
                                 TO_CHAR (TRUNC (SYSDATE), 'dd/mm/yyyy')
                              || ' 07:00:00',
                              'dd/mm/yyyy hh24:mi:ss');
                     ELSIF (TO_DATE (
                                  TO_CHAR (TRUNC (SYSDATE), 'dd/mm/yyyy')
                               || ' 22:00:00',
                               'dd/mm/yyyy hh24:mi:ss') < SYSDATE)
                     THEN
                        v_send_time :=
                           TO_DATE (
                                 TO_CHAR (TRUNC (SYSDATE + 1), 'dd/mm/yyyy')
                              || ' 07:00:00',
                              'dd/mm/yyyy hh24:mi:ss');
                     END IF;

                     IF (length(v_sms) > 0)
                     THEN
                        INSERT
                          INTO LIVESCREEN.MTPKG_MESSAGE_QUEUE (MSISDN,
                                                               STATUS,
                                                               RESP_TYPE,
                                                               SEND_TIME,
                                                               CONTENT,
                                                               PRIORITY)
                        VALUES (tbl_msisdn (i),
                                0,
                                MT_PACKAGE.RESP_TYPE_SMS,
                                v_send_time,
                                v_sms,
                                0);
                     END IF;
                  END;
               END LOOP;

               COMMIT;
            END IF;

            EXIT WHEN tbl_msisdn.COUNT < v_row_limit;
         END LOOP;
      END LOOP;

      v_grun_end := DBMS_UTILITY.get_time;
      INSERT_ACTION_LOG (
         'DATABASE',
         'HANDLE_CHARGING_RESULT',
         '--> FORCE_ACTIVE PROCESS ' || v_grun_begin || ' - ' || v_grun_end,
         0);

      v_grun_begin := DBMS_UTILITY.get_time;

      ------------------------------------------------------------------------------------------------------------------
      -- Deactive Subscriber
      --
      WHILE (TRUE)
      LOOP
            DELETE MTPKG_CHARG_RECURRING
             WHERE     (   (status = 50 AND retry >= MAX_DELAY_DAY + 1) -- Need deactive
                        OR status = 501                             -- Huy SIM
                        OR status = 405)                            -- Doi chu
                   AND last_update <= v_now_minus_1_minute
                   AND ROWNUM <= v_row_limit
         RETURNING MSISDN, PKGD_ID
              --       ,
              --                   retry,
              --                   last_update,
              --                   error_detail,
              --                   status
              BULK COLLECT INTO tbl_msisdn, tbl_pkgd_id;

         --       ,
         --                   tbl_retry,
         --                   tbl_last_update,
         --                   tbl_error_detail,
         --                   tbl_status;

         IF tbl_msisdn.COUNT > 0
         THEN
            --            FORALL i IN tbl_msisdn.FIRST .. tbl_msisdn.LAST
            --               INSERT INTO LIVESCREEN.MTPKG_MESSAGE_QUEUE (MSISDN,
            --                                                           STATUS,
            --                                                           RESP_TYPE,
            --                                                           SEND_TIME,
            --                                                           CONTENT,
            --                                                           PRIORITY)
            --                    VALUES (tbl_msisdn (i),
            --                            0,
            --                            MT_PACKAGE.RESP_TYPE_SMS,
            --                            SYSDATE,
            --                            v_msg_deregister_alert,
            --                            1);                              -- hight priority

            --            FORALL i IN tbl_msisdn.FIRST .. tbl_msisdn.LAST
            --               INSERT INTO MTPKG_CHARG_HIS (MSISDN,
            --                                            PKGD_ID,
            --                                            STATUS,
            --                                            retry,
            --                                            last_update,
            --                                            error_detail,
            --                                            data_part)
            --                    VALUES (
            --                              tbl_msisdn (i),
            --                              tbl_pkgd_id (i),
            --                              tbl_status (i),                           -- 50,
            --                              tbl_retry (i),
            --                              tbl_last_update (i),
            --                              tbl_error_detail (i),
            --                              TO_NUMBER (
            --                                 TO_CHAR (tbl_last_update (i), 'yyyymm')));
            --
            --            COMMIT;

            FORALL i IN tbl_msisdn.FIRST .. tbl_msisdn.LAST
               UPDATE MTPKG_SUBSCRIBER
                  SET STATUS = 13, LAST_UPDATE = SYSDATE
                WHERE MSISDN = tbl_msisdn (i) AND PKGD_ID = tbl_pkgd_id (i);

            COMMIT;

            FORALL i IN tbl_msisdn.FIRST .. tbl_msisdn.LAST
               DELETE MTPKG_BILL
                WHERE MSISDN = tbl_msisdn (i) AND PKGD_ID = tbl_pkgd_id (i);

            COMMIT;
         --            FORALL i IN tbl_msisdn.FIRST .. tbl_msisdn.LAST
         --               DELETE MTPKG_CHARG_RECURRING
         --                WHERE MSISDN = tbl_msisdn (i) AND PKGD_ID = tbl_pkgd_id (i);
         --
         --            COMMIT;
         END IF;

         EXIT WHEN tbl_msisdn.COUNT < v_row_limit;
      END LOOP;

      v_grun_end := DBMS_UTILITY.get_time;
      INSERT_ACTION_LOG (
         'DATABASE',
         'HANDLE_CHARGING_RESULT',
         '--> FORCE_DEACTIVE PROCESS ' || v_grun_begin || ' - ' || v_grun_end,
         0);

      INSERT_ACTION_LOG ('DATABASE',
                         'HANDLE_CHARGING_RESULT',
                         'DONE: HANDLE_CHARGING_RESULT',
                         0);
   EXCEPTION
      WHEN OTHERS
      THEN
         v_err_msg :=
            SUBSTR (
               SQLERRM || CHR (10) || DBMS_UTILITY.format_error_backtrace,
               1,
               1023);

         INSERT_ACTION_LOG ('DATABASE',
                            'HANDLE_CHARGING_RESULT',
                            'ERROR: ' || v_err_msg,
                            3);
   END;

   FUNCTION GET_USAGE_DAY_BY_PKG_TYPE (in_PKGD_TYPE IN VARCHAR2)
      RETURN NUMBER
   IS
      v_result   NUMBER;
   BEGIN
      CASE in_PKGD_TYPE
         WHEN PKGD_TYPE_DAILY
         THEN
            v_result := USAGE_DAY_DAILY;
         WHEN PKGD_TYPE_WEEKLY
         THEN
            v_result := USAGE_DAY_WEEKLY;
         ELSE
            -- MONTHLY
            v_result := USAGE_DAY_MONTHLY;
      END CASE;

      RETURN v_result;
   END;



   FUNCTION GET_MTPKG_CONFIG (in_CONFIG_TYPE     IN VARCHAR2,
                              in_CONFIG_NAME     IN VARCHAR2,
                              in_DEFAULT_VALUE   IN VARCHAR2 DEFAULT NULL)
      RETURN VARCHAR2
   IS
      v_result   VARCHAR2 (1023);
   BEGIN
      SELECT CONFIG_VALUE
        INTO v_result
        FROM MTPKG_CONFIG
       WHERE CONFIG_TYPE = in_CONFIG_TYPE AND CONFIG_NAME = in_CONFIG_NAME;

      RETURN v_result;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         v_result := in_DEFAULT_VALUE;
         RETURN v_result;
      WHEN OTHERS
      THEN
         v_result := in_DEFAULT_VALUE;
         RETURN v_result;
   END;

   PROCEDURE INSERT_ACTION_LOG (log_user_name     IN VARCHAR2,
                                log_action        IN VARCHAR2,
                                log_description   IN VARCHAR2,
                                log_level         IN NUMBER)
   IS
   BEGIN
      IF (log_level >= MT_PACKAGE.CURRENT_LOG_LEVEL)
      THEN
         INSERT INTO MTPKG_ACTION_LOG (log_user_name,
                                       log_action,
                                       log_description,
                                       log_time,
                                       log_level)
              VALUES (log_user_name,
                      log_action,
                      log_description,
                      SYSDATE,
                      log_level);

         COMMIT;
      END IF;
   END;

   FUNCTION HAS_BILL (in_MSISDN   IN MTPKG_BILL.MSISDN%TYPE,
                      in_PkgdID   IN MTPKG_BILL.PKGD_ID%TYPE)
      RETURN NUMBER
   IS
      v_MSISDN   VARCHAR2 (30);
      v_result   NUMBER := 0;
   BEGIN
      SELECT MSISDN
        INTO v_MSISDN
        FROM mtpkg_bill
       WHERE MSISDN = in_MSISDN AND PKGD_ID = in_PkgdID;

      IF (v_MSISDN IS NOT NULL)
      THEN
         v_result := 1;
      END IF;

      RETURN v_result;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN 0;
   END HAS_BILL;

   FUNCTION CU_BILL (in_MSISDN      IN MTPKG_BILL.MSISDN%TYPE,
                     in_PkgdID      IN MTPKG_BILL.PKGD_ID%TYPE,
                     in_IS_ACTIVE   IN NUMBER,
                     in_IS_SUCC     IN NUMBER)
      RETURN NUMBER
   IS
      n_count             PLS_INTEGER := 0;
      v_pkgd_type         VARCHAR2 (10);

      d_next_charg_time   DATE;
      n_data_part         PLS_INTEGER;
      n_sub_data_part     PLS_INTEGER;
      n_charg_fee         NUMBER;

      d_tomorrow          DATE;

      n_result            PLS_INTEGER := 0;
   BEGIN
      SELECT COUNT (*)
        INTO n_count
        FROM MTPKG_BILL B
       WHERE B.MSISDN = in_MSISDN AND B.PKGD_ID = in_PkgdID;

      -- Lay ra next_charg_time, data_part, sub_data_part o thoi diem hien tai
      BEGIN
         SELECT PKGD_TYPE
           INTO v_pkgd_type
           FROM MTPKG_PACKAGE_DETAIL PD
          WHERE PD.PKGD_ID = in_PkgdID;

         CASE
            WHEN v_pkgd_type = MT_PACKAGE.PKGD_TYPE_DAILY
            THEN
               d_next_charg_time := SYSDATE + USAGE_DAY_DAILY;
               n_data_part := TO_CHAR (d_next_charg_time, 'DD');
               n_sub_data_part := TO_CHAR (d_next_charg_time, 'HH24');
            WHEN v_pkgd_type = MT_PACKAGE.PKGD_TYPE_WEEKLY
            THEN
               d_next_charg_time := SYSDATE + USAGE_DAY_WEEKLY;
               n_data_part := TO_CHAR (d_next_charg_time, 'DD');
               n_sub_data_part := TO_CHAR (d_next_charg_time, 'HH24');
            WHEN v_pkgd_type = MT_PACKAGE.PKGD_TYPE_MONTHLY
            THEN
               d_next_charg_time := SYSDATE + USAGE_DAY_MONTHLY;
               n_data_part := TO_CHAR (d_next_charg_time, 'DD');
               n_sub_data_part := TO_CHAR (d_next_charg_time, 'HH24');
         END CASE;
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            v_pkgd_type := NULL;
      END;

      IF in_IS_ACTIVE = 1
      THEN
         n_result := 10;

         IF n_count <= 0 AND v_pkgd_type IS NOT NULL
         THEN
            n_charg_fee := MT_PACKAGE.GET_CHARG_FEE (in_MSISDN, in_PkgdID, 1);

            IF in_IS_SUCC = 1
            THEN
               INSERT INTO LIVESCREEN.MTPKG_BILL (MSISDN,
                                                  PKGD_ID,
                                                  NEXT_CHARG_TIME,
                                                  EXPIRED_TIME,
                                                  DATA_PART,
                                                  CHARG_FEE,
                                                  SUB_DATA_PART,
                                                  LAST_UPDATE,
                                                  INSERTED_EXTEND_MSG)
                    VALUES (in_MSISDN,
                            in_PkgdID,
                            d_next_charg_time,
                            d_next_charg_time,
                            n_data_part,
                            n_charg_fee,
                            n_sub_data_part,
                            SYSDATE,
                            0);
            ELSE
               SELECT SYSDATE + 1 INTO d_tomorrow FROM DUAL;

               INSERT INTO LIVESCREEN.MTPKG_BILL (MSISDN,
                                                  PKGD_ID,
                                                  NEXT_CHARG_TIME,
                                                  EXPIRED_TIME,
                                                  DATA_PART,
                                                  CHARG_FEE,
                                                  SUB_DATA_PART,
                                                  LAST_UPDATE,
                                                  INSERTED_EXTEND_MSG)
                    VALUES (in_MSISDN,
                            in_PkgdID,
                            d_tomorrow,
                            NULL,
                            TO_NUMBER (TO_CHAR (d_tomorrow, 'DD')),
                            NULL,               -- Vi co charg duoc xu nao dau
                            TO_NUMBER (TO_CHAR (d_tomorrow, 'HH24')),
                            SYSDATE,
                            0);
            END IF;

            COMMIT;

            n_result := 1;
         END IF;
      ELSE
         n_result := 20;

         IF n_count > 0 AND v_pkgd_type IS NOT NULL
         THEN
            IF in_IS_SUCC = 1
            THEN
               n_charg_fee :=
                  MT_PACKAGE.GET_CHARG_FEE (in_MSISDN, in_PkgdID, 2);

               UPDATE LIVESCREEN.MTPKG_BILL
                  SET NEXT_CHARG_TIME = d_next_charg_time,
                      --                      EXPIRED_TIME = d_next_charg_time,
                      DATA_PART = n_data_part,
                      CHARG_FEE = n_charg_fee,
                      SUB_DATA_PART = n_sub_data_part,
                      LAST_UPDATE = SYSDATE,
                      INSERTED_EXTEND_MSG = 0
                WHERE MSISDN = in_MSISDN AND PKGD_ID = in_PkgdID;
            END IF;

            COMMIT;

            n_result := 2;
         END IF;
      END IF;

      RETURN n_result;
   END;

   PROCEDURE INSERT_MTPKG_BILL (
      in_MSISDN            IN MTPKG_BILL.MSISDN%TYPE,
      in_PKGD_ID           IN MTPKG_BILL.PKGD_ID%TYPE,
      in_NEXT_CHARG_TIME   IN MTPKG_BILL.NEXT_CHARG_TIME%TYPE,
      in_DATA_PART         IN MTPKG_BILL.DATA_PART%TYPE,
      in_CHARG_FEE         IN MTPKG_BILL.CHARG_FEE%TYPE)
   IS
   BEGIN
      INSERT INTO MTPKG_BILL (MSISDN,
                              PKGD_ID,
                              NEXT_CHARG_TIME,
                              DATA_PART,
                              CHARG_FEE)
           VALUES (in_MSISDN,
                   in_PKGD_ID,
                   in_NEXT_CHARG_TIME,
                   in_DATA_PART,
                   in_CHARG_FEE);

      COMMIT;
   END INSERT_MTPKG_BILL;

   PROCEDURE CLEAR_COMMAND_REQ_TABLE
   IS
   BEGIN
      DELETE MTPKG_COMMAND_REQ
       WHERE STATUS = 3;
   END;

   PROCEDURE CLEAR_RECOVER_REQ_TABLE
   IS
   BEGIN
      DELETE MTPKG_RECOVER_REQ
       WHERE SYSDATE - MTPKG_RECOVER_REQ.REQ_TIME > 7;
   END CLEAR_RECOVER_REQ_TABLE;

   PROCEDURE CREATE_PARTITION_CHARG_HIS
   IS
      v_err_msg        VARCHAR2 (1023);
      v_max_part       VARCHAR2 (20);
      v_sql            VARCHAR2 (500);

      v_date           DATE;
      v_today_add_10   DATE;
   BEGIN
      v_today_add_10 := SYSDATE + 10;

      -- MTPKG_CHARG_HIS
      -- Chia partition theo thang
      SELECT SUBSTR (MAX (a.partition_name), 2)
        INTO v_max_part
        FROM user_tab_partitions a
       WHERE table_name = 'MTPKG_CHARG_HIS';

      v_date := TO_DATE (v_max_part, 'yyyymm');

      WHILE v_date < v_today_add_10
      LOOP
         v_sql :=
               'alter table MTPKG_CHARG_HIS add partition P'
            || TO_CHAR (ADD_MONTHS (v_date, 1), 'yyyymm')
            || ' values less than ('
            || TO_CHAR (ADD_MONTHS (v_date, 2), 'yyyymm')
            || ')';

         EXECUTE IMMEDIATE (v_sql);

         DBMS_OUTPUT.put_line (v_sql);

         v_date := ADD_MONTHS (v_date, 1);
      END LOOP;

      INSERT_ACTION_LOG ('DATABASE',
                         'CREATE_PARTITION_CHARG_HIS',
                         'DONE: CREATE_PARTITION_CHARG_HIS',
                         0);
   EXCEPTION
      WHEN OTHERS
      THEN
         v_err_msg :=
            SUBSTR (
               SQLERRM || CHR (10) || DBMS_UTILITY.format_error_backtrace,
               1,
               1023);

         INSERT_ACTION_LOG ('DATABASE',
                            'CREATE_PARTITION_CHARG_HIS',
                            'ERROR: ' || v_err_msg,
                            3);
   END;

   PROCEDURE CREATE_PARTITION_BILL
   IS
      v_err_msg         VARCHAR2 (1023);
      v_sql             VARCHAR2 (500);

      v_count_part      NUMBER;
      v_count_subpart   NUMBER;
   BEGIN
      -- MTPKG_BILL
      -- Chia partition theo ngay (Partition) va gio (Sub partition)

      -- 86 cho truong hop Dang ky dich vu nhung khong du tien
      FOR v_index IN 1 .. 31
      LOOP
         SELECT COUNT (*)
           INTO v_count_part
           FROM user_tab_partitions
          WHERE     table_name = 'MTPKG_BILL'
                AND (partition_name = 'P' || v_index);

         IF v_count_part = 0
         THEN
            -- EXAMPLE: ALTER TABLE MTPKG_BILL
            -- ADD PARTITION P2 VALUES LESS THAN (3) (
            --  SUBPARTITION P2_0 VALUES LESS THAN (1)
            -- );
            v_sql :=
                  'ALTER TABLE MTPKG_BILL ADD PARTITION P'
               || v_index
               || ' VALUES LESS THAN ('
               || (v_index + 1)
               || ') (SUBPARTITION P'
               || v_index
               || '_0 VALUES LESS THAN (1))';

            INSERT_ACTION_LOG ('DATABASE',
                               'RUN SQL: PARTITION',
                               v_sql,
                               3);

            EXECUTE IMMEDIATE (v_sql);

            DBMS_OUTPUT.put_line (v_sql);
         END IF;

         FOR v_index2 IN 0 .. 23
         LOOP
            SELECT COUNT (*)
              INTO v_count_subpart
              FROM user_tab_subpartitions
             WHERE     table_name = 'MTPKG_BILL'
                   AND (partition_name = 'P' || v_index)
                   AND (subpartition_name = 'P' || v_index || '_' || v_index2);

            IF (v_count_subpart = 0)
            THEN
               -- EXAMPLE: ALTER TABLE MTPKG_BILL MODIFY PARTITION P1
               -- ADD SUBPARTITION P1_3 VALUES LESS THAN (4);
               v_sql :=
                     'ALTER TABLE MTPKG_BILL MODIFY PARTITION P'
                  || v_index
                  || ' ADD SUBPARTITION P'
                  || v_index
                  || '_'
                  || v_index2
                  || ' VALUES LESS THAN ('
                  || (v_index2 + 1)
                  || ')';

               INSERT_ACTION_LOG ('DATABASE',
                                  'RUN SQL: SUB PARTITION',
                                  v_sql,
                                  3);

               EXECUTE IMMEDIATE (v_sql);

               DBMS_OUTPUT.put_line (v_sql);
            END IF;
         END LOOP;
      END LOOP;

      INSERT_ACTION_LOG ('DATABASE',
                         'CREATE_PARTITION_BILL',
                         'DONE: CREATE_PARTITION_BILL',
                         0);
   EXCEPTION
      WHEN OTHERS
      THEN
         v_err_msg :=
            SUBSTR (
               SQLERRM || CHR (10) || DBMS_UTILITY.format_error_backtrace,
               1,
               1023);

         INSERT_ACTION_LOG ('DATABASE',
                            'CREATE_PARTITION_BILL',
                            'ERROR: ' || v_err_msg,
                            3);
   END;


   FUNCTION GET_RECURRENT_CHARG (in_ROWNUM NUMBER, in_HIGHT_PRIORITY NUMBER)
      RETURN TYPES.REF_CURSOR
   IS
      c_cursor   TYPES.REF_CURSOR;
   BEGIN
      IF in_HIGHT_PRIORITY = 1
      THEN
         OPEN c_cursor FOR
              SELECT CP_CODE,
                     GROUP_CODE,
                     MSISDN,
                     MTPKG_CHARG_RECURRING.PKGD_ID,
                     RETRY,
                     CHARG_FEE
                FROM MTPKG_PACKAGE
                     INNER JOIN CP
                        ON (MTPKG_PACKAGE.CP_ID = CP.CP_ID)
                     INNER JOIN MTPKG_GROUP
                        ON (MTPKG_GROUP.GROUP_ID = MTPKG_PACKAGE.GROUP_ID)
                     INNER JOIN MTPKG_PACKAGE_DETAIL
                        ON (MTPKG_PACKAGE_DETAIL.PKG_ID = MTPKG_PACKAGE.PKG_ID)
                     INNER JOIN MTPKG_CHARG_RECURRING
                        ON (MTPKG_CHARG_RECURRING.PKGD_ID =
                               MTPKG_PACKAGE_DETAIL.PKGD_ID)
               WHERE     MTPKG_CHARG_RECURRING.STATUS = 2
                     AND MTPKG_CHARG_RECURRING.CHARG_TIME <= SYSDATE
                     AND MTPKG_CHARG_RECURRING.PRIORITY = 1
                     AND ROWNUM <= in_ROWNUM
            ORDER BY MTPKG_CHARG_RECURRING.PKGD_ID, MSISDN;
      ELSE
         OPEN c_cursor FOR
              SELECT CP_CODE,
                     GROUP_CODE,
                     MSISDN,
                     MTPKG_CHARG_RECURRING.PKGD_ID,
                     RETRY,
                     CHARG_FEE
                FROM MTPKG_PACKAGE
                     INNER JOIN CP
                        ON (MTPKG_PACKAGE.CP_ID = CP.CP_ID)
                     INNER JOIN MTPKG_GROUP
                        ON (MTPKG_GROUP.GROUP_ID = MTPKG_PACKAGE.GROUP_ID)
                     INNER JOIN MTPKG_PACKAGE_DETAIL
                        ON (MTPKG_PACKAGE_DETAIL.PKG_ID = MTPKG_PACKAGE.PKG_ID)
                     INNER JOIN MTPKG_CHARG_RECURRING
                        ON (MTPKG_CHARG_RECURRING.PKGD_ID =
                               MTPKG_PACKAGE_DETAIL.PKGD_ID)
               WHERE     MTPKG_CHARG_RECURRING.STATUS = 2
                     AND MTPKG_CHARG_RECURRING.CHARG_TIME <= SYSDATE
                     AND ROWNUM <= in_ROWNUM
            ORDER BY MTPKG_CHARG_RECURRING.PKGD_ID, MSISDN;
      END IF;

      RETURN c_cursor;
   END;

   FUNCTION GET_RECURRENT_CHARG_WITH_PART (in_ROWNUM            NUMBER,
                                           in_HIGHT_PRIORITY    NUMBER,
                                           in_DATA_PART         NUMBER)
      RETURN TYPES.REF_CURSOR
   IS
      c_cursor   TYPES.REF_CURSOR;
   BEGIN
      IF in_HIGHT_PRIORITY = 1
      THEN
         OPEN c_cursor FOR
              SELECT CP_CODE,
                     GROUP_CODE,
                     MSISDN,
                     MTPKG_CHARG_RECURRING.PKGD_ID,
                     RETRY,
                     CHARG_FEE
                FROM MTPKG_PACKAGE
                     INNER JOIN CP
                        ON (MTPKG_PACKAGE.CP_ID = CP.CP_ID)
                     INNER JOIN MTPKG_GROUP
                        ON (MTPKG_GROUP.GROUP_ID = MTPKG_PACKAGE.GROUP_ID)
                     INNER JOIN MTPKG_PACKAGE_DETAIL
                        ON (MTPKG_PACKAGE_DETAIL.PKG_ID = MTPKG_PACKAGE.PKG_ID)
                     INNER JOIN MTPKG_CHARG_RECURRING
                        ON (MTPKG_CHARG_RECURRING.PKGD_ID =
                               MTPKG_PACKAGE_DETAIL.PKGD_ID)
               WHERE     MTPKG_CHARG_RECURRING.DATA_PART = in_DATA_PART
                     AND MTPKG_CHARG_RECURRING.STATUS = 2
                     AND MTPKG_CHARG_RECURRING.CHARG_TIME <= SYSDATE
                     AND MTPKG_CHARG_RECURRING.PRIORITY = 1
                     AND ROWNUM <= in_ROWNUM
            ORDER BY MTPKG_CHARG_RECURRING.PKGD_ID, MSISDN;
      ELSE
         OPEN c_cursor FOR
              SELECT CP_CODE,
                     GROUP_CODE,
                     MSISDN,
                     MTPKG_CHARG_RECURRING.PKGD_ID,
                     RETRY,
                     CHARG_FEE
                FROM MTPKG_PACKAGE
                     INNER JOIN CP
                        ON (MTPKG_PACKAGE.CP_ID = CP.CP_ID)
                     INNER JOIN MTPKG_GROUP
                        ON (MTPKG_GROUP.GROUP_ID = MTPKG_PACKAGE.GROUP_ID)
                     INNER JOIN MTPKG_PACKAGE_DETAIL
                        ON (MTPKG_PACKAGE_DETAIL.PKG_ID = MTPKG_PACKAGE.PKG_ID)
                     INNER JOIN MTPKG_CHARG_RECURRING
                        ON (MTPKG_CHARG_RECURRING.PKGD_ID =
                               MTPKG_PACKAGE_DETAIL.PKGD_ID)
               WHERE     MTPKG_CHARG_RECURRING.DATA_PART = in_DATA_PART
                     AND MTPKG_CHARG_RECURRING.STATUS = 2
                     AND MTPKG_CHARG_RECURRING.CHARG_TIME <= SYSDATE
                     AND ROWNUM <= in_ROWNUM
            ORDER BY MTPKG_CHARG_RECURRING.PKGD_ID, MSISDN;
      END IF;

      RETURN c_cursor;
   END;
END MT_PACKAGE;
/
