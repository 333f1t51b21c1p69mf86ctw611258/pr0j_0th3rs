ALTER TABLE LIVESCREEN.RTBS
 DROP PRIMARY KEY CASCADE;

DROP TABLE LIVESCREEN.RTBS CASCADE CONSTRAINTS;

CREATE TABLE LIVESCREEN.RTBS
(
  MSISDN   VARCHAR2(20 BYTE),
  BALANCE  NUMBER(20),
  RESULT   VARCHAR2(30 BYTE),
  UCS2     VARCHAR2(20 CHAR)
)
TABLESPACE USERS
RESULT_CACHE (MODE DEFAULT)
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON COLUMN LIVESCREEN.RTBS.RESULT IS 'CPS-0000=L?nh th?c hi?n thành công; CPS-1001=Không d? ti?n trong tài kho?n d? tr?; CPS-1002=Giá tr? tài kho?n không h?p l?; CPS-1003=Profile không h?p l?; CPS-1004=Tr?ng thái thuê bao không h?p l?; CPS-1005=Tham s? không du?c d? tr?ng; CPS-1006=Th?c hi?n l?nh timeout trên h? th?ng IN; CPS-1007=Thuê bao không t?n t?i; CPS-1008=L?nh không t?n t?i; CPS-1009=Giá tr? tài kho?n không du?c phép; CPS-1010=Profile không du?c phép s? d?ng; CPS-1011=L?nh không du?c h? tr? trên IN; CPS-1012=Tài kho?n không t?n t?i; CPS-1013=C?u trúc l?nh không dúng; CPS-1014=Tham s? l?nh thi?u; CPS-2001=User không có quy?n th?c hi?n l?nh; CPS-2002=User không có quy?n th?c hi?n l?nh trên IN; CPS-2003=User không có quy?n truy nh?p h? th?ng; CPS-2004=Th?c hi?n l?nh timeout trên h? th?ng Charging Proxy; CPS-2005=K?t n?i d?n h? th?ng IN không s?n sàng; CPS-2006=User không t?n t?i; CPS-2007=M?t kh?u không dúng; CPS-2008=M?t kh?u dã h?t h?n s? d?ng; CPS-2009=IP truy nh?p không h?p l?; CPS-2010=User không du?c phép truy nh?p t?i th?i di?m này; CPS-2011=Mã phiên giao d?ch không  h?p l?; CPS-2012=Không du?c phép truy nh?p vào h? th?ng CPS; CPS-2013=Message time out; CPS-2014=H? th?ng CPS chua s?n sàng; CPS-2015=S? lu?ng k?t n?i dã vu?t quá s? k?t n?i cho phép; CPS-3000=L?i không xác d?nh; CPS-3001=L?i t? h? th?ng IN; CPS-3002=L?i h? th?ng Charging Proxy';



CREATE UNIQUE INDEX LIVESCREEN.IDX_RTBS_PK ON LIVESCREEN.RTBS
(MSISDN)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;


CREATE OR REPLACE PUBLIC SYNONYM RTBS FOR LIVESCREEN.RTBS;


ALTER TABLE LIVESCREEN.RTBS ADD (
  CONSTRAINT IDX_RTBS_PK
  PRIMARY KEY
  (MSISDN)
  USING INDEX LIVESCREEN.IDX_RTBS_PK
  ENABLE VALIDATE);
