DROP PACKAGE LIVESCREEN.MT_PACKAGE;

CREATE OR REPLACE PACKAGE LIVESCREEN.MT_PACKAGE
AS
   /******************************************************************************
       NAME:       MT_PACKAGE
       PURPOSE:

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        07/26/2013  manucian86       1. Created this package.
    ******************************************************************************/

   ROW_LIMIT                        CONSTANT PLS_INTEGER := 3000;

   -- So ngay charge khong thanh cong max
   -- truoc khi bi Huy dich vu
   MAX_DELAY_DAY                    CONSTANT PLS_INTEGER := 3;

   SUBSCRIBER_STATUS_SUSPEND        CONSTANT PLS_INTEGER := 0;
   SUBSCRIBER_STATUS_FORCE_ACTIVE   CONSTANT PLS_INTEGER := 3;

   USAGE_DAY_DAILY                  CONSTANT PLS_INTEGER := 1;
   USAGE_DAY_WEEKLY                 CONSTANT PLS_INTEGER := 7;
   USAGE_DAY_MONTHLY                CONSTANT PLS_INTEGER := 30;

   PKGD_TYPE_DAILY                  CONSTANT VARCHAR2 (10) := 'DAILY';
   PKGD_TYPE_WEEKLY                 CONSTANT VARCHAR2 (10) := 'WEEKLY';
   PKGD_TYPE_MONTHLY                CONSTANT VARCHAR2 (10) := 'MONTHLY';

   RESP_TYPE_SMS                    CONSTANT VARCHAR2 (7) := 'SMS';
   RESP_TYPE_MEDIA                  CONSTANT VARCHAR2 (7) := 'MEDIA';

   CHARG_TYPE_ACTIVE                CONSTANT PLS_INTEGER := 1;
   CHARG_TYPE_RECURRENT             CONSTANT PLS_INTEGER := 2;

   PROVISIONING_TOLERANCE           CONSTANT PLS_INTEGER := 2;
   PROVISIONING_TOLERANCE_PLUS      CONSTANT PLS_INTEGER
                                                := PROVISIONING_TOLERANCE + 6 ;

   --   BILL_DATA_PART_VALUE_TEMP        CONSTANT PLS_INTEGER := 86;
   --   BILL_SUB_DATA_PART_VALUE_TEMP    CONSTANT PLS_INTEGER := 86;

   RESP_PROV_TOL                    CONSTANT PLS_INTEGER := 25;

   CURRENT_LOG_LEVEL                CONSTANT PLS_INTEGER := 0;

   TYPE t_tbl_MTPKG_FEE IS TABLE OF MTPKG_FEE%ROWTYPE
      INDEX BY BINARY_INTEGER;

   TYPE t_tbl_MTPKG_DISCOUNT IS TABLE OF MTPKG_DISCOUNT%ROWTYPE
      INDEX BY BINARY_INTEGER;

   PROCEDURE LOAD_FEE_DISCOUNT_TEMP_TABLE (in_RELOAD NUMBER);

   FUNCTION GET_USAGE_DAY_BY_PKG_TYPE (in_PKGD_TYPE IN VARCHAR2)
      RETURN NUMBER;

   FUNCTION GET_CHARG_FEE (pMSISDN      IN VARCHAR2,
                           pPkgdID      IN VARCHAR2,
                           pChargType   IN NUMBER)
      RETURN NUMBER;

   FUNCTION GET_RECURRING_CHARG_FEE (
      pMSISDN          IN VARCHAR2,
      pPkgdID          IN VARCHAR2,
      pChargType       IN NUMBER,
      pFeeTable        IN t_tbl_MTPKG_FEE,
      pDiscountTable   IN t_tbl_MTPKG_DISCOUNT)
      RETURN NUMBER;

   FUNCTION GET_MTPKG_CONFIG (in_CONFIG_TYPE     IN VARCHAR2,
                              in_CONFIG_NAME     IN VARCHAR2,
                              in_DEFAULT_VALUE   IN VARCHAR2 DEFAULT NULL)
      RETURN VARCHAR2;

   PROCEDURE INSERT_ACTION_LOG (log_user_name     IN VARCHAR2,
                                log_action        IN VARCHAR2,
                                log_description   IN VARCHAR2,
                                log_level         IN NUMBER);

   FUNCTION HAS_BILL (in_MSISDN   IN MTPKG_BILL.MSISDN%TYPE,
                      in_PkgdID   IN MTPKG_BILL.PKGD_ID%TYPE)
      RETURN NUMBER;

   FUNCTION CU_BILL (in_MSISDN      IN MTPKG_BILL.MSISDN%TYPE,
                     in_PkgdID      IN MTPKG_BILL.PKGD_ID%TYPE,
                     in_IS_ACTIVE   IN NUMBER,
                     in_IS_SUCC     IN NUMBER)
      RETURN NUMBER;

   PROCEDURE INSERT_MTPKG_BILL (
      in_MSISDN            IN MTPKG_BILL.MSISDN%TYPE,
      in_PKGD_ID           IN MTPKG_BILL.PKGD_ID%TYPE,
      in_NEXT_CHARG_TIME   IN MTPKG_BILL.NEXT_CHARG_TIME%TYPE,
      in_DATA_PART         IN MTPKG_BILL.DATA_PART%TYPE,
      in_CHARG_FEE         IN MTPKG_BILL.CHARG_FEE%TYPE);

   PROCEDURE CLEAR_COMMAND_REQ_TABLE;

   PROCEDURE CLEAR_RECOVER_REQ_TABLE;

   -- Phai tao job chay dinh ky
   PROCEDURE CREATE_PARTITION_CHARG_HIS;

   -- Chi chay mot lan, khong can chay job
   PROCEDURE CREATE_PARTITION_BILL;

   PROCEDURE DAILY_WORK;

   PROCEDURE RECURRENT_PROVISIONING;

   PROCEDURE RECOVER_PROCESS;

   PROCEDURE HANDLE_CHARGING_RESULT;

   PROCEDURE PREPARE_EXTEND_MESSAGE;

   PROCEDURE RESPONSE_PROVISIONING;

   FUNCTION GET_RECURRENT_CHARG (in_ROWNUM NUMBER, in_HIGHT_PRIORITY NUMBER)
      RETURN TYPES.REF_CURSOR;
  
  FUNCTION GET_RECURRENT_CHARG_WITH_PART (in_ROWNUM            NUMBER,
                                           in_HIGHT_PRIORITY    NUMBER,
                                           in_DATA_PART         NUMBER)
      RETURN TYPES.REF_CURSOR;
END MT_PACKAGE;
/
