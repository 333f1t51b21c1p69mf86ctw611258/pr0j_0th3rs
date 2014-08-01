DROP PROCEDURE LIVESCREEN.PROC_ALERT_MESSAGE;

CREATE OR REPLACE PROCEDURE LIVESCREEN.proc_alert_message
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
    ip varchar2(100);
    alert_time date;
    type_name number;
    level_id number;
    content varchar2(1000);
    used number; -- % cpu, ram, hdd dung
      
    cursor cur_alert is
       select a.ip, a.sampled_time, a.type, b.alert_level_id, a.used
        from
            (select ip, sampled_time, type, used from system_resources
             where sampled_time >= sysdate - 5/1440
            ) a
            join
            (select alert_level_id, type_name, max_value, ip, min_value from alert_config where status = 1) b
            on a.ip = b.ip and a.type = b.type_name
            where a.used <= b.max_value and a.used >= b.min_value;
   -- Declare program variables as shown above
BEGIN
   open cur_alert;
   loop 
        fetch cur_alert into ip, alert_time, type_name, level_id, used;
        EXIT WHEN cur_alert%NOTFOUND;
        begin
            if (type_name = '1') then
                content := 'CPU ' || used || '%';
            else if (type_name = '2') then
                content := 'RAM ' || used || '%';
            else if (type_name = '3') then
                content := 'HDD ' || used || '%';
            end if;
            end if;
            end if;
            insert into alert_message(id, status, content, created_user, created_time, level_id, type)
            values(alert_message_seq.nextval, 0, content, ip, alert_time, level_id, type_name);
        end;
   end loop;
   commit;
END; -- Procedure
/

CREATE OR REPLACE PUBLIC SYNONYM PROC_ALERT_MESSAGE FOR LIVESCREEN.PROC_ALERT_MESSAGE;
