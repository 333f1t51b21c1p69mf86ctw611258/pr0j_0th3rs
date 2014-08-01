DROP VIEW LIVESCREEN.VCDR_CP_COT;

/* Formatted on 01/08/2014 11:56:48 (QP5 v5.227.12220.39754) */
CREATE OR REPLACE FORCE VIEW LIVESCREEN.VCDR_CP_COT
(
   NGAY,
   SL,
   DOANHSO
)
AS
     SELECT TRUNC (TO_DATE (t.ngay, 'DD/MM/YYYY')) Ngay,
            SUM (T.sl) SL,
            SUM (T.doanhso) Doanhso
       FROM (  SELECT TRUNC (VAS_CDR.TIME) Ngay,
                      VAS_CDR.SHORT_CODE,
                      COUNT (VAS_CDR.VAS_CDR_ID) sl,
                      MAX (cp_shortcode.price) gia,
                      COUNT (VAS_CDR.VAS_CDR_ID) * MAX (cp_shortcode.price)
                         Doanhso
                 FROM VAS_CDR, CP_SHORTCODE
                WHERE (    (VAS_CDR.SHORT_CODE IN (SELECT SHORT_CODE
                                                     FROM CP_SHORTCODE A
                                                    WHERE CP_ID = '3412'))
                       AND (VAS_CDR.TIME BETWEEN TO_DATE ('2013/06/01',
                                                          'YYYY/MM/DD')
                                             AND TO_DATE ('2013/07/31',
                                                          'YYYY/MM/DD'))
                       AND (VAS_CDR.SHORT_CODE = CP_SHORTCODE.SHORT_CODE))
             GROUP BY TRUNC (VAS_CDR.TIME), VAS_CDR.SHORT_CODE
             ORDER BY TRUNC (VAS_CDR.TIME)) T
   GROUP BY TRUNC (TO_DATE (t.ngay, 'DD/MM/YYYY'))
   ORDER BY TRUNC (TO_DATE (t.ngay, 'DD/MM/YYYY'));


CREATE OR REPLACE PUBLIC SYNONYM VCDR_CP_COT FOR LIVESCREEN.VCDR_CP_COT;
