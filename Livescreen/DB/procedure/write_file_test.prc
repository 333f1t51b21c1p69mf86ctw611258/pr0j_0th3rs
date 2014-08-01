DROP PROCEDURE LIVESCREEN.WRITE_FILE_TEST;

CREATE OR REPLACE PROCEDURE LIVESCREEN.write_file_test
   IS
   l_file        UTL_FILE.file_type;
   l_file_name   VARCHAR2 (60);
BEGIN

   SELECT 'DUONGMA' || TO_CHAR (SYSDATE, 'yyyymmdd') || '.txt'
     INTO l_file_name
     FROM DUAL;

   l_file := UTL_FILE.fopen ('UTL_DIR', l_file_name, 'w');

   UTL_FILE.putf (l_file, l_file_name);
   UTL_FILE.fclose (l_file);

   EXCEPTION
    WHEN utl_file.invalid_path THEN
     raise_application_error(-20000, 'ERROR: Invalid PATH FOR file.');
END; -- Procedure
/
