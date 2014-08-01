DROP PROCEDURE LIVESCREEN.PROC_CREATE_SCHEDULER;

CREATE OR REPLACE PROCEDURE LIVESCREEN."PROC_CREATE_SCHEDULER" as
begin
dbms_scheduler.create_job
 (job_name => 'JOB_SUBSCRIBER_HIST',
    job_type => 'PLSQL_BLOCK',
  job_action=> 'BEGIN MOVE_DATA_SUBSCRIBER_HIST(); END;',
  start_date=> NULL,
  repeat_interval=> 'FREQ=MINUTELY; INTERVAL=5;',
  enabled=>true,
  auto_drop=>FALSE,
  comments=>'');
end PROC_CREATE_SCHEDULER;
/
