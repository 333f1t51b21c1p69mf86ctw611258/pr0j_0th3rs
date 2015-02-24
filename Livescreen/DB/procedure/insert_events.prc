DROP PROCEDURE LIVESCREEN.INSERT_EVENTS;

CREATE OR REPLACE PROCEDURE LIVESCREEN."INSERT_EVENTS" (
   log_username   IN VARCHAR2,
   log_action     IN VARCHAR2,
   log_describe   IN VARCHAR2,
   log_level      IN NUMBER)
IS
BEGIN
   INSERT INTO lsb_omap_log (log_username,
                         log_action,
                         log_describe,
                         log_level)
        VALUES (log_username,
                log_action,
                log_describe,
                log_level);
   COMMIT;
END;
/

CREATE OR REPLACE PUBLIC SYNONYM INSERT_EVENTS FOR LIVESCREEN.INSERT_EVENTS;
