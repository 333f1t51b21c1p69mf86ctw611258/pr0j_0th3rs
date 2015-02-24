DROP PROCEDURE LIVESCREEN.MTPKG_RESEND_MESSAGE;

CREATE OR REPLACE PROCEDURE LIVESCREEN.MTPKG_RESEND_MESSAGE(
  in_ID IN NUMBER,
  tbl in VARCHAR2
)
IS
BEGIN
   IF tbl = 'HIST' THEN
       BEGIN
           ------- Buoc 1: Insert vao bang QUEUE 1 ban ghi voi ID moi tu sinh va cac truong toi thieu -------
           INSERT INTO MTPKG_MESSAGE_QUEUE (MSISDN,
                                            STATUS,
                                            RESP_TYPE,
                                            SEND_TIME,
                                            CONTENT,
                                            PRIORITY)
                    SELECT MSISDN,
                           0,
                           RESP_TYPE,
                           sysdate,
                           CONTENT,
                           1
                           FROM MTPKG_MESSAGE_HIS
                           WHERE ID = in_ID;

          ------- Buoc 2: Xoa ban ghi cu trong bang HIS --------
          DELETE FROM MTPKG_MESSAGE_HIS
            WHERE ID = in_ID;
      END;
  ELSIF tbl = 'QUEUE' THEN
      BEGIN
          UPDATE mtpkg_message_queue set status = 0, PRIORITY = 1, SEND_TIME = sysdate
          WHERE ID = in_ID;
      END;
  END IF;
  COMMIT;
END;
/

CREATE OR REPLACE PUBLIC SYNONYM MTPKG_RESEND_MESSAGE FOR LIVESCREEN.MTPKG_RESEND_MESSAGE;
