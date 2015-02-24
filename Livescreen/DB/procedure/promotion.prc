DROP PROCEDURE LIVESCREEN.PROMOTION;

CREATE OR REPLACE PROCEDURE LIVESCREEN.promotion (msisdn      IN VARCHAR2,
                                                  promotion   IN NUMBER)
AS
   count_msisdn   NUMBER;
---------------------------------------------------------------------------------------------------------
-- For module WebAPI
-- Insert vao bang DISCOUNT_BILLING voi so thang mien phi la promotion
---------------------------------------------------------------------------------------------------------

BEGIN
   SELECT COUNT (db.msisdn)
     INTO count_msisdn
     FROM LSB_DISCOUNT_BILLING db
    WHERE db.msisdn = msisdn;

   IF (count_msisdn >= 1)
   THEN
      UPDATE LSB_DISCOUNT_BILLING db
         SET starttime = SYSDATE, endtime = ADD_MONTHS (SYSDATE, promotion)
       WHERE db.msisdn = msisdn;
   ELSE
      INSERT INTO LSB_DISCOUNT_BILLING (id,
                                    discounttype,
                                    starttime,
                                    endtime,
                                    discount,
                                    ratediscount,
                                    msisdn)
           VALUES (PROMOTION_SEQ.NEXTVAL,
                   'MONTHLY',
                   SYSDATE,
                   ADD_MONTHS (SYSDATE, promotion),
                   0,
                   0,
                   msisdn);
   END IF;

   COMMIT;
END promotion;
/

CREATE OR REPLACE PUBLIC SYNONYM PROMOTION FOR LIVESCREEN.PROMOTION;
