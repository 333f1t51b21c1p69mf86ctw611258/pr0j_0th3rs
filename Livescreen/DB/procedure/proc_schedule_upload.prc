DROP PROCEDURE LIVESCREEN.PROC_SCHEDULE_UPLOAD;

CREATE OR REPLACE PROCEDURE LIVESCREEN.proc_schedule_upload
   (p_upload_id number)
   IS

   cursor cur_zone is
       select a.zone_id, a.zonename
       from zones a join
           (select distinct zonename
           from broadcasttime_upload
           where broadcasttime_upload.upload_id = p_upload_id) b
        on LOWER(a.zonename) = LOWER(b.zonename);

   v_zonename varchar2(200);
   v_zoneid number;
   v_count number;
BEGIN
     open cur_zone;
     loop
        fetch cur_zone into v_zoneid, v_zonename;
        EXIT WHEN cur_zone%NOTFOUND;
        begin
            v_count := 0;
            select count(1) into v_count
            from broadcasttime_upload bu
            where bu.UPLOAD_ID = p_upload_id
                and LOWER(bu.ZONENAME) = LOWER(v_zonename);

            if(v_count > 0) then
                begin
                    --------------------------------------------------------------------
                    -- Backup broadcast by zone
                    insert into broadcasttime_backup(upload_id, PROGRAM_INDEXS, CP_TOPIC_ID, ZONE_ID, STARTTIME, STATUS, CREATEDBY, CREATEDDATE, TIME)
                    select p_upload_id, PROGRAM_INDEXS, CP_TOPIC_ID, ZONE_ID, STARTTIME, STATUS, CREATEDBY, CREATEDDATE, sysdate
                    from broadcasttime
                    where zone_id = v_zoneid;

                    --------------------------------------------------------------------
                    -- Xoa o bang broadcast
                    delete from broadcasttime where zone_id = v_zoneid;
                    --------------------------------------------------------------------
                    -- Them moi vao bang broadcast
                    --------------------------------------------------------------------
                    insert into broadcasttime(broadcasttime_id, program_indexs, cp_topic_id, zone_id
                        , starttime, status, createdby, createddate)
                    select broadcasttime_seq.nextval, bu.PROINDEX,cp_topic.CP_TOPIC_ID
                        , v_zoneid, bu.STARTTIME, 0
                        , null, sysdate
                    from broadcasttime_upload bu, cp, topic, cp_topic
                    where bu.UPLOAD_ID = p_upload_id
                        and LOWER(bu.ZONENAME) = LOWER(v_zonename)
                        and LOWER(cp.cpname) = LOWER(bu.cpname)
                        and LOWER(topic.topicname) = LOWER(bu.topicname)
                        and cp.cp_id = cp_topic.cp_id
                        and topic.topic_id = cp_topic.topic_id
                        and LOWER(cp_topic.SUB_TOPIC_NAME) = LOWER(bu.SUBTOPICNAME);
                end;
            end if;
        end;
     end loop;

     commit;

     EXCEPTION
     WHEN OTHERS
        THEN ROLLBACK;
END; -- Procedure
/

CREATE OR REPLACE PUBLIC SYNONYM PROC_SCHEDULE_UPLOAD FOR LIVESCREEN.PROC_SCHEDULE_UPLOAD;
