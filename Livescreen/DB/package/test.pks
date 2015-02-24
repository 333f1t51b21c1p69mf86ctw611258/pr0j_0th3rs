DROP PACKAGE LIVESCREEN.TEST;

CREATE OR REPLACE PACKAGE LIVESCREEN.TEST
AS
   /******************************************************************************
      NAME:       TEST
      PURPOSE:

      REVISIONS:
      Ver        Date        Author           Description
      ---------  ----------  ---------------  ------------------------------------
      1.0        4/8/2013    manucian86       1. Created this package.
   ******************************************************************************/

   --   FUNCTION select_profiles_count (p_cos_id_condition      IN VARCHAR2,
   --                                   p_status_id_condition   IN NUMBER,
   --                                   p_subs_prefix           IN VARCHAR2)
   --      RETURN NUMBER;
   --
   --   FUNCTION select_profiles_top_100 (p_cos_id_condition      IN VARCHAR2,
   --                                     p_status_id_condition   IN NUMBER,
   --                                     p_subs_prefix           IN VARCHAR2)
   --      RETURN Types.ref_cursor;

   FUNCTION insert_profiles (p_record_count    IN     NUMBER,
                             p_active_time     IN     VARCHAR2,
                             p_deactive_time   IN     VARCHAR2,
                             p_last_update     IN     VARCHAR2,
                             p_cos_id          IN     VARCHAR2,
                             p_status_id       IN     NUMBER,
                             p_subs_prefix     IN     VARCHAR2,
                             p_failure_count   IN OUT NUMBER)
      RETURN NUMBER;

   FUNCTION update_profiles (p_record_count          IN NUMBER,
                             p_active_time           IN VARCHAR2,
                             p_deactive_time         IN VARCHAR2,
                             p_last_update           IN VARCHAR2,
                             p_cos_id                IN VARCHAR2,
                             p_cos_id_condition      IN VARCHAR2,
                             p_status_id             IN NUMBER,
                             p_status_id_condition   IN NUMBER,
                             p_subs_prefix           IN VARCHAR2)
      RETURN NUMBER;

   FUNCTION delete_profiles (p_record_count          IN NUMBER,
                             p_cos_id_condition      IN VARCHAR2,
                             p_status_id_condition   IN NUMBER,
                             p_subs_prefix           IN VARCHAR2)
      RETURN NUMBER;


   --   FUNCTION select_bills_count (p_data_part_condition   IN NUMBER,
   --                                p_charg_fee_condition   IN NUMBER,
   --                                p_subs_prefix           IN VARCHAR2)
   --      RETURN NUMBER;
   --
   --   FUNCTION select_bills_top_100 (p_data_part_condition   IN NUMBER,
   --                                  p_charg_fee_condition   IN NUMBER,
   --                                  p_subs_prefix           IN VARCHAR2)
   --      RETURN Types.ref_cursor;

   FUNCTION insert_bills (p_record_count      IN     NUMBER,
                          p_last_date_charg   IN     VARCHAR2,
                          p_data_part         IN     NUMBER,
                          p_charg_fee         IN     NUMBER,
                          p_subs_prefix       IN     VARCHAR2,
                          p_failure_count     IN OUT NUMBER)
      RETURN NUMBER;

   FUNCTION update_bills (p_record_count          IN NUMBER,
                          p_last_date_charg       IN VARCHAR2,
                          p_data_part             IN NUMBER,
                          p_data_part_condition   IN NUMBER,
                          p_charg_fee             IN NUMBER,
                          p_charg_fee_condition   IN NUMBER,
                          p_subs_prefix           IN VARCHAR2)
      RETURN NUMBER;

   FUNCTION delete_bills (p_record_count          IN NUMBER,
                          p_data_part_condition   IN VARCHAR2,
                          p_charg_fee_condition   IN NUMBER,
                          p_subs_prefix           IN VARCHAR2)
      RETURN NUMBER;


   --   FUNCTION select_monthly_count (p_state_condition   IN NUMBER,
   --                                  p_retry_condition   IN NUMBER,
   --                                  p_subs_prefix       IN VARCHAR2)
   --      RETURN NUMBER;
   --
   --   FUNCTION select_monthly_top_100 (p_state_condition   IN NUMBER,
   --                                    p_retry_condition   IN NUMBER,
   --                                    p_subs_prefix       IN VARCHAR2)
   --      RETURN Types.ref_cursor;

   FUNCTION insert_monthly_billings (p_record_count    IN     NUMBER,
                                     p_state           IN     NUMBER,
                                     p_retry           IN     NUMBER,
                                     p_last_update     IN     VARCHAR2,
                                     p_error_detail    IN     VARCHAR2,
                                     p_priority        IN     NUMBER,
                                     p_charge_fee      IN     NUMBER,
                                     p_subs_prefix     IN     VARCHAR2,
                                     p_failure_count   IN OUT NUMBER)
      RETURN NUMBER;

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
      RETURN NUMBER;

   FUNCTION delete_monthly_billings (p_record_count      IN NUMBER,
                                     p_state_condition   IN NUMBER,
                                     p_retry_condition   IN NUMBER,
                                     p_subs_prefix       IN VARCHAR2)
      RETURN NUMBER;
--   FUNCTION select_rtbs_count (p_state_condition     IN NUMBER,
--                               p_balance_condition   IN NUMBER,
--                               p_subs_prefix         IN VARCHAR2)
--      RETURN NUMBER;
--
--   FUNCTION select_rtbs_top_100 (p_state_condition     IN NUMBER,
--                                 p_balance_condition   IN NUMBER,
--                                 p_subs_prefix         IN VARCHAR2)
--      RETURN Types.ref_cursor;

--   FUNCTION insert_rtbs (p_record_count    IN     NUMBER,
--                         p_state           IN     NUMBER,
--                         p_balance         IN     NUMBER,
--                         p_subs_prefix     IN     VARCHAR2,
--                         p_failure_count   IN OUT NUMBER)
--      RETURN NUMBER;
--
--   FUNCTION update_rtbs (p_record_count        IN NUMBER,
--                         p_state               IN NUMBER,
--                         p_balance             IN NUMBER,
--                         p_state_condition     IN NUMBER,
--                         p_balance_condition   IN NUMBER,
--                         p_subs_prefix         IN VARCHAR2)
--      RETURN NUMBER;
--
--   FUNCTION delete_rtbs (p_record_count        IN NUMBER,
--                         p_state_condition     IN NUMBER,
--                         p_balance_condition   IN NUMBER,
--                         p_subs_prefix         IN VARCHAR2)
--      RETURN NUMBER;
END TEST;
/
