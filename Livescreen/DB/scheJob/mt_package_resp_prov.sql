BEGIN
  SYS.DBMS_SCHEDULER.DROP_JOB
    (job_name  => 'LIVESCREEN.MT_PACKAGE_RESP_PROV');
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_JOB
    (
       job_name        => 'LIVESCREEN.MT_PACKAGE_RESP_PROV'
      ,start_date      => TO_TIMESTAMP_TZ('2013/08/15 14:32:23.000000 +07:00','yyyy/mm/dd hh24:mi:ss.ff tzr')
      ,repeat_interval => 'FREQ=Minutely;INTERVAL=15;BySecond=00'
      ,end_date        => NULL
      ,job_class       => 'DEFAULT_JOB_CLASS'
      ,job_type        => 'PLSQL_BLOCK'
      ,job_action      => 'BEGIN MT_PACKAGE.RESPONSE_PROVISIONING; END;'
      ,comments        => 'RESPONSE_PROVISIONING'
    );
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'LIVESCREEN.MT_PACKAGE_RESP_PROV'
     ,attribute => 'RESTARTABLE'
     ,value     => FALSE);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'LIVESCREEN.MT_PACKAGE_RESP_PROV'
     ,attribute => 'LOGGING_LEVEL'
     ,value     => SYS.DBMS_SCHEDULER.LOGGING_OFF);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => 'LIVESCREEN.MT_PACKAGE_RESP_PROV'
     ,attribute => 'MAX_FAILURES');
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => 'LIVESCREEN.MT_PACKAGE_RESP_PROV'
     ,attribute => 'MAX_RUNS');
  BEGIN
    SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
      ( name      => 'LIVESCREEN.MT_PACKAGE_RESP_PROV'
       ,attribute => 'STOP_ON_WINDOW_CLOSE'
       ,value     => FALSE);
  EXCEPTION
    -- could fail if program is of type EXECUTABLE...
    WHEN OTHERS THEN
      NULL;
  END;
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'LIVESCREEN.MT_PACKAGE_RESP_PROV'
     ,attribute => 'JOB_PRIORITY'
     ,value     => 3);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => 'LIVESCREEN.MT_PACKAGE_RESP_PROV'
     ,attribute => 'SCHEDULE_LIMIT');
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'LIVESCREEN.MT_PACKAGE_RESP_PROV'
     ,attribute => 'AUTO_DROP'
     ,value     => TRUE);

  SYS.DBMS_SCHEDULER.ENABLE
    (name                  => 'LIVESCREEN.MT_PACKAGE_RESP_PROV');
END;
/
