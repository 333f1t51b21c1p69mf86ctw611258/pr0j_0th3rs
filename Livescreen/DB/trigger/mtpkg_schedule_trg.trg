DROP TRIGGER LIVESCREEN.MTPKG_SCHEDULE_TRG;

CREATE OR REPLACE TRIGGER LIVESCREEN.MTPKG_SCHEDULE_TRG     before insert ON LIVESCREEN.MTPKG_SCHEDULE    for each row
begin     if inserting then       if :NEW."SCHEDULE_ID" is null then          select MTPKG_SCHEDULE_SEQ.nextval into :NEW."SCHEDULE_ID" from dual;       end if;    end if; end;
/
