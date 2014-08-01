BEGIN
  SYS.DBMS_SCHEDULER.DROP_JOB
    (job_name  => 'LIVESCREEN.MT_PACKAGE_PREP_EXT_MES');
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_JOB
    (
       job_name        => 'LIVESCREEN.MT_PACKAGE_PREP_EXT_MES'
      ,start_date      => TO_TIMESTAMP_TZ('2013/08/15 14:17:01.000000 +07:00','yyyy/mm/dd hh24:mi:ss.ff tzr')
      ,repeat_interval => 'FREQ=Minutely;INTERVAL=15;BySecond=00'
      ,end_date        => NULL
      ,job_class       => 'DEFAULT_JOB_CLASS'
      ,job_type        => 'PLSQL_BLOCK'
      ,job_action      => 'BEGIN MT_PACKAGE.PREPARE_EXTEND_MESSAGE; END;'
      ,comments        => 'PREPARE_EXTEND_MESSAGE'
    );
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'LIVESCREEN.MT_PACKAGE_PREP_EXT_MES'
     ,attribute => 'RESTARTABLE'
     ,value     => FALSE);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'LIVESCREEN.MT_PACKAGE_PREP_EXT_MES'
     ,attribute => 'LOGGING_LEVEL'
     ,value     => SYS.DBMS_SCHEDULER.LOGGING_OFF);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => 'LIVESCREEN.MT_PACKAGE_PREP_EXT_MES'
     ,attribute => 'MAX_FAILURES');
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => 'LIVESCREEN.MT_PACKAGE_PREP_EXT_MES'
     ,attribute => 'MAX_RUNS');
  BEGIN
    SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
      ( name      => 'LIVESCREEN.MT_PACKAGE_PREP_EXT_MES'
       ,attribute => 'STOP_ON_WINDOW_CLOSE'
       ,value     => FALSE);
  EXCEPTION
    -- could fail if program is of type EXECUTABLE...
    WHEN OTHERS THEN
      NULL;
  END;
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'LIVESCREEN.MT_PACKAGE_PREP_EXT_MES'
     ,attribute => 'JOB_PRIORITY'
     ,value     => 3);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => 'LIVESCREEN.MT_PACKAGE_PREP_EXT_MES'
     ,attribute => 'SCHEDULE_LIMIT');
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'LIVESCREEN.MT_PACKAGE_PREP_EXT_MES'
     ,attribute => 'AUTO_DROP'
     ,value     => TRUE);

  SYS.DBMS_SCHEDULER.ENABLE
    (name                  => 'LIVESCREEN.MT_PACKAGE_PREP_EXT_MES');
END;
/
