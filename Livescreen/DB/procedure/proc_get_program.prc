DROP PROCEDURE LIVESCREEN.PROC_GET_PROGRAM;

CREATE OR REPLACE PROCEDURE LIVESCREEN.proc_get_program
   (p_categoryid in number
    , p_result out SYS_REFCURSOR)
   IS

BEGIN
    open p_result for
    select program_id, cps_topic_id, indexs
        , subcontents, type
        , to_char(timeplug,'dd/mm/yyyy') tim
        , status
    from programs 
    where timeplug >= sysdate - 7
        and cps_topic_id in 
        (select cp_topic_id 
        from broadcast_category join category_url_detail on broadcast_category.category_id = category_url_detail.category_id
        start with broadcast_category.category_id = p_categoryid
        connect by prior broadcast_category.category_id = broadcast_category.parent_id
        )
    order by timeplug desc, indexs asc
    ;
END; -- Procedure
/

CREATE OR REPLACE PUBLIC SYNONYM PROC_GET_PROGRAM FOR LIVESCREEN.PROC_GET_PROGRAM;
