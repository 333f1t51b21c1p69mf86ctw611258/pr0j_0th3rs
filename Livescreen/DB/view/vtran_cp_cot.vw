DROP VIEW LIVESCREEN.VTRAN_CP_COT;

/* Formatted on 01/08/2014 11:56:48 (QP5 v5.227.12220.39754) */
CREATE OR REPLACE FORCE VIEW LIVESCREEN.VTRAN_CP_COT
(
   NGAY,
   SL,
   DOANHSO
)
AS
     SELECT TRUNC (TO_DATE (t.ngay, 'DD/MM/YYYY')) Ngay,
            SUM (T.sl) SL,
            SUM (T.doanhso) Doanhso
       FROM (  SELECT TRUNC (VAS_TRANSACTION.TIME) Ngay,
                      VAS_TRANSACTION.SHORT_CODE,
                      COUNT (VAS_TRANSACTION.VAS_TRANS_ID) sl,
                      MAX (cp_shortcode.price) gia,
                        COUNT (VAS_TRANSACTION.VAS_TRANS_ID)
                      * MAX (cp_shortcode.price)
                         Doanhso
                 FROM VAS_TRANSACTION, CP_SHORTCODE
                WHERE (    (VAS_TRANSACTION.SHORT_CODE IN (SELECT SHORT_CODE
                                                             FROM CP_SHORTCODE A
                                                            WHERE CP_ID = '3412'))
                       AND (VAS_TRANSACTION.TIME BETWEEN TO_DATE ('2013/06/01',
                                                                  'YYYY/MM/DD')
                                                     AND TO_DATE ('2013/07/31',
                                                                  'YYYY/MM/DD'))
                       AND (VAS_TRANSACTION.SHORT_CODE = CP_SHORTCODE.SHORT_CODE))
             GROUP BY TRUNC (VAS_TRANSACTION.TIME), VAS_TRANSACTION.SHORT_CODE
             ORDER BY TRUNC (VAS_TRANSACTION.TIME)) T
   GROUP BY TRUNC (TO_DATE (t.ngay, 'DD/MM/YYYY'))
   ORDER BY TRUNC (TO_DATE (t.ngay, 'DD/MM/YYYY'));


CREATE OR REPLACE PUBLIC SYNONYM VTRAN_CP_COT FOR LIVESCREEN.VTRAN_CP_COT;
