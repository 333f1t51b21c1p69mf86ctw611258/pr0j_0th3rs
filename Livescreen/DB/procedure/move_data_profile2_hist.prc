DROP PROCEDURE LIVESCREEN.MOVE_DATA_PROFILE2_HIST;

CREATE OR REPLACE PROCEDURE LIVESCREEN.MOVE_DATA_PROFILE2_HIST
   IS
BEGIN
    UPDATE PROFILE_TEMP SET move_status=100 WHERE move_status = 0 and rownum < 15000;
    INSERT INTO profile_HIST(id,msisdn,activetime,imei,status_id,cos_id,deactivetime,version,lac,cell,subtype,action,insert_time)
	SELECT id,msisdn,activetime,imei,status_id,cos_id,deactivetime,version,lac,cell,subtype,action,insert_time
		FROM PROFILE_TEMP WHERE move_status=100;
    delete PROFILE_TEMP WHERE move_status =100;
    commit;
    EXCEPTION
    WHEN others THEN
       rollback ;
END;
/

CREATE OR REPLACE PUBLIC SYNONYM MOVE_DATA_PROFILE2_HIST FOR LIVESCREEN.MOVE_DATA_PROFILE2_HIST;
