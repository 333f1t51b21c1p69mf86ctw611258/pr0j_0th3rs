DROP PROCEDURE LIVESCREEN.WRITE_FILE_VASGATE;

CREATE OR REPLACE PROCEDURE LIVESCREEN.write_file_vasgate
   IS

v_service_id varchar2(20) := '2881';
v_msisdn varchar2(20);
v_req_id varchar2(15);
v_req_time varchar2(20);
v_status number := 1;
v_req_msg varchar2(50);
v_extend_time varchar2(20);
v_price number;
v_package_code varchar2(10);
v_channel varchar(10);
v_otherinfo varchar2(10);

l_file        UTL_FILE.file_type;
l_file_name   VARCHAR2 (60);

v_row varchar2(4000);
v_tab varchar2(100);
v_file_name varchar2(100);

TYPE cur_typ IS REF CURSOR;

 cursor cur is
    select SUBSTR(mtpkg_subscriber.MSISDN,3,length(mtpkg_subscriber.MSISDN)) || SEQ_VASGATE.NEXTVAL req_id
        , SUBSTR(mtpkg_subscriber.MSISDN,3,length(mtpkg_subscriber.MSISDN)) msisdn
        , mtpkg_subscriber.pkgd_id
        , to_char(mtpkg_subscriber.register_time,'dd/mm/yyyy hh24:mi:ss') REQ_TIME
        , DECODE(mtpkg_subscriber.STATUS,2,'SUBSCRIBER',3,'SYSTEM') REQ_MSG
        , DECODE(mtpkg_subscriber.STATUS,2,'SMS',3,'APP') CHANNEL
        , decode(mtpkg_package_detail.active_fee,'',' ',mtpkg_package_detail.active_fee) active_fee
        , decode(mtpkg_bill.EXPIRED_TIME,'',' ', to_char(mtpkg_bill.EXPIRED_TIME,'dd/mm/yyyy hh24:mi:ss')) EXPIRED_TIME
    from mtpkg_subscriber join mtpkg_package_detail on mtpkg_subscriber.pkgd_id = mtpkg_package_detail.pkgd_id
        left join mtpkg_bill on mtpkg_subscriber.msisdn = mtpkg_bill.msisdn and mtpkg_subscriber.pkgd_id = mtpkg_bill.pkgd_id
    where status in (2,3);

BEGIN
    v_row := '';
    v_tab := chr(9);
    v_file_name := 'tuan.txt';

    select 'tuan' || to_char(sysdate,'WW_yyyymmdd_hh24miss') || '.txt' into l_file_name from dual;

    l_file := UTL_FILE.fopen ('VASGATE_DIR', v_file_name, 'w');

    --UTL_FILE.putf (l_file, l_file_name);

    v_row := '[SERVICE_ID]' || v_tab || '[MSISDN]' || v_tab || '[REQ_ID]' || v_tab || '[REQ_TIME]'
            || v_tab || '[STATUS]' || v_tab || '[REQ_MSG]' || v_tab || '[EXTEND_TIME]' || v_tab
            || '[PRICE]' || v_tab || '[PACKAGE_CODE]' || v_tab || '[CHANNEL]';
    utl_file.put_line(l_file,v_row);

    open cur;
    loop
        fetch cur into v_req_id, v_msisdn, v_package_code, v_req_time, v_req_msg, v_channel, v_price, v_extend_time;
        EXIT WHEN cur%NOTFOUND;

        v_row := v_service_id || v_tab || v_msisdn || v_tab || v_req_id || v_tab || v_req_time
            || v_tab || v_status || v_tab || v_req_msg || v_tab || v_extend_time || v_tab
            || v_price || v_tab || v_package_code || v_tab || v_channel;

        utl_file.put_line(l_file,v_row);
    end loop;
    close cur;

    UTL_FILE.fclose (l_file);

    UTL_FILE.FRENAME('VASGATE_DIR', v_file_name, 'VASGATE_DIR', l_file_name, TRUE);

    EXCEPTION
        WHEN UTL_FILE.INVALID_PATH THEN
        RAISE_APPLICATION_ERROR(-20100,'Invalid Path vasgate');
        WHEN UTL_FILE.WRITE_ERROR then
        RAISE_APPLICATION_ERROR(-20104,'Write file vasgate Error');
END; -- Procedure
/
