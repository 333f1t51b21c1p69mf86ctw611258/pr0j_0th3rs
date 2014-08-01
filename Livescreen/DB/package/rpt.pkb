DROP PACKAGE BODY LIVESCREEN.RPT;

CREATE OR REPLACE PACKAGE BODY LIVESCREEN.RPT
IS
   /******************************************************************************
       NAME:       RPT
       PURPOSE:

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        5/29/2013   NguyenTH         1. Created this package body.
    ******************************************************************************/


   FUNCTION GET_PROGRAM_BY_FILTER_INFO (P_BEGIN         IN VARCHAR2,
                                        P_END           IN VARCHAR2,
                                        P_CPS           IN VARCHAR2,
                                        P_TOPICS        IN VARCHAR2,
                                        P_SUB_CONTENT   IN VARCHAR2)
      RETURN TYPES.REF_CURSOR
   IS
      PIE_RESULT_CURSOR   TYPES.REF_CURSOR;
   BEGIN
      OPEN PIE_RESULT_CURSOR FOR
         SELECT PROGRAM_ID,
                TIMEPLUG,
                SUBCONTENTS,
                CPS_TOPIC_ID,
                pro.STATUS STATUS,
                INDEXS,
                DURATION_UPDATE,
                pro.TYPE TYPE,
                INSERT_TIME,
                CHAIN_ID,
                CORRECTANSWER
           FROM LIVESCREEN.PROGRAMS pro,
                CP,
                TOPIC tp,
                CP_TOPIC ct
          WHERE     pro.TIMEPLUG >= TO_DATE (P_BEGIN, 'dd/mm/yyyy')
                AND pro.TIMEPLUG < TO_DATE (P_END, 'dd/mm/yyyy')
                AND CT.CP_ID = CP.CP_ID
                AND CT.TOPIC_ID = TP.TOPIC_ID
                AND CT.CP_TOPIC_ID = PRO.CPS_TOPIC_ID
                AND CP.CP_ID IN
                       (SELECT * FROM TABLE (SPLIT_TO_NUMBER_ARR (P_CPS)))
                AND TP.TOPIC_ID IN
                       (SELECT * FROM TABLE (SPLIT_TO_NUMBER_ARR (P_TOPICS)))
                AND UPPER (SUBCONTENTS) LIKE
                       '%' || UPPER (P_SUB_CONTENT) || '%';

      RETURN PIE_RESULT_CURSOR;
   END;


   FUNCTION GET_CP_PIE_CHART_RESULT (P_BEGIN   IN VARCHAR2,
                                     P_END     IN VARCHAR2,
                                     P_CPS     IN VARCHAR2)
      RETURN TYPES.REF_CURSOR
   IS
      v_err_msg                 VARCHAR2 (1023);

      PIE_CHART_RESULT_CURSOR   TYPES.REF_CURSOR;
   BEGIN
      OPEN PIE_CHART_RESULT_CURSOR FOR
         SELECT cp1.cp_id,
                cp1.cpname,
                t.n_count,
                t.n_amount
           FROM    cp cp1
                LEFT OUTER JOIN
                   (  SELECT cp_id,
                             SUM (r_count) n_count,
                             SUM (r_price) n_amount
                        FROM (  SELECT cps.cp_id,
                                       COUNT (*) r_count,
                                       SUM (cps.price) r_price
                                  FROM vas_transaction vast, cp_shortcode cps
                                 /*WHERE vast.time >= TO_DATE('10/06/2013', 'dd/mm/yyyy')
                                    AND vast.time < TO_DATE('11/06/2013', 'dd/mm/yyyy')*/
                                 WHERE     vast.time >=
                                              TO_DATE (P_BEGIN, 'dd/mm/yyyy')
                                       AND vast.time <
                                              TO_DATE (P_END, 'dd/mm/yyyy')
                                       AND vast.short_code = cps.short_code
                                       AND cps.cp_id IN
                                              (SELECT *
                                                 FROM TABLE (
                                                         SPLIT_TO_NUMBER_ARR (
                                                            P_CPS /*'3412,1818,3413,2012,3414'*/
                                                                 )))
                              GROUP BY cps.cp_id
                              UNION ALL
                                SELECT cps.cp_id,
                                       COUNT (*) r_count,
                                       SUM (cps.price) r_price
                                  FROM vas_cdr vasc, cp_shortcode cps, cp
                                 /*WHERE vasc.time >= TO_DATE('10/06/2013', 'dd/mm/yyyy')
                                    AND vasc.time < TO_DATE('11/06/2013', 'dd/mm/yyyy')*/
                                 WHERE     vasc.time >=
                                              TO_DATE (P_BEGIN, 'dd/mm/yyyy')
                                       AND vasc.time <
                                              TO_DATE (P_END, 'dd/mm/yyyy')
                                       AND vasc.short_code = cps.short_code
                                       AND cps.cp_id IN
                                              (SELECT *
                                                 FROM TABLE (
                                                         SPLIT_TO_NUMBER_ARR (
                                                            P_CPS /*'3412,1818,3413,2012,3414'*/
                                                                 )))
                              GROUP BY cps.cp_id)
                    GROUP BY cp_id) t
                ON (cp1.cp_id = t.cp_id)
          WHERE cp1.cp_id IN
                   (SELECT * FROM TABLE (SPLIT_TO_NUMBER_ARR (P_CPS)));

      RETURN PIE_CHART_RESULT_CURSOR;
   EXCEPTION
      WHEN OTHERS
      THEN
         v_err_msg :=
            SUBSTR (
               SQLERRM || CHR (10) || DBMS_UTILITY.format_error_backtrace,
               1,
               1023);

         MT_PACKAGE.INSERT_ACTION_LOG ('DATABASE',
                                       'GET_CP_PIE_CHART_RESULT',
                                       'ERROR: ' || v_err_msg,
                                       3);
         RETURN NULL;
   END GET_CP_PIE_CHART_RESULT;

   FUNCTION GET_SHORTCODE_PIE_CHART_RESULT (P_BEGIN        IN VARCHAR2,
                                            P_END          IN VARCHAR2,
                                            P_SHORTCODES   IN VARCHAR2)
      RETURN TYPES.REF_CURSOR
   IS
      PIE_CHART_RESULT_CURSOR   TYPES.REF_CURSOR;
   BEGIN
      OPEN PIE_CHART_RESULT_CURSOR FOR
         SELECT cps1.cp_shortcode_id,
                cps1.short_code,
                n_count,
                n_amount
           FROM    cp_shortcode cps1
                LEFT OUTER JOIN
                   (  SELECT r_id,
                             SUM (r_count) n_count,
                             SUM (r_price) n_amount
                        FROM (  SELECT cps.cp_shortcode_id r_id,
                                       COUNT (*) r_count,
                                       SUM (cps.price) r_price
                                  FROM vas_transaction vast, cp_shortcode cps
                                 WHERE     vast.time >=
                                              TO_DATE (P_BEGIN, 'dd/mm/yyyy')
                                       AND vast.time <
                                              TO_DATE (P_END, 'dd/mm/yyyy')
                                       AND vast.short_code = cps.short_code
                                       AND cps.cp_shortcode_id IN
                                              (SELECT *
                                                 FROM TABLE (
                                                         SPLIT_TO_NUMBER_ARR (
                                                            P_SHORTCODES /*'9063,9151,9251'*/
                                                                        )))
                              -- (SELECT TO_NUMBER(xt.COLUMN_VALUE) FROM XMLTABLE('3412,2012,3414') xt)
                              GROUP BY cps.cp_shortcode_id
                              UNION ALL
                                SELECT cps.cp_shortcode_id r_id,
                                       COUNT (*) r_count,
                                       SUM (cps.price) r_price
                                  FROM vas_cdr vasc, cp_shortcode cps
                                 WHERE     vasc.time >=
                                              TO_DATE (P_BEGIN, 'dd/mm/yyyy')
                                       AND vasc.time <
                                              TO_DATE (P_END, 'dd/mm/yyyy')
                                       AND vasc.short_code = cps.short_code
                                       AND cps.cp_shortcode_id IN
                                              (SELECT *
                                                 FROM TABLE (
                                                         SPLIT_TO_NUMBER_ARR (
                                                            P_SHORTCODES /*'9063,9151,9251'*/
                                                                        )))
                              -- (SELECT TO_NUMBER(xt.COLUMN_VALUE) FROM XMLTABLE('3412,2012,3414') xt)
                              GROUP BY cps.cp_shortcode_id)
                    GROUP BY r_id) t
                ON (cps1.cp_shortcode_id = t.r_id)
          WHERE cps1.cp_shortcode_id IN
                   (SELECT * FROM TABLE (SPLIT_TO_NUMBER_ARR (P_SHORTCODES /*'9063,9151,9251'*/
                                                                          )));

      RETURN PIE_CHART_RESULT_CURSOR;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN NULL;
      WHEN OTHERS
      THEN
         -- Consider logging the error and then re-raise
         RAISE;
   END GET_SHORTCODE_PIE_CHART_RESULT;

   FUNCTION GET_BSC_PIE_CHART_RESULT (P_BEGIN     IN VARCHAR2,
                                      P_END       IN VARCHAR2,
                                      P_ZONE_ID   IN NUMBER,
                                      P_CPS       IN VARCHAR2,
                                      P_TOPICS    IN VARCHAR2)
      RETURN TYPES.REF_CURSOR
   IS
      PIE_CHART_RESULT_CURSOR   TYPES.REF_CURSOR;
   BEGIN
      OPEN PIE_CHART_RESULT_CURSOR FOR
         SELECT bsc_id,
                bsc_name,
                click_count,
                amount
           FROM (  SELECT bsc.bsc_id bsc_id,
                          bsc.bsc_name bsc_name,
                          COUNT (*) click_count,
                          SUM (CP_SHORTCODE.PRICE) amount
                     FROM vas_transaction vtran,
                          programs,
                          cp_topic,
                          cp_shortcode,
                          cell c1,
                          bsc
                    WHERE     vtran.time >= TO_DATE (P_BEGIN, 'dd/mm/yyyy')
                          AND vtran.time < TO_DATE (P_END, 'dd/mm/yyyy')
                          AND vtran.PROGRAM_ID = PROGRAMS.PROGRAM_ID
                          AND CP_TOPIC.CP_ID IN
                                 (SELECT TO_NUMBER (xt.COLUMN_VALUE)
                                    FROM XMLTABLE (P_CPS) xt)
                          AND CP_TOPIC.TOPIC_ID IN
                                 (SELECT TO_NUMBER (xt.COLUMN_VALUE)
                                    FROM XMLTABLE (P_TOPICS) xt)
                          AND CP_TOPIC.CP_TOPIC_ID = PROGRAMS.CPS_TOPIC_ID
                          AND CP_SHORTCODE.SHORT_CODE = vtran.SHORT_CODE
                          AND vtran.CELL_ID = c1.cell_id
                          AND bsc.bsc_id = c1.bsc_id
                          AND EXISTS
                                 (SELECT c2.cell_id, c2.lac
                                    FROM cell c2,
                                         bsc,
                                         zone,
                                         zone_bsc
                                   WHERE     bsc.bsc_id = ZONE_BSC.BSC_ID
                                         AND c2.bsc_id = bsc.bsc_id
                                         AND zone.zone_id = zone_bsc.zone_id
                                         AND zone.zone_id = P_ZONE_ID
                                         AND c2.cell_id = c1.cell_id
                                         AND c2.lac = c1.lac
                                  UNION
                                  SELECT c3.cell_id, c3.lac
                                    FROM zone
                                         JOIN zone_cell
                                            ON zone.zone_id = zone_cell.zone_id
                                         JOIN cell c3
                                            ON zone_cell.cell_key = c3.cell_key
                                   WHERE     zone.zone_id = P_ZONE_ID
                                         AND c3.cell_id = c1.cell_id
                                         AND c3.lac = c1.lac)
                 GROUP BY bsc.bsc_id, bsc.bsc_name);

      RETURN PIE_CHART_RESULT_CURSOR;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN NULL;
      WHEN OTHERS
      THEN
         -- Consider logging the error and then re-raise
         RAISE;
   END GET_BSC_PIE_CHART_RESULT;

   FUNCTION GET_TOPIC_PIE_CHART_RESULT (P_BEGIN     IN VARCHAR2,
                                        P_END       IN VARCHAR2,
                                        P_ZONE_ID   IN NUMBER,
                                        P_CPS       IN VARCHAR2,
                                        P_TOPICS    IN VARCHAR2)
      RETURN TYPES.REF_CURSOR
   IS
      PIE_CHART_RESULT_CURSOR   TYPES.REF_CURSOR;
   BEGIN
      OPEN PIE_CHART_RESULT_CURSOR FOR
           SELECT bsc.bsc_id,
                  bsc.bsc_name,
                  COUNT (*),
                  SUM (CP_SHORTCODE.PRICE)
             FROM vas_transaction,
                  programs,
                  cp_topic,
                  cp_shortcode,
                  cell,
                  bsc
            WHERE     vas_transaction.time >= TO_DATE (P_BEGIN, 'dd/mm/yyyy')
                  AND vas_transaction.time < TO_DATE (P_END, 'dd/mm/yyyy')
                  AND VAS_TRANSACTION.PROGRAM_ID = PROGRAMS.PROGRAM_ID
                  AND CP_TOPIC.CP_TOPIC_ID = PROGRAMS.CPS_TOPIC_ID
                  AND CP_SHORTCODE.SHORT_CODE = VAS_TRANSACTION.SHORT_CODE
                  AND CP_TOPIC.CP_ID IN (SELECT TO_NUMBER (xt.COLUMN_VALUE)
                                           FROM XMLTABLE (P_CPS) xt)
                  AND CP_TOPIC.TOPIC_ID IN (SELECT TO_NUMBER (xt.COLUMN_VALUE)
                                              FROM XMLTABLE (P_TOPICS) xt)
                  AND VAS_TRANSACTION.CELL_ID = cell.cell_id
                  AND bsc.bsc_id = cell.bsc_id
                  AND VAS_TRANSACTION.CELL_ID IN (SELECT *
                                                    FROM (SELECT cell.cell_id
                                                            FROM cell,
                                                                 bsc,
                                                                 zone,
                                                                 zone_bsc
                                                           WHERE     bsc.bsc_id =
                                                                        ZONE_BSC.BSC_ID
                                                                 AND cell.bsc_id =
                                                                        bsc.bsc_id
                                                                 AND zone.zone_id =
                                                                        zone_bsc.zone_id
                                                                 AND zone.zone_id =
                                                                        P_ZONE_ID
                                                          UNION
                                                          SELECT cell.cell_id
                                                            FROM zone
                                                                 JOIN zone_cell
                                                                    ON zone.zone_id =
                                                                          zone_cell.zone_id
                                                                 JOIN cell
                                                                    ON zone_cell.cell_key =
                                                                          cell.cell_key
                                                           WHERE zone.zone_id =
                                                                    P_ZONE_ID))
         GROUP BY bsc.bsc_id, bsc.bsc_name;

      RETURN PIE_CHART_RESULT_CURSOR;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN NULL;
      WHEN OTHERS
      THEN
         -- Consider logging the error and then re-raise
         RAISE;
   END GET_TOPIC_PIE_CHART_RESULT;

   FUNCTION GET_PROGRAM_PIE_CHART_RESULT (P_BEGIN      IN VARCHAR2,
                                          P_END        IN VARCHAR2,
                                          P_ZONE_ID    IN NUMBER,
                                          P_PROGRAMS   IN VARCHAR2)
      RETURN TYPES.REF_CURSOR
   IS
      PIE_CHART_RESULT_CURSOR   TYPES.REF_CURSOR;
   BEGIN
      OPEN PIE_CHART_RESULT_CURSOR FOR
         SELECT pro.program_id,
                pro.subcontents,
                click_count,
                amount
           FROM (  SELECT vtran.program_id program_id,
                          COUNT (*) click_count,
                          SUM (CP_SHORTCODE.PRICE) amount
                     FROM vas_transaction vtran, cp_shortcode
                    WHERE     vtran.time >= TO_DATE (P_BEGIN, 'dd/mm/yyyy')
                          AND vtran.time < TO_DATE (P_END, 'dd/mm/yyyy')
                          AND vtran.PROGRAM_ID IN
                                 (SELECT *
                                    FROM TABLE (
                                            SPLIT_TO_STRING_ARR (P_PROGRAMS)))
                          AND CP_SHORTCODE.SHORT_CODE = vtran.SHORT_CODE
                          AND (   EXISTS
                                     (SELECT 1
                                        FROM cell,
                                             bsc,
                                             zone,
                                             zone_bsc
                                       WHERE     bsc.bsc_id = ZONE_BSC.BSC_ID
                                             AND cell.bsc_id = bsc.bsc_id
                                             AND zone.zone_id =
                                                    zone_bsc.zone_id
                                             AND zone.zone_id = P_ZONE_ID
                                             AND cell.cell_id = vtran.cell_id
                                             AND cell.lac = vtran.lac)
                               OR EXISTS
                                     (SELECT 1
                                        FROM zone
                                             JOIN zone_cell
                                                ON zone.zone_id =
                                                      zone_cell.zone_id
                                             JOIN cell
                                                ON zone_cell.cell_key =
                                                      cell.cell_key
                                       WHERE     zone.zone_id = P_ZONE_ID
                                             AND cell.cell_id = vtran.cell_id
                                             AND cell.lac = vtran.lac))
                 GROUP BY vtran.program_id) tmp,
                programs pro
          WHERE tmp.program_id = pro.program_id;

      RETURN PIE_CHART_RESULT_CURSOR;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN NULL;
      WHEN OTHERS
      THEN
         -- Consider logging the error and then re-raise
         RAISE;
   END GET_PROGRAM_PIE_CHART_RESULT;

   PROCEDURE INSERT_ACTION_LOG (log_user_name     IN VARCHAR2,
                                log_action        IN VARCHAR2,
                                log_description   IN VARCHAR2,
                                log_level         IN NUMBER)
   IS
   BEGIN
      IF (log_level >= RPT.CURRENT_LOG_LEVEL)
      THEN
         INSERT INTO RPT_ACTION_LOG (log_user_name,
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
END RPT;
/
