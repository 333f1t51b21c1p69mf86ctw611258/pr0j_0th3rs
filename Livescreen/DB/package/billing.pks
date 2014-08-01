DROP PACKAGE LIVESCREEN.BILLING;

CREATE OR REPLACE PACKAGE LIVESCREEN.BILLING
AS
   /******************************************************************************
      NAME:       BILLING
      PURPOSE:

      REVISIONS:
      Ver        Date        Author           Description
      ---------  ----------  ---------------  ------------------------------------
      1.0        2/18/2013      manucian86       1. Created this package.
   ******************************************************************************/

   TYPE t_tbl_service_fee_billing IS TABLE OF lsb_service_fee_billing%ROWTYPE
      INDEX BY BINARY_INTEGER;

   TYPE t_tbl_discount_billing IS TABLE OF lsb_discount_billing%ROWTYPE
      INDEX BY BINARY_INTEGER;

   FUNCTION GET_CHARGE_FEE (pMSISDN        IN VARCHAR2,
                            pServiceType   IN NUMBER,
                            pCOS           IN VARCHAR2)
      RETURN NUMBER;

   FUNCTION GET_MONTHLY_BILLING_CHARGE_FEE (
      pMSISDN              IN VARCHAR2,
      pCOS                 IN VARCHAR2,
      pServiceFeeBilling   IN t_tbl_service_fee_billing,
      pDiscountBilling     IN t_tbl_discount_billing)
      RETURN NUMBER;

   PROCEDURE CHARGE_FEE_PROVISIONING;

   FUNCTION GET_SYS_PTR (wPtr_type   IN VARCHAR2,
                         wPtr_name   IN VARCHAR2,
                         DefValue    IN VARCHAR2 DEFAULT NULL)
      RETURN VARCHAR2;

   PROCEDURE DAILY_PROVISIONING;

   PROCEDURE HANDLE_CHARGING_RESULT;

   PROCEDURE RECHARG_PROCESS;

   PROCEDURE CREATE_TABLE_PARTITION;

   PROCEDURE INSERT_EVENTS (log_username   IN VARCHAR2,
                            log_action     IN VARCHAR2,
                            log_describe   IN VARCHAR2,
                            log_level      IN NUMBER);

   FUNCTION ISNEEDBILLING (p_msisdn VARCHAR2)
      RETURN INTEGER;

   PROCEDURE INS_LSB_BILL (
      in_MSISDN            IN LSB_BILL.MSISDN%TYPE,
      in_LAST_DATE_CHARG   IN LSB_BILL.LAST_DATE_CHARG%TYPE,
      in_DATA_PART         IN LSB_BILL.DATA_PART%TYPE,
      in_CHARG_FEE         IN LSB_BILL.CHARG_FEE%TYPE);
      
   PROCEDURE CLEAR_MONTH_COMMAND_REQ_TABLE;
   
   PROCEDURE CLEAR_CHARGE_REQUEST_TABLE;
END BILLING;
/
