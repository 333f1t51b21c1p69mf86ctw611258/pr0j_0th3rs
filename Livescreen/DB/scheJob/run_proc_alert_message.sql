BEGIN
  SYS.DBMS_SCHEDULER.DROP_JOB
    (job_name  => 'LIVESCREEN.RUN_PROC_ALERT_MESSAGE');
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_JOB
    (
       job_name        => 'LIVESCREEN.RUN_PROC_ALERT_MESSAGE'
      ,start_date      => TO_TIMESTAMP_TZ('2013/05/30 11:45:41.000000 +07:00','yyyy/mm/dd hh24:mi:ss.ff tzr')
      ,repeat_interval => 'FREQ=MINUTELY; INTERVAL=5'
      ,end_date        => NULL
      ,job_class       => 'DEFAULT_JOB_CLASS'
      ,job_type        => 'STORED_PROCEDURE'
      ,job_action      => 'PROC_ALERT_MESSAGE'
      ,comments        => NULL
    );
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'LIVESCREEN.RUN_PROC_ALERT_MESSAGE'
     ,attribute => 'RESTARTABLE'
     ,value     => FALSE);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'LIVESCREEN.RUN_PROC_ALERT_MESSAGE'
     ,attribute => 'LOGGING_LEVEL'
     ,value     => SYS.DBMS_SCHEDULER.LOGGING_OFF);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => 'LIVESCREEN.RUN_PROC_ALERT_MESSAGE'
     ,attribute => 'MAX_FAILURES');
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => 'LIVESCREEN.RUN_PROC_ALERT_MESSAGE'
     ,attribute => 'MAX_RUNS');
  BEGIN
    SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
      ( name      => 'LIVESCREEN.RUN_PROC_ALERT_MESSAGE'
       ,attribute => 'STOP_ON_WINDOW_CLOSE'
       ,value     => FALSE);
  EXCEPTION
    -- could fail if program is of type EXECUTABLE...
    WHEN OTHERS THEN
      NULL;
  END;
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'LIVESCREEN.RUN_PROC_ALERT_MESSAGE'
     ,attribute => 'JOB_PRIORITY'
     ,value     => 3);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => 'LIVESCREEN.RUN_PROC_ALERT_MESSAGE'
     ,attribute => 'SCHEDULE_LIMIT');
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'LIVESCREEN.RUN_PROC_ALERT_MESSAGE'
     ,attribute => 'AUTO_DROP'
     ,value     => FALSE);

  SYS.DBMS_SCHEDULER.ENABLE
    (name                  => 'LIVESCREEN.RUN_PROC_ALERT_MESSAGE');
END;
/
