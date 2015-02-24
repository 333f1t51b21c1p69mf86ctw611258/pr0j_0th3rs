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

COMMENT ON COLUMN LIVESCREEN.RTBS.RESULT IS 'CPS-0000=L?nh th?c hi?n th�nh c�ng; CPS-1001=Kh�ng d? ti?n trong t�i kho?n d? tr?; CPS-1002=Gi� tr? t�i kho?n kh�ng h?p l?; CPS-1003=Profile kh�ng h?p l?; CPS-1004=Tr?ng th�i thu� bao kh�ng h?p l?; CPS-1005=Tham s? kh�ng du?c d? tr?ng; CPS-1006=Th?c hi?n l?nh timeout tr�n h? th?ng IN; CPS-1007=Thu� bao kh�ng t?n t?i; CPS-1008=L?nh kh�ng t?n t?i; CPS-1009=Gi� tr? t�i kho?n kh�ng du?c ph�p; CPS-1010=Profile kh�ng du?c ph�p s? d?ng; CPS-1011=L?nh kh�ng du?c h? tr? tr�n IN; CPS-1012=T�i kho?n kh�ng t?n t?i; CPS-1013=C?u tr�c l?nh kh�ng d�ng; CPS-1014=Tham s? l?nh thi?u; CPS-2001=User kh�ng c� quy?n th?c hi?n l?nh; CPS-2002=User kh�ng c� quy?n th?c hi?n l?nh tr�n IN; CPS-2003=User kh�ng c� quy?n truy nh?p h? th?ng; CPS-2004=Th?c hi?n l?nh timeout tr�n h? th?ng Charging Proxy; CPS-2005=K?t n?i d?n h? th?ng IN kh�ng s?n s�ng; CPS-2006=User kh�ng t?n t?i; CPS-2007=M?t kh?u kh�ng d�ng; CPS-2008=M?t kh?u d� h?t h?n s? d?ng; CPS-2009=IP truy nh?p kh�ng h?p l?; CPS-2010=User kh�ng du?c ph�p truy nh?p t?i th?i di?m n�y; CPS-2011=M� phi�n giao d?ch kh�ng  h?p l?; CPS-2012=Kh�ng du?c ph�p truy nh?p v�o h? th?ng CPS; CPS-2013=Message time out; CPS-2014=H? th?ng CPS chua s?n s�ng; CPS-2015=S? lu?ng k?t n?i d� vu?t qu� s? k?t n?i cho ph�p; CPS-3000=L?i kh�ng x�c d?nh; CPS-3001=L?i t? h? th?ng IN; CPS-3002=L?i h? th?ng Charging Proxy';



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
