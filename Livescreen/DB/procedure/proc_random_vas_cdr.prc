DROP PROCEDURE LIVESCREEN.PROC_RANDOM_VAS_CDR;

CREATE OR REPLACE PROCEDURE LIVESCREEN.PROC_RANDOM_VAS_CDR(
n_COUNT NUMBER
)
IS
      v_MSISDN       VARCHAR2 (30);
      v_SHORT_CODE   VARCHAR2 (30);
      v_MO_CONTENT   VARCHAR2 (200);
      v_TIME         DATE;
BEGIN
  ------- FOR TEST ONLY: Sinh du lieu gia VAS_CDR -------
      FOR i IN 1 .. n_COUNT
      LOOP
        v_MO_CONTENT := 'GAME 3508';
        SELECT MSISDN into v_MSISDN FROM (SELECT MSISDN FROM PROFILE ORDER BY dbms_random.value) WHERE rownum <= 1;
        SELECT SHORT_CODE into v_SHORT_CODE FROM (SELECT SHORT_CODE FROM CP_SHORTCODE ORDER BY dbms_random.value) WHERE rownum <= 1;
        SELECT ACTIVETIME into v_TIME FROM (SELECT ACTIVETIME FROM PROFILE ORDER BY dbms_random.value) WHERE rownum <= 1;
        insert into vas_cdr(msisdn, short_code, mo_content, time) values(v_MSISDN, v_SHORT_CODE, v_MO_CONTENT, v_TIME);
        COMMIT;
      END LOOP;
END;
/
