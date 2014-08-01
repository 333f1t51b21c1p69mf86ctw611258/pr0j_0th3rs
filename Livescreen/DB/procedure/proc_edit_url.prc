DROP PROCEDURE LIVESCREEN.PROC_EDIT_URL;

CREATE OR REPLACE PROCEDURE LIVESCREEN.proc_edit_url
   (p_cptopic_ids varchar2,
    p_id_node number)
   IS

   v_cp_topic_id number;

   cursor cur is
   with t as (select p_cptopic_ids as txt from dual)
   select REGEXP_SUBSTR (txt, '[^;]+', 1, level) msisdn
        from t
        connect by level <= length(regexp_replace(txt,'[^;]*'))+1;

BEGIN
    delete from category_url_detail where category_id = p_id_node;

    if(p_cptopic_ids is not null and length(p_cptopic_ids) > 0) then
        begin
            OPEN cur;
            LOOP
                FETCH cur INTO v_cp_topic_id;
                EXIT WHEN cur%NOTFOUND;

                insert into category_url_detail(cp_topic_id, category_id)
                values(v_cp_topic_id,p_id_node);

            END LOOP;
            CLOSE cur;
        end;
    end if;

    insert into schedule_rebuild_command(IMMEDIATELY, status) values(1,0);

    commit;
END; -- Procedure
/

CREATE OR REPLACE PUBLIC SYNONYM PROC_EDIT_URL FOR LIVESCREEN.PROC_EDIT_URL;
