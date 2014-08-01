DROP PROCEDURE LIVESCREEN.HANDLE_NOT_CHARGE;

CREATE OR REPLACE PROCEDURE LIVESCREEN.handle_not_charge
   IS

TYPE t_tbl_msisdn IS TABLE OF MTPKG_CHARG_RECURRING.MSISDN%TYPE;

TYPE t_tbl_pkgd_id IS TABLE OF MTPKG_CHARG_RECURRING.PKGD_ID%TYPE;

tbl_msisdn                 t_tbl_msisdn;
tbl_pkgd_id                t_tbl_pkgd_id;
n_row_count                number;
date_temp                  date;

BEGIN
    -- Lay nhung thue bao sau 1h chua charge
    SELECT mb.MSISDN, MB.PKGD_ID
        BULK COLLECT INTO tbl_msisdn, tbl_pkgd_id
    FROM MTPKG_CHARG_RECURRING mb, MTPKG_SUBSCRIBER pr
    WHERE PR.MSISDN = MB.MSISDN
        AND mb.status = 2
        AND mb.charg_time + 1/24 < sysdate;

    n_row_count := SQL%ROWCOUNT;

    IF (n_row_count > 0) THEN
        date_temp := SYSDATE + 10/1440;

        -- Cap nhat bill sau 10 phut nua thi tong hop
        FORALL i IN tbl_msisdn.FIRST .. tbl_msisdn.LAST
           UPDATE MTPKG_BILL
              SET next_charg_time = date_temp
                , data_part = TO_NUMBER(TO_CHAR(date_temp,'DD'))
                , sub_data_part = TO_NUMBER(TO_CHAR(date_temp,'HH24'))
                , is_provisioned = 0
                , last_update = SYSDATE
                , INSERTED_EXTEND_MSG = 0
            WHERE MSISDN = tbl_msisdn(i)
                  AND PKGD_ID = tbl_pkgd_id(i);

        -- Xoa du lieu charge cuoc
        FORALL i IN tbl_msisdn.FIRST .. tbl_msisdn.LAST
            DELETE FROM MTPKG_CHARG_RECURRING
            WHERE MSISDN = tbl_msisdn(i)
                  AND PKGD_ID = tbl_pkgd_id(i);

        COMMIT;
     END IF;


END; -- Procedure
/
