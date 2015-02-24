DROP TRIGGER LIVESCREEN.TRG_AR_UPDATE_PROFILE;

CREATE OR REPLACE TRIGGER LIVESCREEN.TRG_AR_UPDATE_PROFILE
   AFTER UPDATE
   ON LIVESCREEN.PROFILE
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
   PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
   INSERT INTO profile_temp
        VALUES (profile_hist_seq.NEXTVAL,
                :old.msisdn,
                :new.activetime,
                :old.imei,
                :new.status_id,
                :old.cos_id,
                :new.deactivetime,
                :old.version,
                :old.lac,
                :old.cell,
                :old.subtype,
                '3',
                SYSDATE,
                0);

   COMMIT;
END;
/
