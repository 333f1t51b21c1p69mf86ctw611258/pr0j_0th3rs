DROP PROCEDURE LIVESCREEN.TESTDUONGMA;

CREATE OR REPLACE PROCEDURE LIVESCREEN.testduongma
   (p_recordset OUT SYS_REFCURSOR)
   IS
--
-- To modify this template, edit file PROC.TXT in TEMPLATE
-- directory of SQL Navigator
--
-- Purpose: Briefly explain the functionality of the procedure
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
   v_fee varchar2(100);
   v_sms varchar2(500);
BEGIN
   v_fee := '7000';
   v_fee := v_fee || 'd/7ngay';

   select config_value into v_sms
   from mtpkg_config
   where config_name = 'SMS_WEEKLY_EXTEND_SUCCESS';

   open  p_recordset for
   select
    REPLACE (REPLACE (REPLACE (REPLACE (v_sms,'[Ten goi tin]','tengoi'),'[MAGOI]','magoi'),'[Xd/7ngay]',v_fee),'[dd/mm/yyyy]',TO_CHAR (sysdate, 'dd/mm/yyyy'))
   from dual;
END; -- Procedure
/
