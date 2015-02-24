DROP TRIGGER LIVESCREEN.TRG_AR_INSERT_PROFILE;

CREATE OR REPLACE TRIGGER LIVESCREEN.TRG_AR_INSERT_PROFILE
   AFTER INSERT
   ON LIVESCREEN.PROFILE
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
   PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
   INSERT INTO profile_temp
        VALUES (profile_hist_seq.NEXTVAL,
                :new.msisdn,
                :new.activetime,
                :new.imei,
                :new.status_id,
                :new.cos_id,
                :new.deactivetime,
                :new.version,
                :new.lac,
                :new.cell,
                :new.subtype,
                '1',
                SYSDATE,
                0);

   COMMIT;
END;
/
