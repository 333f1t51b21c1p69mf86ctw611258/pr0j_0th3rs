DROP FUNCTION LIVESCREEN.CHANGE_MSISDN;

CREATE OR REPLACE FUNCTION LIVESCREEN.change_msisdn (msisdn_a   IN VARCHAR2,
                                                     msisdn_b   IN VARCHAR2)
   RETURN NUMBER
IS
   count_a          NUMBER;
   count_active_a   NUMBER;
   count_b          NUMBER;
   remove_b         NUMBER;
---------------------------------------------------------------------------------------------------------
-- For module WebAPI
-- Doi so thue bao a -> b cua cac bang sau:
--   1. PROFILE: Online
--   2. BILLING_CHARGING: Chua cac thue bao tru phi(active dv, monthly) thanh cong
--   3. DISCOUNT_BILLING: Chua thue bao duoc khuyen mai
--   4. MONTHLY_CHARGE: Chua thue bao can tru phi thang
--   5. PROFILE_TOPIC: Chua thue bao cung topic cua chung
--   6. SMS_MESSAGES_QUEUE: Chua tin nhan thong bao gia han
-- Tra ve:
--  -1 = Exception
--   0 = Thanh cong
--   1 = Thue bao A ko ton tai
--   2 = Thue bao A chua kich hoat dich vu
--   3 = Ko xoa duoc thue bao B khoi he thong
---------------------------------------------------------------------------------------------------------

BEGIN
   count_a := 0;
   count_active_a := 0;
   count_b := 0;
   remove_b := -1;

   -- Kiem tra xem thue bao A co ton tai khong, neu khong ton tai thi tra ve gia tri 1
   SELECT COUNT (msisdn)
     INTO count_a
     FROM PROFILE
    WHERE msisdn = msisdn_a;

   IF (count_a <= 0)
   THEN
      RETURN 1;
   END IF;

   -- Kiem tra xem thue bao A co dang active dv khong, neu khong active thi tra ve gia tri 2
   SELECT COUNT (msisdn)
     INTO count_active_a
     FROM PROFILE
    WHERE msisdn = msisdn_a AND status_id IN (1, 2, 3);

   IF (count_active_a <= 0)
   THEN
      RETURN 2;
   END IF;

   -- Kiem tra xem thue bao B co ton tai khong, neu ton tai thi remove thue bao B khoi he thong, neu that bai tra ve 2
   SELECT COUNT (msisdn)
     INTO count_b
     FROM PROFILE
    WHERE msisdn = msisdn_b;

   IF (count_b > 0)
   THEN
      remove_b := remove_msisdn (msisdn_b);

      IF (remove_b != 0)
      THEN
         RETURN 3;
      END IF;
   END IF;

   -- 1. PROFILE
   UPDATE PROFILE
      SET msisdn = msisdn_b
    WHERE msisdn = msisdn_a;

   --  -- 2. BILLING_CHARGING
   --  update BILLING_CHARGING set mdn = msisdn_b where mdn = msisdn_a;

   -- 3. DISCOUNT_BILLING
   UPDATE LSB_DISCOUNT_BILLING db
      SET db.msisdn = msisdn_b
    WHERE db.msisdn = msisdn_a;

   --  -- 4. MONTHLY_CHARGE
   --  update MONTHLY_CHARGE set mdn = msisdn_b where mdn = msisdn_a;

   -- 5. PROFILE_TOPIC
   UPDATE PROFILE_TOPIC
      SET msisdn = msisdn_b
    WHERE msisdn = msisdn_a;

   -- 6. SMS_MESSAGES_QUEUE
   UPDATE SMS_MESSAGES_QUEUE
      SET msisdn = msisdn_b
    WHERE msisdn = msisdn_a;

   -- Thanh cong het moi duoc commit
   COMMIT;

   RETURN 0;
EXCEPTION
   WHEN OTHERS
   THEN
      RETURN -1;
END change_msisdn;
/

CREATE OR REPLACE PUBLIC SYNONYM CHANGE_MSISDN FOR LIVESCREEN.CHANGE_MSISDN;
