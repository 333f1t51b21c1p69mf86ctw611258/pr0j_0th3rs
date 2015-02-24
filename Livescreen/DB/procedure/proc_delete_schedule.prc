DROP PROCEDURE LIVESCREEN.PROC_DELETE_SCHEDULE;

CREATE OR REPLACE PROCEDURE LIVESCREEN.proc_delete_schedule
   (p_id_schedule number
    )
   IS

BEGIN
    delete from schedule_zone_detail where schedule_id = p_id_schedule;
    
    delete from category_schedule where schedule_id = p_id_schedule;
    
    insert into schedule_rebuild_command(IMMEDIATELY, status) values(1,0);
    
    commit;
END; -- Procedure
/

CREATE OR REPLACE PUBLIC SYNONYM PROC_DELETE_SCHEDULE FOR LIVESCREEN.PROC_DELETE_SCHEDULE;
