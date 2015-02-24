DROP PROCEDURE LIVESCREEN.PROC_RANDOM_VASC_TRANSACTION;

CREATE OR REPLACE PROCEDURE LIVESCREEN.PROC_RANDOM_VASC_TRANSACTION
AS
   v_SHORT_CODE     VARCHAR2 (30);
   v_LAC            VARCHAR2 (200);
   v_CELL           VARCHAR2 (200);

   TYPE t_tbl_vas_trans_id IS TABLE OF vas_transaction.vas_trans_id%TYPE;

   tbl_vas_trans_id   t_tbl_vas_trans_id;
BEGIN
------- FOR TEST ONLY: Sinh du lieu gia VAS_TRANSACTION -------
   SELECT vas_trans_id BULK COLLECT INTO tbl_vas_trans_id FROM vas_transaction;

   FOR x IN tbl_vas_trans_id.FIRST .. tbl_vas_trans_id.LAST
   LOOP
      v_LAC := '23242';
      v_CELL := '67343';
      SELECT SHORT_CODE INTO v_SHORT_CODE FROM (SELECT SHORT_CODE FROM CP_SHORTCODE ORDER BY DBMS_RANDOM.VALUE) WHERE ROWNUM <= 1;
      --SELECT LAC INTO v_LAC FROM (SELECT LAC FROM CELL_PHAVD ORDER BY DBMS_RANDOM.VALUE) WHERE ROWNUM <= 1;
      --SELECT CELL_ID INTO v_CELL FROM (SELECT CELL_ID FROM CELL_PHAVD ORDER BY DBMS_RANDOM.VALUE) WHERE ROWNUM <= 1;

      UPDATE vas_transaction SET short_code = v_short_code, LAC = v_LAC, CELL_ID = v_CELL WHERE vas_trans_id = tbl_vas_trans_id (x);

      COMMIT;
   END LOOP;
  
END PROC_RANDOM_VASC_TRANSACTION;
/
