DROP FUNCTION LIVESCREEN.REMOVE_MSISDN;

CREATE OR REPLACE FUNCTION LIVESCREEN.remove_msisdn (msisdn_a IN VARCHAR2)
   RETURN NUMBER
IS
   count_a   NUMBER;
---------------------------------------------------------------------------------------------------------
-- For module WebAPI
-- Xoa ban ghi cua cac bang sau:
--   1. PROFILE: Online
--   2. BILLING_CHARGING: Chua cac thue bao tru phi(active dv, monthly) thanh cong
--   3. DISCOUNT_BILLING: Chua thue bao duoc khuyen mai
--   4. MONTHLY_CHARGE: Chua thue bao can tru phi thang
--   5. PROFILE_TOPIC: Chua thue bao cung topic cua chung
--   6. SMS_MESSAGES_QUEUE: Chua tin nhan thong bao gia han
-- Tra ve:
--  -1 = Exception
--   0 = Thanh cong
--   1 = Thue bao khong ton tai
---------------------------------------------------------------------------------------------------------

BEGIN
   count_a := 0;

   -- Kiem tra xem thue bao co ton tai khong, neu khong ton tai thi tra ve gia tri 1
   SELECT COUNT (msisdn)
     INTO count_a
     FROM PROFILE
    WHERE msisdn = msisdn_a;

   IF (count_a <= 0)
   THEN
      RETURN 1;
   END IF;

   -- 1. PROFILE
   DELETE PROFILE
    WHERE MSISDN = msisdn_a;

   --  -- 2. BILLING_CHARGING
   --  delete BILLING_CHARGING where MDN = msisdn_a;

   -- 3. DISCOUNT_BILLING
   DELETE LSB_DISCOUNT_BILLING db
    WHERE db.msisdn = msisdn_a;

   --  -- 4. MONTHLY_CHARGE
   --  delete MONTHLY_CHARGE where MDN = msisdn_a;

   -- 5. PROFILE_TOPIC
   DELETE PROFILE_TOPIC
    WHERE MSISDN = msisdn_a;

   -- 6. SMS_MESSAGE_QUEUE
   DELETE SMS_MESSAGES_QUEUE
    WHERE MSISDN = msisdn_a;

   -- Thanh cong het moi duoc commit
   COMMIT;

   RETURN 0;
EXCEPTION
   WHEN OTHERS
   THEN
      RETURN -1;
END remove_msisdn;
/

CREATE OR REPLACE PUBLIC SYNONYM REMOVE_MSISDN FOR LIVESCREEN.REMOVE_MSISDN;
