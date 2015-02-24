DROP PROCEDURE LIVESCREEN.MOVE_DATA_SMSQUEUE2_HIST;

CREATE OR REPLACE PROCEDURE LIVESCREEN.move_data_smsqueue2_hist
   IS
BEGIN
    UPDATE sms_messages_queue SET move_status=1 WHERE (status=2 or datetime<trunc(sysdate)) and (move_status=0 or move_status is null);
    INSERT INTO sms_messages_queue_hist(id,msisdn,content,datetime,status)
        select id,msisdn,content,datetime,status from sms_messages_queue where move_status=1;
    DELETE FROM sms_messages_queue WHERE move_status=1;
    commit;
    EXCEPTION
    WHEN others THEN
       rollback ;
END;
/

CREATE OR REPLACE PUBLIC SYNONYM MOVE_DATA_SMSQUEUE2_HIST FOR LIVESCREEN.MOVE_DATA_SMSQUEUE2_HIST;
