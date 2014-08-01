DROP FUNCTION LIVESCREEN.GET_SYS_PTR;

CREATE OR REPLACE FUNCTION LIVESCREEN."GET_SYS_PTR" (
   wPtr_type   IN VARCHAR2,
   wPtr_name   IN VARCHAR2,
   DefValue    IN VARCHAR2 DEFAULT NULL)
   RETURN VARCHAR2
IS
   retval   VARCHAR2 (400);
--mCount number;
BEGIN
   SELECT ptr_val
     INTO retval
     FROM lsb_sys_ptr
    WHERE ptr_type = wPtr_type AND ptr_name = wPtr_name;

   RETURN retval;
EXCEPTION
   WHEN NO_DATA_FOUND
   THEN
      Retval := DefValue;
      RETURN retval;
   WHEN OTHERS
   THEN
      Retval := DefValue;
      RETURN retval;
END;
/

CREATE OR REPLACE PUBLIC SYNONYM GET_SYS_PTR FOR LIVESCREEN.GET_SYS_PTR;
