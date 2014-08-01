BEGIN
  SYS.DBMS_SCHEDULER.DROP_JOB
    (job_name  => 'LIVESCREEN.MT_PACKAGE_RECOVER_PROCESS');
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_JOB
    (
       job_name        => 'LIVESCREEN.MT_PACKAGE_RECOVER_PROCESS'
      ,start_date      => TO_TIMESTAMP_TZ('2013/08/15 14:05:50.000000 +07:00','yyyy/mm/dd hh24:mi:ss.ff tzr')
      ,repeat_interval => 'FREQ=Minutely;INTERVAL=2;BySecond=00'
      ,end_date        => NULL
      ,job_class       => 'DEFAULT_JOB_CLASS'
      ,job_type        => 'PLSQL_BLOCK'
      ,job_action      => 'BEGIN MT_PACKAGE.RECOVER_PROCESS; END;'
      ,comments        => 'RECOVER_PROCESS'
    );
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'LIVESCREEN.MT_PACKAGE_RECOVER_PROCESS'
     ,attribute => 'RESTARTABLE'
     ,value     => FALSE);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'LIVESCREEN.MT_PACKAGE_RECOVER_PROCESS'
     ,attribute => 'LOGGING_LEVEL'
     ,value     => SYS.DBMS_SCHEDULER.LOGGING_OFF);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => 'LIVESCREEN.MT_PACKAGE_RECOVER_PROCESS'
     ,attribute => 'MAX_FAILURES');
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => 'LIVESCREEN.MT_PACKAGE_RECOVER_PROCESS'
     ,attribute => 'MAX_RUNS');
  BEGIN
    SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
      ( name      => 'LIVESCREEN.MT_PACKAGE_RECOVER_PROCESS'
       ,attribute => 'STOP_ON_WINDOW_CLOSE'
       ,value     => FALSE);
  EXCEPTION
    -- could fail if program is of type EXECUTABLE...
    WHEN OTHERS THEN
      NULL;
  END;
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'LIVESCREEN.MT_PACKAGE_RECOVER_PROCESS'
     ,attribute => 'JOB_PRIORITY'
     ,value     => 3);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => 'LIVESCREEN.MT_PACKAGE_RECOVER_PROCESS'
     ,attribute => 'SCHEDULE_LIMIT');
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'LIVESCREEN.MT_PACKAGE_RECOVER_PROCESS'
     ,attribute => 'AUTO_DROP'
     ,value     => TRUE);

  SYS.DBMS_SCHEDULER.ENABLE
    (name                  => 'LIVESCREEN.MT_PACKAGE_RECOVER_PROCESS');
END;
/
