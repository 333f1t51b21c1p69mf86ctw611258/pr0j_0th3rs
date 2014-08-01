DROP FUNCTION LIVESCREEN.RPT_GET_REV_SUM_CHART_RESULT;

CREATE OR REPLACE FUNCTION LIVESCREEN.RPT_GET_REV_SUM_CHART_RESULT (
   P_BEGIN   IN VARCHAR2,
   P_END     IN VARCHAR2)
   RETURN TYPES.REF_CURSOR
IS
   v_err_msg       VARCHAR2 (1023);

   d_begin         DATE;
   d_end           DATE;

   n_good_subs     NUMBER;
   n_sum           NUMBER;

   Result          TYPES.REF_CURSOR;
BEGIN
   SELECT TO_DATE (P_BEGIN, 'dd/mm/yyyy'), TO_DATE (P_END, 'dd/mm/yyyy')
     INTO d_begin, d_end
     FROM DUAL;

   SELECT SUM (r_count), SUM (r_price)
     INTO n_good_subs, n_sum
     FROM (SELECT COUNT (*) r_count, SUM (cps.price) r_price
             FROM profile pro, vas_transaction tran, cp_shortcode cps
            WHERE     tran.time >= d_begin
                  AND tran.time < d_end
                  AND pro.MSISDN = TRAN.MSISDN
                  AND tran.short_code = cps.short_code
                  AND pro.activetime < d_end
                  AND (   pro.deactivetime IS NULL
                       OR (    pro.deactivetime IS NOT NULL
                           AND pro.deactivetime >= d_begin))
           UNION ALL
           SELECT COUNT (*) r_count, SUM (cps.price) r_price
             FROM profile pro, vas_cdr cdr, cp_shortcode cps
            WHERE     cdr.time >= d_begin
                  AND cdr.time < d_end
                  AND pro.MSISDN = cdr.MSISDN
                  AND cdr.short_code = cps.short_code
                  AND pro.activetime < d_end
                  AND (   pro.deactivetime IS NULL
                       OR (    pro.deactivetime IS NOT NULL
                           AND pro.deactivetime >= d_begin)));

   OPEN Result FOR
      SELECT 1986,
             'REVENUE_SUMMARY',
             n_good_subs,
             n_sum,
             P_BEGIN
        FROM DUAL;

   RETURN (Result);
EXCEPTION
   WHEN OTHERS
   THEN
      v_err_msg :=
         SUBSTR (SQLERRM || CHR (10) || DBMS_UTILITY.format_error_backtrace,
                 1,
                 1023);

      MT_PACKAGE.INSERT_ACTION_LOG ('DATABASE',
                                    'GET_REV_SUM_CHART_RESULT',
                                    'ERROR: ' || v_err_msg,
                                    3);
      RETURN NULL;
END RPT_GET_REV_SUM_CHART_RESULT;
/
