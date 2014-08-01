DROP PROCEDURE LIVESCREEN.PROC_CPZONE;

CREATE OR REPLACE PROCEDURE LIVESCREEN.proc_cpzone
   (p_time date
   , p_recordset OUT SYS_REFCURSOR)
   IS

   sql_str VARCHAR2(4000);
   sql_header VARCHAR2(1000);
   sql_from VARCHAR2(4000);
   v_zone_id zone.zone_id%type;
   v_zone_name zone.zone_name%type;
   
   cursor cur_zone is
       select zone.zone_id, zone.zone_name
       from zone
       order by zone.zone_name;

BEGIN
    sql_header := 'select cp.cp_id, cp.cpname ';
    sql_from := 'from cp ';
    
    open cur_zone;
    loop
        fetch cur_zone into v_zone_id, v_zone_name;
        EXIT WHEN cur_zone%NOTFOUND;
        begin 
            sql_header := sql_header || ', cou_' || v_zone_id;
            
            sql_from := sql_from || ' join ';
            sql_from := sql_from || ' (select cp.cp_id, decode(tb.cou,null,0,tb.cou) cou_' || v_zone_id;
            sql_from := sql_from || ' from cp left join ';
            sql_from := sql_from || ' (select cp_topic.cp_id , count(1) cou ';
            sql_from := sql_from || ' from cp_topic join broadcast_hist on cp_topic.cp_topic_id = broadcast_hist.cp_topic_id ';
            sql_from := sql_from || ' where zone_id = ' || v_zone_id || ' group by cp_topic.cp_id) tb on cp.cp_id = tb.cp_id ';
            sql_from := sql_from || ' ) tb_' || v_zone_id || ' on cp.cp_id = tb_' || v_zone_id || '.cp_id ';
        end;
    end loop;
    
    sql_str := sql_header || sql_from;
    
    
   open p_recordset for sql_str;
    
END; -- Procedure
/

CREATE OR REPLACE PUBLIC SYNONYM PROC_CPZONE FOR LIVESCREEN.PROC_CPZONE;
