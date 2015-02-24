DROP PROCEDURE LIVESCREEN.ADDHISTORY_CHARGING;

CREATE OR REPLACE PROCEDURE LIVESCREEN."ADDHISTORY_CHARGING" (
   mdn            IN VARCHAR2,
   amount         IN NUMBER,
   chargeResult   IN NUMBER,
   ChargeType     IN VARCHAR2,
   subtype        IN NUMBER,
   pkgd_id        IN VARCHAR2,
   ChargeDesc     IN VARCHAR2,
   resultIn       IN NUMBER)
IS
---------------------------------------------------------------------------------------------------------
-- For module billing_charging
-- Neu module billing_charging tru tien (kich hoat dv, monthly) se insert vao bang CHARGE_HIST
-- de tra cuu lich su tru phi
---------------------------------------------------------------------------------------------------------

BEGIN
   INSERT INTO CHARGE_HIST (ID,
                            MDN,
                            CHARGETIME,
                            AMOUNT,
                            CHARGERESULT,
                            CHARGETYPE,
                            SUBTYPE,
                            pkgd_id,
                            CHARGEDESC,
                            RESULT_IN)
        VALUES (SEQUENCE_INDEX.NEXTVAL,
                mdn,
                SYSDATE,
                amount,
                chargeResult,
                ChargeType,
                subtype,
                pkgd_id,
                ChargeDesc,
                resultIn);

   COMMIT;
END AddHistory_Charging;
/

CREATE OR REPLACE PUBLIC SYNONYM ADDHISTORY_CHARGING FOR LIVESCREEN.ADDHISTORY_CHARGING;
