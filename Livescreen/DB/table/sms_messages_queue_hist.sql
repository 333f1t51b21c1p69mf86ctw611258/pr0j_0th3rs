DROP TABLE LIVESCREEN.SMS_MESSAGES_QUEUE_HIST CASCADE CONSTRAINTS;

CREATE TABLE LIVESCREEN.SMS_MESSAGES_QUEUE_HIST
(
  MSISDN    VARCHAR2(20 BYTE),
  CONTENT   VARCHAR2(3000 BYTE),
  DATETIME  TIMESTAMP(7),
  STATUS    NUMBER                              DEFAULT 0,
  ID        NUMBER(10)                          NOT NULL
)
NOCOMPRESS 
TABLESPACE TBS_SMSQUEUE_HIST
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
LOGGING
PARTITION BY RANGE (DATETIME)
(  
  PARTITION P20121210 VALUES LESS THAN (TIMESTAMP' 2012-12-11 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
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
  PARTITION P20121211 VALUES LESS THAN (TIMESTAMP' 2012-12-12 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
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
  PARTITION P20121212 VALUES LESS THAN (TIMESTAMP' 2012-12-13 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
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
  PARTITION P20121213 VALUES LESS THAN (TIMESTAMP' 2012-12-14 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
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
  PARTITION P20121214 VALUES LESS THAN (TIMESTAMP' 2012-12-15 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
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
  PARTITION P20121215 VALUES LESS THAN (TIMESTAMP' 2012-12-16 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
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
  PARTITION P20121216 VALUES LESS THAN (TIMESTAMP' 2012-12-17 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
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
  PARTITION P20121217 VALUES LESS THAN (TIMESTAMP' 2012-12-18 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
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
  PARTITION P20121218 VALUES LESS THAN (TIMESTAMP' 2012-12-19 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
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
  PARTITION P20121219 VALUES LESS THAN (TIMESTAMP' 2012-12-20 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
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
  PARTITION P20121220 VALUES LESS THAN (TIMESTAMP' 2012-12-21 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
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
  PARTITION P20121221 VALUES LESS THAN (TIMESTAMP' 2012-12-22 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
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
  PARTITION P20121222 VALUES LESS THAN (TIMESTAMP' 2012-12-23 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
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
  PARTITION P20121223 VALUES LESS THAN (TIMESTAMP' 2012-12-24 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
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
  PARTITION P20121224 VALUES LESS THAN (TIMESTAMP' 2012-12-25 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
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
  PARTITION P20121225 VALUES LESS THAN (TIMESTAMP' 2012-12-26 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
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
  PARTITION P20121226 VALUES LESS THAN (TIMESTAMP' 2012-12-27 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
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
  PARTITION P20121227 VALUES LESS THAN (TIMESTAMP' 2012-12-28 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
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
  PARTITION P20121228 VALUES LESS THAN (TIMESTAMP' 2012-12-29 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
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
  PARTITION P20121229 VALUES LESS THAN (TIMESTAMP' 2012-12-30 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
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
  PARTITION P20121230 VALUES LESS THAN (TIMESTAMP' 2012-12-31 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
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
  PARTITION P20121231 VALUES LESS THAN (TIMESTAMP' 2013-01-01 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
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


CREATE INDEX LIVESCREEN.IDX_MDN_MSGSMS_HIST ON LIVESCREEN.SMS_MESSAGES_QUEUE_HIST
(DATETIME, MSISDN)
  TABLESPACE TBS_IDX_SMSQUEUE_HIST
  PCTFREE    10
  INITRANS   2
  MAXTRANS   255
  STORAGE    (
              BUFFER_POOL      DEFAULT
              FLASH_CACHE      DEFAULT
              CELL_FLASH_CACHE DEFAULT
             )
LOGGING
LOCAL (  
  PARTITION P20121210
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION P20121211
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION P20121212
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION P20121213
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION P20121214
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION P20121215
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION P20121216
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION P20121217
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION P20121218
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION P20121219
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION P20121220
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION P20121221
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION P20121222
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION P20121223
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION P20121224
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION P20121225
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION P20121226
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION P20121227
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION P20121228
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION P20121229
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION P20121230
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION P20121231
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_SMSQUEUE_HIST
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               )
)
NOPARALLEL;


CREATE OR REPLACE PUBLIC SYNONYM SMS_MESSAGES_QUEUE_HIST FOR LIVESCREEN.SMS_MESSAGES_QUEUE_HIST;
