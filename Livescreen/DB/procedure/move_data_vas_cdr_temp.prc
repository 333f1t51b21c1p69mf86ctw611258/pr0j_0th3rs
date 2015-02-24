DROP PROCEDURE LIVESCREEN.MOVE_DATA_VAS_CDR_TEMP;

CREATE OR REPLACE PROCEDURE LIVESCREEN.move_data_vas_cdr_temp

   IS

BEGIN
    UPDATE VAS_CDR_TEMP SET move_status = 1 WHERE rownum < 15000;

    INSERT INTO VAS_CDR(msisdn,short_code, mo_content, time, seq_id, status, status_detail)
    SELECT '84' || subs_msisdn, service_msisdn, content, receive_time, msg_id, status, status_detail
        FROM VAS_CDR_TEMP WHERE move_status = 1 and msg_type = 1;

    INSERT INTO VAS_CDR_MT(msisdn,short_code, mt_content, time, seq_id, status, status_detail)
    SELECT '84' || subs_msisdn, service_msisdn, content, receive_time, msg_id, status, status_detail
        FROM VAS_CDR_TEMP WHERE move_status = 1 and msg_type = 2;

    delete VAS_CDR_TEMP WHERE move_status = 1;

    commit;

    EXCEPTION
    WHEN others THEN
       rollback ;
END; -- Procedure
/
