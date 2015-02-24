DROP PROCEDURE LIVESCREEN.PROC_EDIT_SCHEDULE;

CREATE OR REPLACE PROCEDURE LIVESCREEN.proc_edit_schedule
   ( p_id_schedule number,
     p_id_node number,
     p_starttime varchar2,
     p_endtime varchar2,
     p_interval number,
     p_breakingnews number,
     p_time_type number,
     p_time_select varchar2,
     p_zone varchar2
     , p_startdate varchar2
     , p_enddate varchar2
     , p_age number)
   IS

   v_id number;
   v_zone number;
    
   cursor cur is
   with t as (select p_zone as txt from dual)
   select REGEXP_SUBSTR (txt, '[^;]+', 1, level) msisdn
        from t
        connect by level <= length(regexp_replace(txt,'[^;]*'))+1;
    
BEGIN
    if(p_id_schedule is null or p_id_schedule = '') then
        begin
            select category_schedule_seq.nextval into v_id from dual;
            
            insert into category_schedule(schedule_id, category_id, start_time, end_time, interval
                , breaking_news, time_type, time_select, priority
                , START_EFFECT_DATE, END_EFFECT_DATE, MAX_AGE)
            values (v_id,p_id_node, to_date('01/01/1970 ' || p_starttime,'dd/mm/yyyy hh24:mi')
                    , to_date('01/01/1970 ' || p_endtime,'dd/mm/yyyy hh24:mi')
                    , p_interval, p_breakingnews, p_time_type, p_time_select, 1
                    , decode(p_startdate,'', null,to_date(p_startdate,'dd/mm/yyyy'))
                    , decode(p_enddate,'', null,to_date(p_enddate,'dd/mm/yyyy'))
                    , p_age
                    );
            
            if(length(p_zone) > 0) then
                OPEN cur;
                LOOP
                    FETCH cur INTO v_zone;
                    EXIT WHEN cur%NOTFOUND;
                    
                    insert into schedule_zone_detail(schedule_id, zone_id)
                    values(v_id,v_zone);

                END LOOP;
                CLOSE cur;
            end if;
            
        end;
    else
        begin 
            delete from schedule_zone_detail where schedule_id = p_id_schedule;
            
             if(length(p_zone) > 0) then
                OPEN cur;
                LOOP
                    FETCH cur INTO v_zone;
                    EXIT WHEN cur%NOTFOUND;
                    
                    insert into schedule_zone_detail(schedule_id, zone_id)
                    values(p_id_schedule,v_zone);

                END LOOP;
                CLOSE cur;
            end if;
            
            update category_schedule set start_time = to_date('01/01/1970 ' || p_starttime,'dd/mm/yyyy hh24:mi')
                , end_time = to_date('01/01/1970 ' || p_endtime,'dd/mm/yyyy hh24:mi')
                , interval = p_interval, breaking_news = p_breakingnews
                , time_type = p_time_type, time_select = p_time_select
                , START_EFFECT_DATE = decode(p_startdate,'', null,to_date(p_startdate,'dd/mm/yyyy'))
                , END_EFFECT_DATE = decode(p_enddate,'', null,to_date(p_enddate,'dd/mm/yyyy'))
                , MAX_AGE = p_age
            where schedule_id = p_id_schedule;
        end;
    end if;
    
    insert into schedule_rebuild_command(IMMEDIATELY, status) values(1,0);
    
    commit;

END; -- Procedure
/

CREATE OR REPLACE PUBLIC SYNONYM PROC_EDIT_SCHEDULE FOR LIVESCREEN.PROC_EDIT_SCHEDULE;
