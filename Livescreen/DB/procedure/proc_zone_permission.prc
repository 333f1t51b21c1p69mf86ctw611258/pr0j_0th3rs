DROP PROCEDURE LIVESCREEN.PROC_ZONE_PERMISSION;

CREATE OR REPLACE PROCEDURE LIVESCREEN.proc_zone_permission
   (p_strId in varchar2,
    p_strName in varchar2,
    p_zoneId in number)
   IS

    v_id varchar2(100);

   cursor cur is
   with t as (select p_strId as txt from dual)
   select REGEXP_SUBSTR (txt, '[^;]+', 1, level) msisdn
        from t
        connect by level <= length(regexp_replace(txt,'[^;]*'))+1;

BEGIN
    delete from zone_user where zone_id = p_zoneId;

    if(p_strId is not null and length(p_strId) > 0) then
        begin
            OPEN cur;
            LOOP
                FETCH cur INTO v_id;
                EXIT WHEN cur%NOTFOUND;

                insert into zone_user(zone_id, screenname)
                values(p_zoneId,v_id);

            END LOOP;
            CLOSE cur;
        end;
    end if;

    commit;
END; -- Procedure
/

CREATE OR REPLACE PUBLIC SYNONYM PROC_ZONE_PERMISSION FOR LIVESCREEN.PROC_ZONE_PERMISSION;
