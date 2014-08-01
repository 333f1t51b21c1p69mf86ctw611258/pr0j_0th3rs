ALTER TABLE LIVESCREEN.MTPKG_SUBSCRIBER
 DROP PRIMARY KEY CASCADE;

DROP TABLE LIVESCREEN.MTPKG_SUBSCRIBER CASCADE CONSTRAINTS;

CREATE TABLE LIVESCREEN.MTPKG_SUBSCRIBER
(
  MSISDN           VARCHAR2(15 BYTE),
  PKGD_ID          VARCHAR2(127 BYTE),
  REGISTER_TIME    DATE,
  DEREGISTER_TIME  DATE,
  STATUS           NUMBER(3),
  LAST_UPDATE      DATE,
  LAST_UPDATE_BY   VARCHAR2(255 BYTE)
)
TABLESPACE MTPKG
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

COMMENT ON COLUMN LIVESCREEN.MTPKG_SUBSCRIBER.STATUS IS '0  - SUSPEND: H? th?ng t? d?ng h?y d?ch v? c?a thuê bao này do thuê bao n? cu?c quá lâu, ho?c thuê bao d?i ch?, ...
1  - AUTO_ACTIVE: Tr?ng thái này chua s? d?ng
2  - MANUAL_ACTIVE: Thuê bao nh?n tin dang ký
12 - MANUAL_DEACT: Thuê bao nh?n tin hu? dang ký
3  - FORCE_ACTIVE: Admin th?c hi?n dang d?ch v? cho thuê bao trên giao di?n web
13 - FORCE_DEACT: Admin th?c hi?n h?y d?ch v? cho thuê bao trên giao di?n web
14 - BLOCK_DEACT: H? th?ng t? d?ng h?y d?ch v? c?a thuê bao này do quá license ph?n m?m
15 - NOT_USED_DEACT: H? th?ng t? d?ng h?y d?ch v? c?a thuê bao này do thuê bao dang ký d?ch v? mà không s? d?ng trong th?i gian dài
20 - REG_NOT_ENOUGH_BALANCE: (Ðã b? tr?ng thái này) Thuê bao dang ký nhung ko d? ti?n thì v?n ch?p nh?n y.c này c?a thuê bao';



CREATE UNIQUE INDEX LIVESCREEN.MTPKG_SUBSCRIBER_PK ON LIVESCREEN.MTPKG_SUBSCRIBER
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


CREATE OR REPLACE TRIGGER LIVESCREEN.TRG_AR_UPDATE_MTPKG_SUBSCRIBER
   AFTER UPDATE
   ON LIVESCREEN.MTPKG_SUBSCRIBER
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
   PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
   INSERT INTO MTPKG_SUBSCRIBER_TEMP
        VALUES (profile_hist_seq.NEXTVAL,
                :old.msisdn,
				:new.PKGD_ID,
                :new.REGISTER_TIME,
                :new.DEREGISTER_TIME,
                :new.STATUS,
				:new.LAST_UPDATE,
				:new.LAST_UPDATE_BY,
                '3',
                SYSDATE,
                0);

   COMMIT;
END;
/


CREATE OR REPLACE TRIGGER LIVESCREEN.TRG_AR_INSERT_MTPKG_SUBSCRIBER
   AFTER INSERT
   ON LIVESCREEN.MTPKG_SUBSCRIBER
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
DECLARE
   PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
   INSERT INTO MTPKG_SUBSCRIBER_TEMP
        VALUES (profile_hist_seq.NEXTVAL,
                :new.msisdn,
				:new.PKGD_ID,
                :new.REGISTER_TIME,
                :new.DEREGISTER_TIME,
                :new.STATUS,
				:new.LAST_UPDATE,
				:new.LAST_UPDATE_BY,
                '1',
                SYSDATE,
                0);

   COMMIT;
END;
/


CREATE OR REPLACE PUBLIC SYNONYM MTPKG_SUBSCRIBER FOR LIVESCREEN.MTPKG_SUBSCRIBER;


ALTER TABLE LIVESCREEN.MTPKG_SUBSCRIBER ADD (
  CONSTRAINT MTPKG_SUBSCRIBER_PK
  PRIMARY KEY
  (MSISDN, PKGD_ID)
  USING INDEX LIVESCREEN.MTPKG_SUBSCRIBER_PK
  ENABLE VALIDATE);
