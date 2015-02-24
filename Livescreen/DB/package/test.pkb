DROP PACKAGE BODY LIVESCREEN.TEST;

CREATE OR REPLACE PACKAGE BODY LIVESCREEN.TEST
AS
   /******************************************************************************
      NAME:       TEST
      PURPOSE:

      REVISIONS:
      Ver        Date        Author           Description
      ---------  ----------  ---------------  ------------------------------------
      1.0        4/8/2013    manucian86       1. Created this package body.
   ******************************************************************************/

   FUNCTION insert_profiles (p_record_count    IN     NUMBER,
                             p_active_time     IN     VARCHAR2,
                             p_deactive_time   IN     VARCHAR2,
                             p_last_update     IN     VARCHAR2,
                             p_cos_id          IN     VARCHAR2,
                             p_status_id       IN     NUMBER,
                             p_subs_prefix     IN     VARCHAR2,
                             p_failure_count   IN OUT NUMBER)
      RETURN NUMBER
   IS
      v_result   NUMBER := 0;

      tmpVar     NUMBER;
      strNum     VARCHAR (7);
   BEGIN
      tmpVar := 0;
      p_failure_count := 0;

      FOR tmpVar IN 1 .. p_record_count
      LOOP
         strNum := TO_CHAR (tmpVar, 'FM0000000');

         BEGIN
            INSERT INTO LIVESCREEN.PROFILE (MSISDN,
                                            ACTIVETIME,
                                            LAST_UPDATE_DATE,
                                            STATUS_ID,
                                            DEACTIVETIME,
                                            IMEI,
                                            COS_ID,
                                            VERSION,
                                            LAC,
                                            CELL,
                                            SUBTYPE)
                 VALUES (CONCAT (p_subs_prefix, strNum),
                         TO_DATE (p_active_time, 'dd/mm/yyyy hh24:mi:ss'),
                         TO_DATE (p_last_update, 'dd/mm/yyyy hh24:mi:ss'),
                         p_status_id,
                         TO_DATE (p_deactive_time, 'dd/mm/yyyy hh24:mi:ss'),
                         CONCAT ('35967303', strNum),
                         'DE1',
                         '3.1.14.2.6',
                         NULL,
                         NULL,
                         'PREPAID');

            v_result := v_result + 1;

            IF MOD (v_result, 200) = 0
            THEN
               COMMIT;
            END IF;
         EXCEPTION
            WHEN OTHERS
            THEN
               p_failure_count := p_failure_count + 1;
         END;
      END LOOP;

      COMMIT;

      RETURN v_result;
   END;


   FUNCTION update_profiles (p_record_count          IN NUMBER,
                             p_active_time           IN VARCHAR2,
                             p_deactive_time         IN VARCHAR2,
                             p_last_update           IN VARCHAR2,
                             p_cos_id                IN VARCHAR2,
                             p_cos_id_condition      IN VARCHAR2,
                             p_status_id             IN NUMBER,
                             p_status_id_condition   IN NUMBER,
                             p_subs_prefix           IN VARCHAR2)
      RETURN NUMBER
   IS
      v_result   NUMBER := 0;
   BEGIN
      IF p_record_count != -1
      THEN
         UPDATE profile
            SET activetime = TO_DATE (p_active_time, 'dd/mm/yyyy hh24:mi:ss'),
                deactivetime =
                   TO_DATE (p_deactive_time, 'dd/mm/yyyy hh24:mi:ss'),
                last_update_date =
                   TO_DATE (p_last_update, 'dd/mm/yyyy hh24:mi:ss'),
                cos_id = p_cos_id,
                status_id = p_status_id
          WHERE     ROWNUM <= p_record_count
                AND cos_id = p_cos_id_condition
                AND (   p_status_id_condition = -1
                     OR (    p_status_id_condition > -1
                         AND status_id = p_status_id_condition))
                AND msisdn LIKE p_subs_prefix || '%';
      ELSE
         UPDATE profile
            SET activetime = TO_DATE (p_active_time, 'dd/mm/yyyy hh24:mi:ss'),
                deactivetime =
                   TO_DATE (p_deactive_time, 'dd/mm/yyyy hh24:mi:ss'),
                last_update_date =
                   TO_DATE (p_last_update, 'dd/mm/yyyy hh24:mi:ss'),
                cos_id = p_cos_id,
                status_id = p_status_id
          WHERE     cos_id = p_cos_id_condition
                AND (   p_status_id_condition = -1
                     OR (    p_status_id_condition > -1
                         AND status_id = p_status_id_condition))
                AND msisdn LIKE p_subs_prefix || '%';
      END IF;

      v_result := SQL%ROWCOUNT;

      COMMIT;

      RETURN v_result;
   EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK;
         RETURN 0;
   END;

   FUNCTION delete_profiles (p_record_count          IN NUMBER,
                             p_cos_id_condition      IN VARCHAR2,
                             p_status_id_condition   IN NUMBER,
                             p_subs_prefix           IN VARCHAR2)
      RETURN NUMBER
   IS
      v_result   NUMBER := 0;
   BEGIN
      IF p_record_count != -1
      THEN
         DELETE profile
          WHERE     ROWNUM <= p_record_count
                AND cos_id = p_cos_id_condition
                AND (   p_status_id_condition = -1
                     OR (    p_status_id_condition > -1
                         AND status_id = p_status_id_condition))
                AND msisdn LIKE p_subs_prefix || '%';
      ELSE
         DELETE profile
          WHERE     cos_id = p_cos_id_condition
                AND (   p_status_id_condition = -1
                     OR (    p_status_id_condition > -1
                         AND status_id = p_status_id_condition))
                AND msisdn LIKE p_subs_prefix || '%';
      END IF;

      v_result := SQL%ROWCOUNT;

      COMMIT;

      RETURN v_result;
   EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK;
         RETURN 0;
   END;



   FUNCTION insert_bills (p_record_count      IN     NUMBER,
                          p_last_date_charg   IN     VARCHAR2,
                          p_data_part         IN     NUMBER,
                          p_charg_fee         IN     NUMBER,
                          p_subs_prefix       IN     VARCHAR2,
                          p_failure_count     IN OUT NUMBER)
      RETURN NUMBER
   IS
      v_result   NUMBER := 0;

      tmpVar     NUMBER;
      strNum     VARCHAR (7);
   BEGIN
      tmpVar := 0;
      p_failure_count := 0;

      FOR tmpVar IN 1 .. p_record_count
      LOOP
         strNum := TO_CHAR (tmpVar, 'FM0000000');

         BEGIN
            INSERT INTO LIVESCREEN.LSB_BILL (MSISDN,
                                             LAST_DATE_CHARG,
                                             STATUS,
                                             STATE_CHARG,
                                             SUB_TYPE,
                                             DATA_PART,
                                             CHARG_FEE)
                 VALUES (
                           CONCAT (p_subs_prefix, strNum),
                           TO_DATE (p_last_date_charg,
                                    'dd/mm/yyyy hh24:mi:ss'),
                           1,
                           NULL,
                           1,
                           p_data_part,
                           p_charg_fee);

            v_result := v_result + 1;

            IF MOD (v_result, 200) = 0
            THEN
               COMMIT;
            END IF;
         EXCEPTION
            WHEN OTHERS
            THEN
               p_failure_count := p_failure_count + 1;
         END;
      END LOOP;

      COMMIT;

      RETURN v_result;
   END;

   FUNCTION update_bills (p_record_count          IN NUMBER,
                          p_last_date_charg       IN VARCHAR2,
                          p_data_part             IN NUMBER,
                          p_data_part_condition   IN NUMBER,
                          p_charg_fee             IN NUMBER,
                          p_charg_fee_condition   IN NUMBER,
                          p_subs_prefix           IN VARCHAR2)
      RETURN NUMBER
   IS
      v_result   NUMBER := 0;
   BEGIN
      IF p_record_count != -1
      THEN
         UPDATE lsb_bill
            SET last_date_charg =
                   TO_DATE (p_last_date_charg, 'dd/mm/yyyy hh24:mi:ss'),
                data_part = p_data_part,
                charg_fee = p_charg_fee
          WHERE     ROWNUM <= p_record_count
                AND (   p_data_part_condition = -1
                     OR (    p_data_part_condition > -1
                         AND data_part = p_data_part_condition))
                AND (   p_charg_fee_condition = -1
                     OR (    p_charg_fee_condition > -1
                         AND charg_fee = p_charg_fee_condition))
                AND msisdn LIKE p_subs_prefix || '%';
      ELSE
         UPDATE lsb_bill
            SET last_date_charg =
                   TO_DATE (p_last_date_charg, 'dd/mm/yyyy hh24:mi:ss'),
                data_part = p_data_part,
                charg_fee = p_charg_fee
          WHERE     (   p_data_part_condition = -1
                     OR (    p_data_part_condition > -1
                         AND data_part = p_data_part_condition))
                AND (   p_charg_fee_condition = -1
                     OR (    p_charg_fee_condition > -1
                         AND charg_fee = p_charg_fee_condition))
                AND msisdn LIKE p_subs_prefix || '%';
      END IF;

      v_result := SQL%ROWCOUNT;

      COMMIT;

      RETURN v_result;
   EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK;
         RETURN 0;
   END;

   FUNCTION delete_bills (p_record_count          IN NUMBER,
                          p_data_part_condition   IN VARCHAR2,
                          p_charg_fee_condition   IN NUMBER,
                          p_subs_prefix           IN VARCHAR2)
      RETURN NUMBER
   IS
      v_result   NUMBER := 0;
   BEGIN
      IF p_record_count != -1
      THEN
         DELETE lsb_bill
          WHERE     ROWNUM <= p_record_count
                AND (   p_data_part_condition = -1
                     OR (    p_data_part_condition > -1
                         AND data_part = p_data_part_condition))
                AND (   p_charg_fee_condition = -1
                     OR (    p_charg_fee_condition > -1
                         AND charg_fee = p_charg_fee_condition))
                AND msisdn LIKE p_subs_prefix || '%';
      ELSE
         DELETE lsb_bill
          WHERE     (   p_data_part_condition = -1
                     OR (    p_data_part_condition > -1
                         AND data_part = p_data_part_condition))
                AND (   p_charg_fee_condition = -1
                     OR (    p_charg_fee_condition > -1
                         AND charg_fee = p_charg_fee_condition))
                AND msisdn LIKE p_subs_prefix || '%';
      END IF;

      v_result := SQL%ROWCOUNT;

      COMMIT;

      RETURN v_result;
   EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK;
         RETURN 0;
   END;



   FUNCTION insert_monthly_billings (p_record_count    IN     NUMBER,
                                     p_state           IN     NUMBER,
                                     p_retry           IN     NUMBER,
                                     p_last_update     IN     VARCHAR2,
                                     p_error_detail    IN     VARCHAR2,
                                     p_priority        IN     NUMBER,
                                     p_charge_fee      IN     NUMBER,
                                     p_subs_prefix     IN     VARCHAR2,
                                     p_failure_count   IN OUT NUMBER)
      RETURN NUMBER
   IS
      v_result      NUMBER := 0;

      tmpVar        NUMBER;
      strNum        VARCHAR (7);

      v_data_part   NUMBER;
   BEGIN
      tmpVar := 0;
      p_failure_count := 0;

      FOR tmpVar IN 1 .. p_record_count
      LOOP
         strNum := TO_CHAR (tmpVar, 'FM0000000');
         v_data_part := MOD (tmpVar, 10);

         BEGIN
            INSERT INTO LIVESCREEN.lsb_monthly_billing (MSISDN,
                                                        STATE,
                                                        RETRY,
                                                        TYPESUB,
                                                        LASTUPDATE,
                                                        ERROR_DETAIL,
                                                        DATA_PART,
                                                        PRIORITY,
                                                        MON_RETRY,
                                                        CHARG_FEE)
                 VALUES (CONCAT (p_subs_prefix, strNum),
                         p_state,
                         p_retry,
                         1,
                         TO_DATE (p_last_update, 'dd/mm/yyyy hh24:mi:ss'),
                         p_error_detail,
                         v_data_part,
                         p_priority,
                         TRUNC (p_retry / 30),
                         p_charge_fee);

            v_result := v_result + 1;

            IF MOD (v_result, 200) = 0
            THEN
               COMMIT;
            END IF;
         EXCEPTION
            WHEN OTHERS
            THEN
               p_failure_count := p_failure_count + 1;
         END;
      END LOOP;

      COMMIT;

      RETURN v_result;
   END;


   FUNCTION update_monthly_billings (p_record_count      IN NUMBER,
                                     p_state             IN NUMBER,
                                     p_state_condition   IN NUMBER,
                                     p_retry             IN NUMBER,
                                     p_retry_condition   IN NUMBER,
                                     p_last_update       IN VARCHAR2,
                                     p_error_detail      IN VARCHAR2,
                                     p_priority          IN NUMBER,
                                     p_charge_fee        IN NUMBER,
                                     p_subs_prefix       IN VARCHAR2)
      RETURN NUMBER
   IS
      v_result   NUMBER := 0;
   BEGIN
      IF p_record_count != -1
      THEN
         UPDATE lsb_monthly_billing
            SET state = p_state,
                retry = p_retry,
                lastupdate = TO_DATE (p_last_update, 'dd/mm/yyyy hh24:mi:ss'),
                error_detail = p_error_detail,
                priority = p_priority,
                charg_fee = p_charge_fee
          WHERE     ROWNUM <= p_record_count
                AND (   p_state_condition = -1
                     OR (p_state_condition > -1 AND state = p_state_condition))
                AND (   p_retry_condition = -1
                     OR (p_retry_condition > -1 AND retry = p_retry_condition))
                AND msisdn LIKE p_subs_prefix || '%';
      ELSE
         UPDATE lsb_monthly_billing
            SET state = p_state,
                retry = p_retry,
                lastupdate = TO_DATE (p_last_update, 'dd/mm/yyyy hh24:mi:ss'),
                error_detail = p_error_detail,
                priority = p_priority,
                charg_fee = p_charge_fee
          WHERE     (   p_state_condition = -1
                     OR (p_state_condition > -1 AND state = p_state_condition))
                AND (   p_retry_condition = -1
                     OR (p_retry_condition > -1 AND retry = p_retry_condition))
                AND msisdn LIKE p_subs_prefix || '%';
      END IF;

      v_result := SQL%ROWCOUNT;

      COMMIT;

      RETURN v_result;
   EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK;
         RETURN 0;
   END;

   FUNCTION delete_monthly_billings (p_record_count      IN NUMBER,
                                     p_state_condition   IN NUMBER,
                                     p_retry_condition   IN NUMBER,
                                     p_subs_prefix       IN VARCHAR2)
      RETURN NUMBER
   IS
      v_result   NUMBER := 0;
   BEGIN
      IF p_record_count != -1
      THEN
         DELETE lsb_monthly_billing
          WHERE     ROWNUM <= p_record_count
                AND (   p_state_condition = -1
                     OR (p_state_condition > -1 AND state = p_state_condition))
                AND (   p_retry_condition = -1
                     OR (p_retry_condition > -1 AND retry = p_retry_condition))
                AND msisdn LIKE p_subs_prefix || '%';
      ELSE
         DELETE lsb_monthly_billing
          WHERE     (   p_state_condition = -1
                     OR (p_state_condition > -1 AND state = p_state_condition))
                AND (   p_retry_condition = -1
                     OR (p_retry_condition > -1 AND retry = p_retry_condition))
                AND msisdn LIKE p_subs_prefix || '%';
      END IF;

      v_result := SQL%ROWCOUNT;

      COMMIT;

      RETURN v_result;
   EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK;
         RETURN 0;
   END;
--   FUNCTION insert_rtbs (p_record_count    IN     NUMBER,
--                         p_state           IN     NUMBER,
--                         p_balance         IN     NUMBER,
--                         p_subs_prefix     IN     VARCHAR2,
--                         p_failure_count   IN OUT NUMBER)
--      RETURN NUMBER
--   IS
--      v_result      NUMBER := 0;
--
--      tmpVar        NUMBER;
--      strNum        VARCHAR (7);
--
--      v_data_part   NUMBER;
--   BEGIN
--      tmpVar := 0;
--      p_failure_count := 0;
--
--      FOR tmpVar IN 1 .. p_record_count
--      LOOP
--         strNum := TO_CHAR (tmpVar, 'FM0000000');
--         v_data_part := MOD (tmpVar, 10);
--
--         BEGIN
--            INSERT INTO LIVESCREEN.RTBS (MSISDN,
--                                         STATE,
--                                         BALANCE,
--                                         DATA_PART)
--                 VALUES (CONCAT (p_subs_prefix, strNum),
--                         p_state,
--                         p_balance,
--                         v_data_part);
--
--            v_result := v_result + 1;
--
--            IF MOD (v_result, 200) = 0
--            THEN
--               COMMIT;
--            END IF;
--         EXCEPTION
--            WHEN OTHERS
--            THEN
--               p_failure_count := p_failure_count + 1;
--         END;
--      END LOOP;
--
--      COMMIT;
--
--      RETURN v_result;
--   END;
--
--
--   FUNCTION update_rtbs (p_record_count        IN NUMBER,
--                         p_state               IN NUMBER,
--                         p_balance             IN NUMBER,
--                         p_state_condition     IN NUMBER,
--                         p_balance_condition   IN NUMBER,
--                         p_subs_prefix         IN VARCHAR2)
--      RETURN NUMBER
--   IS
--      v_result   NUMBER := 0;
--   BEGIN
--      IF p_record_count != -1
--      THEN
--         UPDATE RTBS
--            SET state = p_state, balance = p_balance
--          WHERE     ROWNUM <= p_record_count
--                AND (   p_state_condition = -1
--                     OR (p_state_condition > -1 AND state = p_state_condition))
--                AND (   p_balance_condition = -1
--                     OR (    p_balance_condition > -1
--                         AND balance = p_balance_condition))
--                AND msisdn LIKE p_subs_prefix || '%';
--      ELSE
--         UPDATE RTBS
--            SET state = p_state, balance = p_balance
--          WHERE     (   p_state_condition = -1
--                     OR (p_state_condition > -1 AND state = p_state_condition))
--                AND (   p_balance_condition = -1
--                     OR (    p_balance_condition > -1
--                         AND balance = p_balance_condition))
--                AND msisdn LIKE p_subs_prefix || '%';
--      END IF;
--
--      v_result := SQL%ROWCOUNT;
--
--      COMMIT;
--
--      RETURN v_result;
--   EXCEPTION
--      WHEN OTHERS
--      THEN
--         ROLLBACK;
--         RETURN 0;
--   END;
--
--   FUNCTION delete_rtbs (p_record_count        IN NUMBER,
--                         p_state_condition     IN NUMBER,
--                         p_balance_condition   IN NUMBER,
--                         p_subs_prefix         IN VARCHAR2)
--      RETURN NUMBER
--   IS
--      v_result   NUMBER := 0;
--   BEGIN
--      IF p_record_count != -1
--      THEN
--         DELETE RTBS
--          WHERE     ROWNUM <= p_record_count
--                AND (   p_state_condition = -1
--                     OR (p_state_condition > -1 AND state = p_state_condition))
--                AND (   p_balance_condition = -1
--                     OR (    p_balance_condition > -1
--                         AND balance = p_balance_condition))
--                AND msisdn LIKE p_subs_prefix || '%';
--      ELSE
--         DELETE RTBS
--          WHERE     (   p_state_condition = -1
--                     OR (p_state_condition > -1 AND state = p_state_condition))
--                AND (   p_balance_condition = -1
--                     OR (    p_balance_condition > -1
--                         AND balance = p_balance_condition))
--                AND msisdn LIKE p_subs_prefix || '%';
--      END IF;
--
--      v_result := SQL%ROWCOUNT;
--
--      COMMIT;
--
--      RETURN v_result;
--   EXCEPTION
--      WHEN OTHERS
--      THEN
--         ROLLBACK;
--         RETURN 0;
--   END;
END TEST;
/
