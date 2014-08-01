DROP PROCEDURE LIVESCREEN.PROC_DELETE_BROADCAST_CATEGORY;

CREATE OR REPLACE PROCEDURE LIVESCREEN.proc_delete_broadcast_category
   (p_id_category number)
   IS

BEGIN
    delete from broadcast_category
    where category_id in
        (select category_id from broadcast_category
         start with category_id = p_id_category
         connect by prior category_id = parent_id);

    insert into schedule_rebuild_command(IMMEDIATELY, status) values(1,0);

    commit;
END; -- Procedure
/

CREATE OR REPLACE PUBLIC SYNONYM PROC_DELETE_BROADCAST_CATEGORY FOR LIVESCREEN.PROC_DELETE_BROADCAST_CATEGORY;
