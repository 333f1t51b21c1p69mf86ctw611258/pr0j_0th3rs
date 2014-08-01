DROP VIEW LIVESCREEN.VAS_CDR_CP;

/* Formatted on 01/08/2014 11:56:47 (QP5 v5.227.12220.39754) */
CREATE OR REPLACE FORCE VIEW LIVESCREEN.VAS_CDR_CP
(
   SHORT_CODE,
   SL,
   GIA,
   DOANHSO
)
AS
     SELECT CP_SHORTCODE.SHORT_CODE,
            COUNT (vas_cdr.vas_cdr_ID) sl,
            MAX (cp_shortcode.price) gia,
            COUNT (vas_cdr.vas_cdr_ID) * MAX (cp_shortcode.price) Doanhso
       FROM vas_cdr, CP_SHORTCODE
      WHERE (    (vas_cdr.SHORT_CODE IN (SELECT SHORT_CODE
                                           FROM CP_SHORTCODE A
                                          WHERE CP_ID = '3412'))
             AND (vas_cdr.TIME BETWEEN TO_DATE ('2013/06/01', 'YYYY/MM/DD')
                                   AND TO_DATE ('2013/07/31', 'YYYY/MM/DD'))
             AND (vas_cdr.SHORT_CODE = CP_SHORTCODE.SHORT_CODE))
   GROUP BY CP_SHORTCODE.SHORT_CODE;


CREATE OR REPLACE PUBLIC SYNONYM VAS_CDR_CP FOR LIVESCREEN.VAS_CDR_CP;
