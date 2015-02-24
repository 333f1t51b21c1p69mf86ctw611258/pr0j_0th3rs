DROP PROCEDURE LIVESCREEN.PROC_TIMELINE;

CREATE OR REPLACE PROCEDURE LIVESCREEN.proc_timeline
   (hihi varchar2)
   IS

i number;
j number;

v_hour varchar2(10);
v_minute varchar2(10);
v_time varchar2(10);

BEGIN
    i := 0;
    j := 0;
    
    for i in 0..23
    loop
        v_hour := lpad(i,2,0);
        for j in 0..59
        loop
            v_minute := lpad(j,2,0);
            v_time := v_hour || ':' || v_minute;
            
            insert into timeline(time) values(v_time);
        end loop;
    end loop;
    commit;
    
END; -- Procedure
/
