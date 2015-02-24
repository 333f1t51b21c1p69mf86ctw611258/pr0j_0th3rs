ALTER TABLE LIVESCREEN.PROFILE
 DROP PRIMARY KEY CASCADE;

DROP TABLE LIVESCREEN.PROFILE CASCADE CONSTRAINTS;

CREATE TABLE LIVESCREEN.PROFILE
(
  MSISDN            VARCHAR2(20 BYTE)           NOT NULL,
  ACTIVETIME        DATE,
  LAST_UPDATE_DATE  DATE,
  STATUS_ID         NUMBER(2),
  DEACTIVETIME      DATE,
  IMEI              VARCHAR2(50 BYTE),
  COS_ID            VARCHAR2(15 BYTE),
  VERSION           VARCHAR2(50 BYTE),
  LAC               VARCHAR2(10 BYTE),
  CELL              VARCHAR2(10 BYTE),
  SUBTYPE           VARCHAR2(10 BYTE)
)
TABLESPACE LSB
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
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

COMMENT ON COLUMN LIVESCREEN.PROFILE.STATUS_ID IS '0  - SUSPEND: H? th?ng t? d?ng h?y d?ch v? c?a thu� bao n�y do thu� bao n? cu?c qu� l�u, ho?c thu� bao d?i ch?, ...
1  - AUTO_ACTIVE: �i?n tho?i(ch�nh x�c l� SIM) t? d?ng g?i b?n tin dang k� khi SIM m?i mua g?i 900
2  - MANUAL_ACTIVE: Thu� bao v�o menu tr�n SIM: Super SIM -> LiveInfo -> Bat/Tat D.vu -> Bat
12 - MANUAL_DEACT: Thu� bao v�o menu tr�n SIM: Super SIM -> LiveInfo -> Bat/Tat D.vu -> Tat
3  - FORCE_ACTIVE: Admin th?c hi?n dang d?ch v? cho thu� bao tr�n giao di?n web
13 - FORCE_DEACT: Admin th?c hi?n h?y d?ch v? cho thu� bao tr�n giao di?n web
14 - BLOCK_DEACT: H? th?ng t? d?ng h?y d?ch v? c?a thu� bao n�y do qu� license ph?n m?m
15 - NOT_USED_DEACT: H? th?ng t? d?ng h?y d?ch v? c?a thu� bao n�y do thu� bao dang k� d?ch v? m� kh�ng s? d?ng trong th?i gian d�i
20 - PENDING: Tr?ng th�i ch? dang k� cho SIM m?i h�a m?ng';



CREATE UNIQUE INDEX LIVESCREEN.PROFILE_PK ON LIVESCREEN.PROFILE
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


CREATE OR REPLACE TRIGGER LIVESCREEN.TRG_AR_UPDATE_PROFILE
   AFTER UPDATE
   ON LIVESCREEN.PROFILE
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
   PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
   INSERT INTO profile_temp
        VALUES (profile_hist_seq.NEXTVAL,
                :old.msisdn,
                :new.activetime,
                :old.imei,
                :new.status_id,
                :old.cos_id,
                :new.deactivetime,
                :old.version,
                :old.lac,
                :old.cell,
                :old.subtype,
                '3',
                SYSDATE,
                0);

   COMMIT;
END;
/


CREATE OR REPLACE TRIGGER LIVESCREEN.TRG_AR_INSERT_PROFILE
   AFTER INSERT
   ON LIVESCREEN.PROFILE
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
   PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
   INSERT INTO profile_temp
        VALUES (profile_hist_seq.NEXTVAL,
                :new.msisdn,
                :new.activetime,
                :new.imei,
                :new.status_id,
                :new.cos_id,
                :new.deactivetime,
                :new.version,
                :new.lac,
                :new.cell,
                :new.subtype,
                '1',
                SYSDATE,
                0);

   COMMIT;
END;
/


CREATE OR REPLACE PUBLIC SYNONYM PROFILE FOR LIVESCREEN.PROFILE;


ALTER TABLE LIVESCREEN.PROFILE ADD (
  CONSTRAINT PROFILE_PK
  PRIMARY KEY
  (MSISDN)
  USING INDEX LIVESCREEN.PROFILE_PK
  ENABLE VALIDATE);
