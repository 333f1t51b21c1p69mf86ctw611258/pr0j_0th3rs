DROP PROCEDURE LIVESCREEN.MOVE_DATA_MTPKG_SUBS2_HIS;

CREATE OR REPLACE PROCEDURE LIVESCREEN.MOVE_DATA_MTPKG_SUBS2_HIS
   IS
BEGIN
    UPDATE MTPKG_SUBSCRIBER_TEMP SET move_status=100 WHERE move_status = 0 and rownum < 15000;
    INSERT INTO MTPKG_SUBSCRIBER_HIS(id,msisdn,pkgd_id,register_time,deregister_time,status,last_update,last_update_by,action,insert_time)
	SELECT id,msisdn,pkgd_id,register_time,deregister_time,status,last_update,last_update_by,action,insert_time
		FROM MTPKG_SUBSCRIBER_TEMP WHERE move_status=100;
    delete MTPKG_SUBSCRIBER_TEMP WHERE move_status =100;
    commit;
    EXCEPTION
    WHEN others THEN
       rollback ;
END;
/
