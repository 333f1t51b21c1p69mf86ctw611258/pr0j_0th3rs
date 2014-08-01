DROP VIEW LIVESCREEN.VAS_TRAN_CP;

/* Formatted on 01/08/2014 11:56:47 (QP5 v5.227.12220.39754) */
CREATE OR REPLACE FORCE VIEW LIVESCREEN.VAS_TRAN_CP
(
   SHORT_CODE,
   SL,
   GIA,
   DOANHSO
)
AS
     SELECT VAS_TRANSACTION.SHORT_CODE,
            COUNT (VAS_TRANSACTION.VAS_TRANS_ID) sl,
            MAX (cp_shortcode.price) gia,
            COUNT (VAS_TRANSACTION.VAS_TRANS_ID) * MAX (cp_shortcode.price)
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
   GROUP BY VAS_TRANSACTION.SHORT_CODE;


CREATE OR REPLACE PUBLIC SYNONYM VAS_TRAN_CP FOR LIVESCREEN.VAS_TRAN_CP;
