DROP PROCEDURE LIVESCREEN.ADD_PROGRAM_MANUAL;

CREATE OR REPLACE PROCEDURE LIVESCREEN.add_program_manual
   (p_subcontents varchar2,
    p_type number,
    p_status number,
    p_cps_topic_id number,
    p_id out varchar2)
   IS

    v_id number;
    v_strPid varchar2(50);
    v_index number;
BEGIN
    select 'MAN ' ||  LPAD(trim(to_char(SEQ_PROGRAM.NEXTVAL,'XXXXXXXXX')),8,'0')  into v_strPid from dual;
    
    select decode(max(indexs),null,0,max(indexs)) into v_index from programs a 
    where a.status <> 2 and a.cps_topic_id = p_cps_topic_id;
    
    v_index := v_index + 1;
    
    insert into PROGRAMS(program_id, subcontents, indexs, type, status, cps_topic_id,timeplug,INSERT_TIME) 
    values(v_strPid, p_subcontents, v_index, p_type, p_status, p_cps_topic_id, sysdate,sysdate);
    
    COMMIT;
    
    p_id := v_strPid;
END; -- Procedure
/

CREATE OR REPLACE PUBLIC SYNONYM ADD_PROGRAM_MANUAL FOR LIVESCREEN.ADD_PROGRAM_MANUAL;
