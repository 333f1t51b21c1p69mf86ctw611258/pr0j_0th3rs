DROP FUNCTION LIVESCREEN.FUNC_GET_ZONE;

CREATE OR REPLACE FUNCTION LIVESCREEN.func_get_zone
  (p_id_schedule number)
  RETURN  varchar2 IS

v_zone varchar2(4000);
v_re varchar2(4000);

cursor cur is
select zone_name
from zone where zone_id 
    in (select zone_id from schedule_zone_detail where schedule_id = p_id_schedule)
order by zone_name;
   

BEGIN 
    v_zone := '';
    
    open cur;
    LOOP
     FETCH cur INTO v_zone;
     EXIT WHEN cur%NOTFOUND;
        v_re := v_re || v_zone || ', ';
    end loop;
    close cur;
    
    if(length(v_re) > 0) then
        v_re := SUBSTR(v_re,0,length(v_re) - 2);
    end if;
    
    return v_re;
END;
/

CREATE OR REPLACE PUBLIC SYNONYM FUNC_GET_ZONE FOR LIVESCREEN.FUNC_GET_ZONE;
