ALTER TABLE LIVESCREEN.MTPKG_CHARG_RECURRING
 DROP PRIMARY KEY CASCADE;

DROP TABLE LIVESCREEN.MTPKG_CHARG_RECURRING CASCADE CONSTRAINTS;

CREATE TABLE LIVESCREEN.MTPKG_CHARG_RECURRING
(
  MSISDN          VARCHAR2(15 BYTE),
  PKGD_ID         VARCHAR2(127 BYTE),
  STATUS          NUMBER(3),
  RETRY           NUMBER(3),
  DATA_PART       NUMBER(2)                     NOT NULL,
  CHARG_TIME      DATE,
  CHARG_FEE       NUMBER(10,3),
  LAST_UPDATE     DATE,
  ERROR_DETAIL    VARCHAR2(127 BYTE),
  PRIORITY        NUMBER(1),
  LAST_UPDATE_BY  VARCHAR2(63 BYTE)
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

COMMENT ON COLUMN LIVESCREEN.MTPKG_CHARG_RECURRING.STATUS IS '? 2:	C?n tr? cu?c (K?t qu? c?a Job: CHARGE_FEE_PROVISIONING)
? 20:	C?n mang di tính phí tháng (K?t qu? c?a Job: DAILY_PROVISIONING)
? 3:	Billing l?y ra di tr? cu?c
? 4:	Charging Gateway tr? v? tr? cu?c thành công
? 40:	Ðã mang 4 di x? lý (Thông báo, update PROFILE.STATUS, ...)
? 5:	Charging Gateway tr? v? tr? cu?c KO thành công
? 50:	Ðã mang 5 di x? lý (Thông báo, update PROFILE.STATUS, ...)
? 405:	Ð?i ch?
? 501:	H?y SIM';

COMMENT ON COLUMN LIVESCREEN.MTPKG_CHARG_RECURRING.CHARG_FEE IS 'PhaVD: Module java s? update giá tr? này sau khi tr? cu?c';

COMMENT ON COLUMN LIVESCREEN.MTPKG_CHARG_RECURRING.PRIORITY IS 'Do uu tien khi thuc hien RecurrentCharge';



CREATE UNIQUE INDEX LIVESCREEN.MTPKG_CHARG_RECURRING_PK ON LIVESCREEN.MTPKG_CHARG_RECURRING
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


CREATE OR REPLACE PUBLIC SYNONYM MTPKG_CHARG_RECURRING FOR LIVESCREEN.MTPKG_CHARG_RECURRING;


ALTER TABLE LIVESCREEN.MTPKG_CHARG_RECURRING ADD (
  CONSTRAINT MTPKG_CHARG_RECURRING_PK
  PRIMARY KEY
  (MSISDN, PKGD_ID)
  USING INDEX LIVESCREEN.MTPKG_CHARG_RECURRING_PK
  ENABLE VALIDATE);
