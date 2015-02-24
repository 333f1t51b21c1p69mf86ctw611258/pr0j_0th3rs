DROP PACKAGE LIVESCREEN.CBCZONE;

CREATE OR REPLACE PACKAGE LIVESCREEN.CBCZONE
AS
   /******************************************************************************
       NAME:       CBCZONE
       PURPOSE:

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        5/29/2013   manucian86       1. Created this package.
    ******************************************************************************/

   TYPE t_tbl_chart_result IS TABLE OF chart_result%ROWTYPE;

   TYPE t_in_list_tab IS TABLE OF VARCHAR2 (100);

   FUNCTION DI_ZONE_CELL_BY_ZONE_BSC (in_ZONE_ID NUMBER, in_BSC_ID VARCHAR2)
      RETURN NUMBER;

   FUNCTION GET_BSC_BY_ZONE_ID (in_ZONE_ID     NUMBER,
                                in_BSC_NAME    VARCHAR2,
                                in_STATUS      VARCHAR2,
                                in_VENDOR      VARCHAR2,
                                in_CENTER      VARCHAR2,
                                in_PROVINCE    VARCHAR2)
      RETURN TYPES.REF_CURSOR;

   FUNCTION GET_CELL_BY_BSC_ID (in_ZONE_ID      NUMBER,
                                in_BSC_ID       VARCHAR2,
                                in_CELL_ID      VARCHAR2,
                                in_LAC          VARCHAR2,
                                in_CELL_NAME    VARCHAR2,
                                in_STATUS       VARCHAR2)
      RETURN TYPES.REF_CURSOR;

   FUNCTION MERGE_ZONE (
      in_ZONE_ID        IN LIVESCREEN.ZONE.ZONE_ID%TYPE,
      in_ZONE_NAME      IN LIVESCREEN.ZONE.ZONE_NAME%TYPE,
      in_DESCRIPTION    IN LIVESCREEN.ZONE.DESCRIPTION%TYPE,
      in_CREATED_DATE   IN LIVESCREEN.ZONE.CREATED_DATE%TYPE,
      in_UPDATED_DATE   IN LIVESCREEN.ZONE.UPDATED_DATE%TYPE,
      in_USER_ID        IN LIVESCREEN.ZONE.USER_ID%TYPE,
      in_STATUS         IN LIVESCREEN.ZONE.STATUS%TYPE,
      in_PARENT_ID      IN LIVESCREEN.ZONE.PARENT_ID%TYPE,
      in_SHAPE          IN LIVESCREEN.ZONE.SHAPE%TYPE,
      in_COLOR          IN LIVESCREEN.ZONE.COLOR%TYPE,
      in_ZONE_TYPE      IN LIVESCREEN.ZONE.ZONE_TYPE%TYPE)
      RETURN NUMBER;

   FUNCTION GET_ALL_ZONE
      RETURN TYPES.REF_CURSOR;

   --------------------------------------------------------------------------------------

   FUNCTION GET_CP_PIE_CHART_RESULT (P_BEGIN   IN VARCHAR2,
                                     P_END     IN VARCHAR2,
                                     P_CPS     IN VARCHAR2)
      RETURN TYPES.REF_CURSOR;

   FUNCTION GET_SHORTCODE_PIE_CHART_RESULT (P_BEGIN        IN VARCHAR2,
                                            P_END          IN VARCHAR2,
                                            P_SHORTCODES   IN VARCHAR2)
      RETURN TYPES.REF_CURSOR;

   FUNCTION GET_BSC_PIE_CHART_RESULT (P_BEGIN     IN VARCHAR2,
                                      P_END       IN VARCHAR2,
                                      P_ZONE_ID   IN NUMBER,
                                      P_CPS       IN VARCHAR2,
                                      P_TOPICS    IN VARCHAR2)
      RETURN TYPES.REF_CURSOR;

   FUNCTION GET_TOPIC_PIE_CHART_RESULT (P_BEGIN     IN VARCHAR2,
                                        P_END       IN VARCHAR2,
                                        P_ZONE_ID   IN NUMBER,
                                        P_CPS       IN VARCHAR2,
                                        P_TOPICS    IN VARCHAR2)
      RETURN TYPES.REF_CURSOR;

   FUNCTION GET_PROGRAM_PIE_CHART_RESULT (P_BEGIN      IN VARCHAR2,
                                          P_END        IN VARCHAR2,
                                          P_ZONE_ID    IN NUMBER,
                                          P_PROGRAMS   IN VARCHAR2)
      RETURN TYPES.REF_CURSOR;
END CBCZONE;
/
