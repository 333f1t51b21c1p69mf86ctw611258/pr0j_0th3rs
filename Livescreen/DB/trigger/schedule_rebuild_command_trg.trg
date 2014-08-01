DROP TRIGGER LIVESCREEN.SCHEDULE_REBUILD_COMMAND_TRG;

CREATE OR REPLACE TRIGGER LIVESCREEN.SCHEDULE_REBUILD_COMMAND_TRG  
   before insert on "LIVESCREEN"."SCHEDULE_REBUILD_COMMAND" 
   for each row
begin  
   if inserting then 
      if :NEW."COMMAND_ID" is null then 
         select SCHEDULE_REBUILD_SEQ.nextval into :NEW."COMMAND_ID" from dual; 
      end if; 
   end if; 
end;
/
