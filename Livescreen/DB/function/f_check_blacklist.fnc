DROP FUNCTION LIVESCREEN.F_CHECK_BLACKLIST;

CREATE OR REPLACE FUNCTION LIVESCREEN.F_CHECK_BLACKLIST(p_msisdn in varchar2) RETURN NUMBER AS

  v_count number;
  v_imei varchar2(50);
BEGIN
  -- Check so thue bao trong he thong
  select count(*) into v_count from profile where msisdn = p_msisdn;
  if(v_count = 0) then 
    return v_count;
  end if;

  -- Lay IMEI cua thue bao
  select decode(imei,'',' ',imei) into v_imei from profile where msisdn = p_msisdn;
  
  -- Check xem co thuoc blacklist msisdn hay khong
  select count(*) into v_count from msisdn_filter where msisdn = p_msisdn and status = 1;
  
  if(v_count > 0) then
    return 1;
  else 
    begin
      select count(*) into v_count from imei_filter where imei = v_imei and status = 1;
      if(v_count > 0) then
        return 1;
      else
        begin
          select count(*) into v_count from msisdn_advanced_filter where p_msisdn like msisdn || '%' and status = 1; 
          if(v_count > 0) then
            return 1;
          else
            begin
              select count(*) into v_count from imei_advanced_filter where v_imei like imei || '%' and status = 1;    
              if(v_count > 0) then
                return 1;
              else
                return 0;
              end if;
            end;
          end if;
        end;
      end if;
    end;
  end if;
END F_CHECK_BLACKLIST;
/

CREATE OR REPLACE PUBLIC SYNONYM F_CHECK_BLACKLIST FOR LIVESCREEN.F_CHECK_BLACKLIST;
