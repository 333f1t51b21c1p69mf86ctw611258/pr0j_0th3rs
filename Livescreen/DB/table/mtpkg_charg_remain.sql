ALTER TABLE LIVESCREEN.MTPKG_CHARG_REMAIN
 DROP PRIMARY KEY CASCADE;

DROP TABLE LIVESCREEN.MTPKG_CHARG_REMAIN CASCADE CONSTRAINTS;

CREATE TABLE LIVESCREEN.MTPKG_CHARG_REMAIN
(
  MSISDN            VARCHAR2(15 BYTE)           NOT NULL,
  PKGD_ID           VARCHAR2(127 BYTE)          NOT NULL,
  STATUS            NUMBER(3),
  RETRY             NUMBER(3)                   DEFAULT 0,
  DATA_PART         NUMBER(2)                   NOT NULL,
  CHARG_TIME        DATE,
  CHARG_FEE         NUMBER(10,3),
  LAST_UPDATE       DATE,
  ERROR_DETAIL      VARCHAR2(127 BYTE),
  PRIORITY          NUMBER(1),
  LAST_UPDATE_BY    VARCHAR2(63 BYTE),
  CP_CODE           VARCHAR2(100 BYTE),
  GROUP_CODE        VARCHAR2(255 BYTE),
  NEXT_CHARG_TIME   DATE,
  INSERT_TIME       DATE                        DEFAULT sysdate,
  PKGD_TYPE         VARCHAR2(64 BYTE),
  MAX_REMAIN_RETRY  NUMBER
)
NOCOMPRESS 
TABLESPACE MTPKG_CHARG_RECURRING
RESULT_CACHE (MODE DEFAULT)
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
PARTITION BY RANGE (DATA_PART)
(  
  PARTITION P0 VALUES LESS THAN (1)
    LOGGING
    NOCOMPRESS 
    TABLESPACE MTPKG_CHARG_RECURRING
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION P1 VALUES LESS THAN (2)
    LOGGING
    NOCOMPRESS 
    TABLESPACE MTPKG_CHARG_RECURRING
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION P2 VALUES LESS THAN (3)
    LOGGING
    NOCOMPRESS 
    TABLESPACE MTPKG_CHARG_RECURRING
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION P3 VALUES LESS THAN (4)
    LOGGING
    NOCOMPRESS 
    TABLESPACE MTPKG_CHARG_RECURRING
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION P4 VALUES LESS THAN (5)
    LOGGING
    NOCOMPRESS 
    TABLESPACE MTPKG_CHARG_RECURRING
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION P5 VALUES LESS THAN (6)
    LOGGING
    NOCOMPRESS 
    TABLESPACE MTPKG_CHARG_RECURRING
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION P6 VALUES LESS THAN (7)
    LOGGING
    NOCOMPRESS 
    TABLESPACE MTPKG_CHARG_RECURRING
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION P7 VALUES LESS THAN (8)
    LOGGING
    NOCOMPRESS 
    TABLESPACE MTPKG_CHARG_RECURRING
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION P8 VALUES LESS THAN (9)
    LOGGING
    NOCOMPRESS 
    TABLESPACE MTPKG_CHARG_RECURRING
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION P9 VALUES LESS THAN (10)
    LOGGING
    NOCOMPRESS 
    TABLESPACE MTPKG_CHARG_RECURRING
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               )
)
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON COLUMN LIVESCREEN.MTPKG_CHARG_REMAIN.STATUS IS '? 2:	C?n tr? cu?c
? 3:	Billing l?y ra di tr? cu?c
? 4:	Charging Gateway tr? v? tr? cu?c thành công
? 5:	Charging Gateway tr? v? tr? cu?c KO thành công
? 6:	Charging Gateway b? timeout ';

COMMENT ON COLUMN LIVESCREEN.MTPKG_CHARG_REMAIN.RETRY IS 'So lan retry. Khi insert = 0';

COMMENT ON COLUMN LIVESCREEN.MTPKG_CHARG_REMAIN.DATA_PART IS 'Chu so cuoi cung cua thue bao.';

COMMENT ON COLUMN LIVESCREEN.MTPKG_CHARG_REMAIN.CHARG_TIME IS 'Thoi diem can phai mang di charg(khi insert la sysdate+1, khi charg xong update thanh CHARG_TIME+1)';

COMMENT ON COLUMN LIVESCREEN.MTPKG_CHARG_REMAIN.CHARG_FEE IS 'So tien can phai charg(fix luc insert).';

COMMENT ON COLUMN LIVESCREEN.MTPKG_CHARG_REMAIN.ERROR_DETAIL IS 'Mo ta loi charg.';

COMMENT ON COLUMN LIVESCREEN.MTPKG_CHARG_REMAIN.PRIORITY IS 'Do uu tien';

COMMENT ON COLUMN LIVESCREEN.MTPKG_CHARG_REMAIN.CP_CODE IS 'VMS goi la CP ID dung de doi soat cuoc va lam key ma hoa goi tin media';

COMMENT ON COLUMN LIVESCREEN.MTPKG_CHARG_REMAIN.GROUP_CODE IS 'Pho thong: 001xxxxxxx; Nang cao: 002xxxxxxx; Java Game: 003xxxxxxx';

COMMENT ON COLUMN LIVESCREEN.MTPKG_CHARG_REMAIN.NEXT_CHARG_TIME IS 'Thoi diem tiep theo can charg(khi insert la sysdate+1, khi charg xong update thanh CHARG_TIME+1)';

COMMENT ON COLUMN LIVESCREEN.MTPKG_CHARG_REMAIN.INSERT_TIME IS 'Thoi diem insert ban ghi';

COMMENT ON COLUMN LIVESCREEN.MTPKG_CHARG_REMAIN.PKGD_TYPE IS 'DAILY, WEEKLY, MONTHLY';

COMMENT ON COLUMN LIVESCREEN.MTPKG_CHARG_REMAIN.MAX_REMAIN_RETRY IS 'S? l?n retry còn l?i t?i da';



CREATE UNIQUE INDEX LIVESCREEN.MTPKG_CHARG_REMAIN_PK ON LIVESCREEN.MTPKG_CHARG_REMAIN
(MSISDN, PKGD_ID)
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


ALTER TABLE LIVESCREEN.MTPKG_CHARG_REMAIN ADD (
  CONSTRAINT MTPKG_CHARG_REMAIN_PK
  PRIMARY KEY
  (MSISDN, PKGD_ID)
  USING INDEX LIVESCREEN.MTPKG_CHARG_REMAIN_PK
  ENABLE VALIDATE);
