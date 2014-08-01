DROP PACKAGE LIVESCREEN.RPT;

CREATE OR REPLACE PACKAGE LIVESCREEN.RPT
IS
   /******************************************************************************
       NAME:       RPT
       PURPOSE:

       REVISIONS:
       Ver        Date        Author           Description
       ---------  ----------  ---------------  ------------------------------------
       1.0        5/29/2013   manucian86       1. Created this package.
    ******************************************************************************/

   CURRENT_LOG_LEVEL   CONSTANT PLS_INTEGER := 0;

   TYPE t_tbl_chart_result IS TABLE OF chart_result%ROWTYPE;

   TYPE t_in_list_tab IS TABLE OF VARCHAR2 (100);

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

   PROCEDURE INSERT_ACTION_LOG (log_user_name     IN VARCHAR2,
                                log_action        IN VARCHAR2,
                                log_description   IN VARCHAR2,
                                log_level         IN NUMBER);

   FUNCTION GET_PROGRAM_BY_FILTER_INFO (P_BEGIN         IN VARCHAR2,
                                        P_END           IN VARCHAR2,
                                        P_CPS           IN VARCHAR2,
                                        P_TOPICS        IN VARCHAR2,
                                        P_SUB_CONTENT   IN VARCHAR2)
      RETURN TYPES.REF_CURSOR;
END RPT;
/
