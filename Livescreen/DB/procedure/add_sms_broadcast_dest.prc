DROP PROCEDURE LIVESCREEN.ADD_SMS_BROADCAST_DEST;

CREATE OR REPLACE PROCEDURE LIVESCREEN.add_sms_broadcast_dest
   (p_broadcast_id in sms_broadcast_dest.broadcast_id%type
    , p_str_msisdn in varchar2
    )
   IS
   
    v_msisdn varchar2(50);
    
    cursor cur is
    with t as (select p_str_msisdn as txt from dual)
    select REGEXP_SUBSTR (txt, '[^;]+', 1, level) msisdn
                from t
                connect by level <= length(regexp_replace(txt,'[^;]*'))+1;
   
BEGIN
    
    
    OPEN cur;
    LOOP
        FETCH cur INTO v_msisdn;
        EXIT WHEN cur%NOTFOUND;
        
        insert into sms_broadcast_dest(sms_broadcast_dest.id, sms_broadcast_dest.msisdn,sms_broadcast_dest.status,
            sms_broadcast_dest.broadcast_id,sms_broadcast_dest.insert_time)
        values(seq_sms_broadcast_dest.nextval,v_msisdn,0,p_broadcast_id,sysdate);

    END LOOP;
    CLOSE cur;
   
   commit;
END; -- Procedure
/

CREATE OR REPLACE PUBLIC SYNONYM ADD_SMS_BROADCAST_DEST FOR LIVESCREEN.ADD_SMS_BROADCAST_DEST;
