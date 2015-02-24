DROP PACKAGE BODY LIVESCREEN.CBCZONE;

CREATE OR REPLACE PACKAGE BODY LIVESCREEN.CBCZONE
AS
   /******************************************************************************
       NAME:       CBCZONE
       PURPOSE:

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        5/29/2013   NguyenTH         1. Created this package body.
    ******************************************************************************/

   FUNCTION GET_ALL_ZONE
      RETURN TYPES.REF_CURSOR
   IS
      c_result   TYPES.REF_CURSOR;
   BEGIN
      OPEN c_result FOR
           SELECT ZONE_ID,
                  ZONE_NAME,
                  DESCRIPTION,
                  CREATED_DATE,
                  UPDATED_DATE,
                  USER_ID,
                  STATUS,
                  PARENT_ID,
                  SHAPE,
                  COLOR,
                  ZONE_TYPE
             FROM LIVESCREEN.ZONE
         ORDER BY UPDATED_DATE DESC;

      RETURN c_result;
   END;

   FUNCTION MERGE_ZONE (
      in_ZONE_ID        IN LIVESCREEN.ZONE.ZONE_ID%TYPE,
      in_ZONE_NAME      IN LIVESCREEN.ZONE.ZONE_NAME%TYPE,
      in_DESCRIPTION    IN LIVESCREEN.ZONE.DESCRIPTION%TYPE,
      in_CREATED_DATE   IN LIVESCREEN.ZONE.CREATED_DATE%TYPE,
      in_UPDATED_DATE   IN LIVESCREEN.ZONE.UPDATED_DATE%TYPE,
      in_USER_ID        IN LIVESCREEN.ZONE.USER_ID%TYPE,
      in_STATUS         IN LIVESCREEN.ZONE.STATUS%TYPE,
      in_PARENT_ID      IN LIVESCREEN.ZONE.PARENT_ID%TYPE,
      in_SHAPE          IN LIVESCREEN.ZONE.SHAPE%TYPE,
      in_COLOR          IN LIVESCREEN.ZONE.COLOR%TYPE,
      in_ZONE_TYPE      IN LIVESCREEN.ZONE.ZONE_TYPE%TYPE)
      RETURN NUMBER
   IS
      n_result   NUMBER := 0;
   BEGIN
      IF (in_ZONE_ID = 0)
      THEN
         SELECT ZONE_SEQ.NEXTVAL INTO n_result FROM DUAL;

         INSERT INTO LIVESCREEN.ZONE (ZONE_ID,
                                      ZONE_NAME,
                                      DESCRIPTION,
                                      CREATED_DATE,
                                      UPDATED_DATE,
                                      USER_ID,
                                      STATUS,
                                      PARENT_ID,
                                      SHAPE,
                                      COLOR,
                                      ZONE_TYPE)
              VALUES (n_result,
                      in_ZONE_NAME,
                      in_DESCRIPTION,
                      in_CREATED_DATE,
                      in_UPDATED_DATE,
                      in_USER_ID,
                      in_STATUS,
                      in_PARENT_ID,
                      in_SHAPE,
                      in_COLOR,
                      in_ZONE_TYPE);
      ELSE
         n_result := in_ZONE_ID;

         UPDATE LIVESCREEN.ZONE
            SET ZONE_NAME = in_ZONE_NAME,
                DESCRIPTION = in_DESCRIPTION,
                CREATED_DATE = in_CREATED_DATE,
                UPDATED_DATE = in_UPDATED_DATE,
                USER_ID = in_USER_ID,
                STATUS = in_STATUS,
                PARENT_ID = in_PARENT_ID,
                SHAPE = in_SHAPE,
                COLOR = in_COLOR,
                ZONE_TYPE = in_ZONE_TYPE
          WHERE ZONE_ID = in_ZONE_ID;
      END IF;

      IF SQL%ROWCOUNT <= 0
      THEN
         n_result := 0;
      ELSE
         COMMIT;
      END IF;

      RETURN n_result;
   END MERGE_ZONE;

   FUNCTION DI_ZONE_CELL_BY_ZONE_BSC (in_ZONE_ID NUMBER, in_BSC_ID VARCHAR2)
      RETURN NUMBER
   IS
      n_result   NUMBER;
   BEGIN
      DELETE ZONE_CELL
       WHERE     ZONE_ID = in_ZONE_ID
             AND CELL_KEY IN (SELECT CELL_KEY
                                FROM CELL
                               WHERE BSC_ID = in_BSC_ID);

      INSERT INTO ZONE_BSC (ZONE_ID, BSC_ID)
           VALUES (in_ZONE_ID, in_BSC_ID);

      n_result := SQL%ROWCOUNT;

      IF n_result > 0
      THEN
         COMMIT;
      END IF;

      RETURN n_result;
   END;

   FUNCTION GET_CELL_BY_BSC_ID (in_ZONE_ID      NUMBER,
                                in_BSC_ID       VARCHAR2,
                                in_CELL_ID      VARCHAR2,
                                in_LAC          VARCHAR2,
                                in_CELL_NAME    VARCHAR2,
                                in_STATUS       VARCHAR2)
      RETURN TYPES.REF_CURSOR
   IS
      c_result   TYPES.REF_CURSOR;
   BEGIN
      OPEN c_result FOR
           SELECT CELL_KEY,
                  CELL_ID,
                  LAC,
                  CELL_NAME,
                  STATUS,
                  BSC_ID,
                  HAS_ZONE_CELL
             FROM    CELL c1
                  LEFT OUTER JOIN
                     (SELECT c3.cell_key CHECKED_CELL_KEY, 1 HAS_ZONE_CELL
                        FROM zone_bsc zb1
                             INNER JOIN bsc b1
                                ON (zb1.bsc_id = b1.bsc_id)
                             INNER JOIN cell c3
                                ON (b1.bsc_id = c3.bsc_id)
                       WHERE     zb1.zone_id = in_ZONE_ID
                             AND zb1.bsc_id = in_BSC_ID
                      UNION
                      SELECT c2.cell_key CHECKED_CELL_KEY, 1 HAS_ZONE_CELL
                        FROM zone z1
                             INNER JOIN zone_cell zc1
                                ON (z1.zone_id = zc1.zone_id)
                             INNER JOIN cell c2
                                ON (zc1.cell_key = c2.cell_key)
                       WHERE z1.zone_id = in_ZONE_ID) t1
                  ON (c1.CELL_KEY = t1.CHECKED_CELL_KEY)
            WHERE     c1.BSC_ID = in_BSC_ID
                  AND (   in_CELL_ID IS NULL
                       OR (    in_CELL_ID IS NOT NULL
                           AND UPPER (c1.CELL_ID) LIKE
                                  '%' || UPPER (in_CELL_ID) || '%'))
                  AND (   in_LAC IS NULL
                       OR (    in_LAC IS NOT NULL
                           AND UPPER (c1.LAC) LIKE '%' || UPPER (in_LAC) || '%'))
                  AND (   in_CELL_NAME IS NULL
                       OR (    in_CELL_NAME IS NOT NULL
                           AND UPPER (c1.CELL_NAME) LIKE
                                  '%' || UPPER (in_CELL_NAME) || '%'))
                  AND (   in_STATUS IS NULL
                       OR (    in_STATUS IS NOT NULL
                           AND UPPER (c1.STATUS) LIKE
                                  '%' || UPPER (in_STATUS) || '%'))
         ORDER BY t1.CHECKED_CELL_KEY;

      RETURN c_result;
   END;

   FUNCTION GET_BSC_BY_ZONE_ID (in_ZONE_ID     NUMBER,
                                in_BSC_NAME    VARCHAR2,
                                in_STATUS      VARCHAR2,
                                in_VENDOR      VARCHAR2,
                                in_CENTER      VARCHAR2,
                                in_PROVINCE    VARCHAR2)
      RETURN TYPES.REF_CURSOR
   IS
      c_result   TYPES.REF_CURSOR;
   BEGIN
      OPEN c_result FOR
           SELECT b3.bsc_id,
                  b3.bsc_name,
                  b3.status,
                  b3.vendor,
                  b3.center,
                  b3.province,
                  t1.zone_id,
                  cell_count,
                  full_cell_count,
                  HAS_ZONE_BSC
             FROM bsc b3
                  LEFT OUTER JOIN (  SELECT b4.bsc_id, COUNT (*) full_cell_count
                                       FROM    bsc b4
                                            INNER JOIN
                                               cell c4
                                            ON (b4.bsc_id = c4.bsc_id)
                                   GROUP BY b4.bsc_id) t2
                     ON (b3.bsc_id = t2.bsc_id)
                  LEFT OUTER JOIN (  SELECT z1.ZONE_ID,
                                            b1.BSC_ID,
                                            COUNT (*) cell_count,
                                            1 HAS_ZONE_BSC
                                       FROM zone z1
                                            INNER JOIN zone_bsc zb1
                                               ON (z1.ZONE_ID = zb1.ZONE_ID)
                                            INNER JOIN bsc b1
                                               ON (zb1.BSC_ID = b1.BSC_ID)
                                            LEFT OUTER JOIN cell c1
                                               ON (b1.BSC_ID = c1.BSC_ID)
                                      WHERE z1.ZONE_ID = in_ZONE_ID
                                   GROUP BY z1.ZONE_ID, b1.BSC_ID
                                   UNION
                                     SELECT z2.zone_id,
                                            c2.bsc_id,
                                            COUNT (*) cell_count,
                                            0 HAS_ZONE_BSC
                                       FROM zone z2
                                            INNER JOIN zone_cell zc1
                                               ON (z2.zone_id = zc1.zone_id)
                                            INNER JOIN cell c2
                                               ON (zc1.cell_key = c2.cell_key)
                                      WHERE z2.zone_id = in_ZONE_ID
                                   GROUP BY z2.zone_id, C2.BSC_ID) t1
                     ON (b3.bsc_id = t1.bsc_id)
            WHERE     (   in_BSC_NAME IS NULL
                       OR (    in_BSC_NAME IS NOT NULL
                           AND UPPER (b3.BSC_NAME) LIKE
                                  '%' || UPPER (in_BSC_NAME) || '%'))
                  AND (   in_STATUS IS NULL
                       OR (    in_STATUS IS NOT NULL
                           AND UPPER (b3.STATUS) LIKE
                                  '%' || UPPER (in_STATUS) || '%'))
                  AND (   in_VENDOR IS NULL
                       OR (    in_VENDOR IS NOT NULL
                           AND UPPER (b3.VENDOR) LIKE
                                  '%' || UPPER (in_VENDOR) || '%'))
                  AND (   in_CENTER IS NULL
                       OR (    in_CENTER IS NOT NULL
                           AND UPPER (b3.CENTER) LIKE
                                  '%' || UPPER (in_CENTER) || '%'))
                  AND (   in_PROVINCE IS NULL
                       OR (    in_PROVINCE IS NOT NULL
                           AND UPPER (b3.PROVINCE) LIKE
                                  '%' || UPPER (in_PROVINCE) || '%'))
         ORDER BY HAS_ZONE_BSC DESC NULLS LAST,
                  cell_count / full_cell_count DESC NULLS LAST;

      RETURN c_result;
   END;

   ---------------------------------------------------------------------------------------------------------------------

   FUNCTION GET_CP_PIE_CHART_RESULT (P_BEGIN   IN VARCHAR2,
                                     P_END     IN VARCHAR2,
                                     P_CPS     IN VARCHAR2)
      RETURN TYPES.REF_CURSOR
   IS
      PIE_CHART_RESULT_CURSOR   TYPES.REF_CURSOR;
   BEGIN
      OPEN PIE_CHART_RESULT_CURSOR FOR
           SELECT r_id,
                  r_name,
                  SUM (r_count),
                  SUM (r_price)
             FROM (  SELECT cp.cp_id AS r_id,
                            cp.cpname r_name,
                            COUNT (*) r_count,
                            SUM (cps.price) r_price
                       FROM vas_transaction vast, cp_shortcode cps, cp
                      /*WHERE vast.time >= TO_DATE('10/06/2013', 'dd/mm/yyyy')
                             AND vast.time < TO_DATE('11/06/2013', 'dd/mm/yyyy')*/
                      WHERE     vast.time >= TO_DATE (P_BEGIN, 'dd/mm/yyyy')
                            AND vast.time < TO_DATE (P_END, 'dd/mm/yyyy')
                            AND cp.cp_id = cps.cp_id
                            AND vast.short_code = cps.short_code
                            AND cp.cp_id IN
                                   (SELECT *
                                      FROM TABLE (SPLIT_TO_NUMBER_ARR (P_CPS /*'3412,1818,3413,2012,3414'*/
                                                                            )))
                   -- (SELECT TO_NUMBER(xt.COLUMN_VALUE) FROM XMLTABLE('3412,2012,3414') xt)
                   GROUP BY cp.cp_id, cp.cpname
                   UNION
                     SELECT cp.cp_id AS r_id,
                            cp.cpname r_name,
                            COUNT (*) r_count,
                            SUM (cps.price) r_price
                       FROM vas_cdr vasc, cp_shortcode cps, cp
                      /*WHERE vasc.time >= TO_DATE('10/06/2013', 'dd/mm/yyyy')
                             AND vasc.time < TO_DATE('11/06/2013', 'dd/mm/yyyy')*/
                      WHERE     vasc.time >= TO_DATE (P_BEGIN, 'dd/mm/yyyy')
                            AND vasc.time < TO_DATE (P_END, 'dd/mm/yyyy')
                            AND cp.cp_id = cps.cp_id
                            AND vasc.short_code = cps.short_code
                            AND cp.cp_id IN
                                   (SELECT *
                                      FROM TABLE (SPLIT_TO_NUMBER_ARR (P_CPS /*'3412,1818,3413,2012,3414'*/
                                                                            )))
                   -- (SELECT TO_NUMBER(xt.COLUMN_VALUE) FROM XMLTABLE('3412,2012,3414') xt)
                   GROUP BY cp.cp_id, cp.cpname)
         GROUP BY r_id, r_name;

      RETURN PIE_CHART_RESULT_CURSOR;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN NULL;
      WHEN OTHERS
      THEN
         -- Consider logging the error and then re-raise
         RAISE;
   END GET_CP_PIE_CHART_RESULT;

   FUNCTION GET_SHORTCODE_PIE_CHART_RESULT (P_BEGIN        IN VARCHAR2,
                                            P_END          IN VARCHAR2,
                                            P_SHORTCODES   IN VARCHAR2)
      RETURN TYPES.REF_CURSOR
   IS
      PIE_CHART_RESULT_CURSOR   TYPES.REF_CURSOR;
   BEGIN
      OPEN PIE_CHART_RESULT_CURSOR FOR
           SELECT r_id,
                  r_name,
                  SUM (r_count),
                  SUM (r_price)
             FROM (  SELECT cps.short_code r_id,
                            cps.short_code r_name,
                            COUNT (*) r_count,
                            SUM (cps.price) r_price
                       FROM vas_transaction vast, cp_shortcode cps
                      WHERE     vast.time >= TO_DATE (P_BEGIN, 'dd/mm/yyyy')
                            AND vast.time < TO_DATE (P_END, 'dd/mm/yyyy')
                            AND vast.short_code = cps.short_code
                            AND vast.short_code IN
                                   (SELECT *
                                      FROM TABLE (
                                              SPLIT_TO_STRING_ARR (P_SHORTCODES /*'9063,9151,9251'*/
                                                                               )))
                   -- (SELECT TO_NUMBER(xt.COLUMN_VALUE) FROM XMLTABLE('3412,2012,3414') xt)
                   GROUP BY cps.short_code
                   UNION
                     SELECT cps.short_code r_id,
                            cps.short_code r_name,
                            COUNT (*) r_count,
                            SUM (cps.price) r_price
                       FROM vas_cdr vasc, cp_shortcode cps
                      WHERE     vasc.time >= TO_DATE (P_BEGIN, 'dd/mm/yyyy')
                            AND vasc.time < TO_DATE (P_END, 'dd/mm/yyyy')
                            AND vasc.short_code = cps.short_code
                            AND vasc.short_code IN
                                   (SELECT *
                                      FROM TABLE (
                                              SPLIT_TO_STRING_ARR (P_SHORTCODES /*'9063,9151,9251'*/
                                                                               )))
                   -- (SELECT TO_NUMBER(xt.COLUMN_VALUE) FROM XMLTABLE('3412,2012,3414') xt)
                   GROUP BY cps.short_code)
         GROUP BY r_id, r_name;

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
            WHERE     vas_transaction.time BETWEEN TO_DATE (P_BEGIN,
                                                            'dd/mm/yyyy')
                                               AND TO_DATE (P_END,
                                                            'dd/mm/yyyy')
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
            WHERE     vas_transaction.time BETWEEN TO_DATE (P_BEGIN,
                                                            'dd/mm/yyyy')
                                               AND TO_DATE (P_END,
                                                            'dd/mm/yyyy')
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
           SELECT programs.program_id,
                  programs.subcontents,
                  COUNT (*),
                  SUM (CP_SHORTCODE.PRICE)
             FROM vas_transaction,
                  programs,
                  cp_topic,
                  cp_shortcode,
                  cell,
                  bsc
            WHERE     vas_transaction.time BETWEEN TO_DATE (P_BEGIN,
                                                            'dd/mm/yyyy')
                                               AND TO_DATE (P_END,
                                                            'dd/mm/yyyy')
                  AND VAS_TRANSACTION.PROGRAM_ID = PROGRAMS.PROGRAM_ID
                  AND VAS_TRANSACTION.PROGRAM_ID IN
                         (SELECT *
                            FROM TABLE (SPLIT_TO_STRING_ARR (P_PROGRAMS)))
                  AND CP_TOPIC.CP_TOPIC_ID = PROGRAMS.CPS_TOPIC_ID
                  AND CP_SHORTCODE.SHORT_CODE = VAS_TRANSACTION.SHORT_CODE
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
         GROUP BY programs.program_id, programs.subcontents;

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
END CBCZONE;
/
