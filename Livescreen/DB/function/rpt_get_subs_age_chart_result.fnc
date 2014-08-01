DROP FUNCTION LIVESCREEN.RPT_GET_SUBS_AGE_CHART_RESULT;

CREATE OR REPLACE FUNCTION LIVESCREEN.rpt_get_subs_age_chart_result (
   p_begin   IN VARCHAR2,
   p_end     IN VARCHAR2,
   p_ages    IN VARCHAR2)
   RETURN TYPES.REF_CURSOR
IS
   Result     TYPES.REF_CURSOR;

   d_begin    DATE;
   d_end      DATE;
   d_temp1    DATE;
   d_temp2    DATE;

   TYPE t_tbl_ages IS TABLE OF NUMBER;

   tbl_ages   t_tbl_ages;

   n_sum      PLS_INTEGER;
   n_count    PLS_INTEGER;

   n_i        NUMBER := -1;
   n_j        NUMBER := 0;
   n_last     NUMBER;
BEGIN
   d_begin := TO_DATE (p_begin, 'dd/mm/yyyy');
   d_end := TO_DATE (p_end, 'dd/mm/yyyy');

   SELECT *
     BULK COLLECT INTO tbl_ages
     FROM (SELECT * FROM TABLE (SPLIT_TO_NUMBER_ARR (p_ages)));

   n_i := -1;
   n_j := 0;
   n_last := tbl_ages.LAST;

   LOOP
      n_i := n_i + 2;
      n_j := n_j + 2;
      n_sum := 0;
      d_temp1 := d_begin;

      SELECT ADD_MONTHS (d_temp1, 1) INTO d_temp2 FROM DUAL;

      WHILE d_temp1 < d_end
      LOOP
         n_count := 0;

         SELECT COUNT (*)
           INTO n_count
           FROM profile pro
          WHERE    (    pro.deactivetime IS NULL
                    AND (   (    ADD_MONTHS (pro.activetime, tbl_ages (n_i)) >=
                                    d_temp1
                             AND ADD_MONTHS (pro.activetime, tbl_ages (n_i)) <
                                    d_temp2)
                         OR (    ADD_MONTHS (pro.activetime, tbl_ages (n_j)) >=
                                    d_temp1
                             AND ADD_MONTHS (pro.activetime, tbl_ages (n_j)) <
                                    d_temp2)
                         OR (    ADD_MONTHS (pro.activetime, tbl_ages (n_i)) <
                                    d_temp1
                             AND ADD_MONTHS (pro.activetime, tbl_ages (n_j)) >=
                                    d_temp2)
                         OR (    ADD_MONTHS (pro.activetime, tbl_ages (n_i)) >=
                                    d_temp1
                             AND ADD_MONTHS (pro.activetime, tbl_ages (n_j)) <
                                    d_temp2)))
                OR (    pro.deactivetime IS NOT NULL
                    AND pro.deactivetime >= d_temp1
                    AND pro.deactivetime < d_temp2
                    AND ADD_MONTHS (pro.activetime, tbl_ages (n_i)) >=
                           pro.deactivetime
                    AND ADD_MONTHS (pro.activetime, tbl_ages (n_j)) <
                           pro.deactivetime);

         n_sum := n_sum + n_count;

         SELECT ADD_MONTHS (d_temp1, 1), ADD_MONTHS (d_temp2, 1)
           INTO d_temp1, d_temp2
           FROM DUAL;
      END LOOP;

      INSERT INTO chart_result (result_id,
                                result_name,
                                result_count,
                                result_amount)
           VALUES (TO_NUMBER ('0' || tbl_ages (n_j) || tbl_ages (n_i)),
                   tbl_ages (n_i) || ' -> ' || tbl_ages (n_j) || ' tháng',
                   n_sum,
                   n_sum);

      EXIT WHEN n_j = n_last;
   END LOOP;

   OPEN Result FOR
      SELECT result_id,
             result_name,
             result_count,
             result_amount,
             result_time
        FROM chart_result;

   RETURN (Result);
END rpt_get_subs_age_chart_result;
/

CREATE OR REPLACE PUBLIC SYNONYM RPT_GET_SUBS_AGE_CHART_RESULT FOR LIVESCREEN.RPT_GET_SUBS_AGE_CHART_RESULT;
