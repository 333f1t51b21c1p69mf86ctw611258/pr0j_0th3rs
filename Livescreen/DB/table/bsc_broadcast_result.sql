ALTER TABLE LIVESCREEN.BSC_BROADCAST_RESULT
 DROP PRIMARY KEY CASCADE;

DROP TABLE LIVESCREEN.BSC_BROADCAST_RESULT CASCADE CONSTRAINTS;

CREATE TABLE LIVESCREEN.BSC_BROADCAST_RESULT
(
  ID                    VARCHAR2(100 CHAR)      NOT NULL,
  BSC_ID                VARCHAR2(100 CHAR),
  ZONE_ID               NUMBER(15),
  SCHEDULE_ID           VARCHAR2(100 CHAR),
  CBM_ID                VARCHAR2(100 CHAR),
  MSG_SEQ_ID            VARCHAR2(100 CHAR),
  BROADCAST_MESSAGE_ID  VARCHAR2(100 CHAR),
  BSC_NAME              VARCHAR2(100 CHAR),
  VENDOR_NAME           VARCHAR2(100 CHAR),
  REGION                VARCHAR2(100 CHAR),
  REJECTED              NUMBER(1),
  REJECT_CAUSE          VARCHAR2(100 CHAR),
  LAST_UPDATED_TIME     TIMESTAMP(6),
  TOTAL_CELLS           NUMBER(9),
  SUCCESS_CELLS         NUMBER(9),
  FAILURE_CELLS         NUMBER(9),
  PENDING_CELLS         NUMBER(9),
  BROADCAST_STATE       VARCHAR2(20 CHAR),
  BROADCAST_TIME        TIMESTAMP(6),
  ZONE_NAME             VARCHAR2(100 CHAR),
  SMSCB_CENTER_ID       VARCHAR2(20 BYTE)
)
NOCOMPRESS 
TABLESPACE TBS_KPI
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
PARTITION BY RANGE (BROADCAST_TIME)
(  
  PARTITION P20130501 VALUES LESS THAN (TIMESTAMP' 2013-05-02 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130502 VALUES LESS THAN (TIMESTAMP' 2013-05-03 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130503 VALUES LESS THAN (TIMESTAMP' 2013-05-04 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130504 VALUES LESS THAN (TIMESTAMP' 2013-05-05 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130505 VALUES LESS THAN (TIMESTAMP' 2013-05-06 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130506 VALUES LESS THAN (TIMESTAMP' 2013-05-07 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130507 VALUES LESS THAN (TIMESTAMP' 2013-05-08 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130508 VALUES LESS THAN (TIMESTAMP' 2013-05-09 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130509 VALUES LESS THAN (TIMESTAMP' 2013-05-10 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130510 VALUES LESS THAN (TIMESTAMP' 2013-05-11 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130511 VALUES LESS THAN (TIMESTAMP' 2013-05-12 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130512 VALUES LESS THAN (TIMESTAMP' 2013-05-13 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130513 VALUES LESS THAN (TIMESTAMP' 2013-05-14 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130514 VALUES LESS THAN (TIMESTAMP' 2013-05-15 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130515 VALUES LESS THAN (TIMESTAMP' 2013-05-16 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130516 VALUES LESS THAN (TIMESTAMP' 2013-05-17 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130517 VALUES LESS THAN (TIMESTAMP' 2013-05-18 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130518 VALUES LESS THAN (TIMESTAMP' 2013-05-19 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130519 VALUES LESS THAN (TIMESTAMP' 2013-05-20 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130520 VALUES LESS THAN (TIMESTAMP' 2013-05-21 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130521 VALUES LESS THAN (TIMESTAMP' 2013-05-22 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130522 VALUES LESS THAN (TIMESTAMP' 2013-05-23 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130523 VALUES LESS THAN (TIMESTAMP' 2013-05-24 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130524 VALUES LESS THAN (TIMESTAMP' 2013-05-25 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130525 VALUES LESS THAN (TIMESTAMP' 2013-05-26 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130526 VALUES LESS THAN (TIMESTAMP' 2013-05-27 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130527 VALUES LESS THAN (TIMESTAMP' 2013-05-28 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130528 VALUES LESS THAN (TIMESTAMP' 2013-05-29 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130529 VALUES LESS THAN (TIMESTAMP' 2013-05-30 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130530 VALUES LESS THAN (TIMESTAMP' 2013-05-31 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130531 VALUES LESS THAN (TIMESTAMP' 2013-06-01 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130601 VALUES LESS THAN (TIMESTAMP' 2013-06-02 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130602 VALUES LESS THAN (TIMESTAMP' 2013-06-03 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130603 VALUES LESS THAN (TIMESTAMP' 2013-06-04 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130604 VALUES LESS THAN (TIMESTAMP' 2013-06-05 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130605 VALUES LESS THAN (TIMESTAMP' 2013-06-06 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130606 VALUES LESS THAN (TIMESTAMP' 2013-06-07 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130607 VALUES LESS THAN (TIMESTAMP' 2013-06-08 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130608 VALUES LESS THAN (TIMESTAMP' 2013-06-09 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130609 VALUES LESS THAN (TIMESTAMP' 2013-06-10 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130610 VALUES LESS THAN (TIMESTAMP' 2013-06-11 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130611 VALUES LESS THAN (TIMESTAMP' 2013-06-12 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130612 VALUES LESS THAN (TIMESTAMP' 2013-06-13 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130613 VALUES LESS THAN (TIMESTAMP' 2013-06-14 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130614 VALUES LESS THAN (TIMESTAMP' 2013-06-15 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130615 VALUES LESS THAN (TIMESTAMP' 2013-06-16 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130616 VALUES LESS THAN (TIMESTAMP' 2013-06-17 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130617 VALUES LESS THAN (TIMESTAMP' 2013-06-18 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130618 VALUES LESS THAN (TIMESTAMP' 2013-06-19 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130619 VALUES LESS THAN (TIMESTAMP' 2013-06-20 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130620 VALUES LESS THAN (TIMESTAMP' 2013-06-21 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130621 VALUES LESS THAN (TIMESTAMP' 2013-06-22 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130622 VALUES LESS THAN (TIMESTAMP' 2013-06-23 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130623 VALUES LESS THAN (TIMESTAMP' 2013-06-24 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130624 VALUES LESS THAN (TIMESTAMP' 2013-06-25 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130625 VALUES LESS THAN (TIMESTAMP' 2013-06-26 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130626 VALUES LESS THAN (TIMESTAMP' 2013-06-27 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130627 VALUES LESS THAN (TIMESTAMP' 2013-06-28 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130628 VALUES LESS THAN (TIMESTAMP' 2013-06-29 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130629 VALUES LESS THAN (TIMESTAMP' 2013-06-30 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130630 VALUES LESS THAN (TIMESTAMP' 2013-07-01 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130701 VALUES LESS THAN (TIMESTAMP' 2013-07-02 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130702 VALUES LESS THAN (TIMESTAMP' 2013-07-03 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130703 VALUES LESS THAN (TIMESTAMP' 2013-07-04 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130704 VALUES LESS THAN (TIMESTAMP' 2013-07-05 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130705 VALUES LESS THAN (TIMESTAMP' 2013-07-06 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130706 VALUES LESS THAN (TIMESTAMP' 2013-07-07 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130707 VALUES LESS THAN (TIMESTAMP' 2013-07-08 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130708 VALUES LESS THAN (TIMESTAMP' 2013-07-09 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130709 VALUES LESS THAN (TIMESTAMP' 2013-07-10 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130710 VALUES LESS THAN (TIMESTAMP' 2013-07-11 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130711 VALUES LESS THAN (TIMESTAMP' 2013-07-12 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130712 VALUES LESS THAN (TIMESTAMP' 2013-07-13 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130713 VALUES LESS THAN (TIMESTAMP' 2013-07-14 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130714 VALUES LESS THAN (TIMESTAMP' 2013-07-15 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130715 VALUES LESS THAN (TIMESTAMP' 2013-07-16 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130716 VALUES LESS THAN (TIMESTAMP' 2013-07-17 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130717 VALUES LESS THAN (TIMESTAMP' 2013-07-18 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130718 VALUES LESS THAN (TIMESTAMP' 2013-07-19 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130719 VALUES LESS THAN (TIMESTAMP' 2013-07-20 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130720 VALUES LESS THAN (TIMESTAMP' 2013-07-21 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130721 VALUES LESS THAN (TIMESTAMP' 2013-07-22 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130722 VALUES LESS THAN (TIMESTAMP' 2013-07-23 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130723 VALUES LESS THAN (TIMESTAMP' 2013-07-24 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130724 VALUES LESS THAN (TIMESTAMP' 2013-07-25 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130725 VALUES LESS THAN (TIMESTAMP' 2013-07-26 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130726 VALUES LESS THAN (TIMESTAMP' 2013-07-27 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130727 VALUES LESS THAN (TIMESTAMP' 2013-07-28 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130728 VALUES LESS THAN (TIMESTAMP' 2013-07-29 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130729 VALUES LESS THAN (TIMESTAMP' 2013-07-30 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130730 VALUES LESS THAN (TIMESTAMP' 2013-07-31 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130731 VALUES LESS THAN (TIMESTAMP' 2013-08-01 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130801 VALUES LESS THAN (TIMESTAMP' 2013-08-02 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130802 VALUES LESS THAN (TIMESTAMP' 2013-08-03 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130803 VALUES LESS THAN (TIMESTAMP' 2013-08-04 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130804 VALUES LESS THAN (TIMESTAMP' 2013-08-05 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130805 VALUES LESS THAN (TIMESTAMP' 2013-08-06 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130806 VALUES LESS THAN (TIMESTAMP' 2013-08-07 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130807 VALUES LESS THAN (TIMESTAMP' 2013-08-08 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130808 VALUES LESS THAN (TIMESTAMP' 2013-08-09 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130809 VALUES LESS THAN (TIMESTAMP' 2013-08-10 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130810 VALUES LESS THAN (TIMESTAMP' 2013-08-11 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130811 VALUES LESS THAN (TIMESTAMP' 2013-08-12 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130812 VALUES LESS THAN (TIMESTAMP' 2013-08-13 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130813 VALUES LESS THAN (TIMESTAMP' 2013-08-14 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130814 VALUES LESS THAN (TIMESTAMP' 2013-08-15 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130815 VALUES LESS THAN (TIMESTAMP' 2013-08-16 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130816 VALUES LESS THAN (TIMESTAMP' 2013-08-17 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130817 VALUES LESS THAN (TIMESTAMP' 2013-08-18 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130818 VALUES LESS THAN (TIMESTAMP' 2013-08-19 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130819 VALUES LESS THAN (TIMESTAMP' 2013-08-20 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130820 VALUES LESS THAN (TIMESTAMP' 2013-08-21 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130821 VALUES LESS THAN (TIMESTAMP' 2013-08-22 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130822 VALUES LESS THAN (TIMESTAMP' 2013-08-23 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130823 VALUES LESS THAN (TIMESTAMP' 2013-08-24 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130824 VALUES LESS THAN (TIMESTAMP' 2013-08-25 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130825 VALUES LESS THAN (TIMESTAMP' 2013-08-26 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130826 VALUES LESS THAN (TIMESTAMP' 2013-08-27 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130827 VALUES LESS THAN (TIMESTAMP' 2013-08-28 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130828 VALUES LESS THAN (TIMESTAMP' 2013-08-29 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130829 VALUES LESS THAN (TIMESTAMP' 2013-08-30 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130830 VALUES LESS THAN (TIMESTAMP' 2013-08-31 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130831 VALUES LESS THAN (TIMESTAMP' 2013-09-01 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130901 VALUES LESS THAN (TIMESTAMP' 2013-09-02 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130902 VALUES LESS THAN (TIMESTAMP' 2013-09-03 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130903 VALUES LESS THAN (TIMESTAMP' 2013-09-04 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130904 VALUES LESS THAN (TIMESTAMP' 2013-09-05 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130905 VALUES LESS THAN (TIMESTAMP' 2013-09-06 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130906 VALUES LESS THAN (TIMESTAMP' 2013-09-07 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130907 VALUES LESS THAN (TIMESTAMP' 2013-09-08 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130908 VALUES LESS THAN (TIMESTAMP' 2013-09-09 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130909 VALUES LESS THAN (TIMESTAMP' 2013-09-10 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130910 VALUES LESS THAN (TIMESTAMP' 2013-09-11 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130911 VALUES LESS THAN (TIMESTAMP' 2013-09-12 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130912 VALUES LESS THAN (TIMESTAMP' 2013-09-13 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130913 VALUES LESS THAN (TIMESTAMP' 2013-09-14 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130914 VALUES LESS THAN (TIMESTAMP' 2013-09-15 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130915 VALUES LESS THAN (TIMESTAMP' 2013-09-16 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130916 VALUES LESS THAN (TIMESTAMP' 2013-09-17 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130917 VALUES LESS THAN (TIMESTAMP' 2013-09-18 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130918 VALUES LESS THAN (TIMESTAMP' 2013-09-19 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130919 VALUES LESS THAN (TIMESTAMP' 2013-09-20 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130920 VALUES LESS THAN (TIMESTAMP' 2013-09-21 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130921 VALUES LESS THAN (TIMESTAMP' 2013-09-22 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130922 VALUES LESS THAN (TIMESTAMP' 2013-09-23 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130923 VALUES LESS THAN (TIMESTAMP' 2013-09-24 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130924 VALUES LESS THAN (TIMESTAMP' 2013-09-25 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130925 VALUES LESS THAN (TIMESTAMP' 2013-09-26 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130926 VALUES LESS THAN (TIMESTAMP' 2013-09-27 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130927 VALUES LESS THAN (TIMESTAMP' 2013-09-28 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130928 VALUES LESS THAN (TIMESTAMP' 2013-09-29 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130929 VALUES LESS THAN (TIMESTAMP' 2013-09-30 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20130930 VALUES LESS THAN (TIMESTAMP' 2013-10-01 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131001 VALUES LESS THAN (TIMESTAMP' 2013-10-02 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131002 VALUES LESS THAN (TIMESTAMP' 2013-10-03 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131003 VALUES LESS THAN (TIMESTAMP' 2013-10-04 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131004 VALUES LESS THAN (TIMESTAMP' 2013-10-05 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131005 VALUES LESS THAN (TIMESTAMP' 2013-10-06 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131006 VALUES LESS THAN (TIMESTAMP' 2013-10-07 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131007 VALUES LESS THAN (TIMESTAMP' 2013-10-08 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131008 VALUES LESS THAN (TIMESTAMP' 2013-10-09 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131009 VALUES LESS THAN (TIMESTAMP' 2013-10-10 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131010 VALUES LESS THAN (TIMESTAMP' 2013-10-11 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131011 VALUES LESS THAN (TIMESTAMP' 2013-10-12 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131012 VALUES LESS THAN (TIMESTAMP' 2013-10-13 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131013 VALUES LESS THAN (TIMESTAMP' 2013-10-14 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131014 VALUES LESS THAN (TIMESTAMP' 2013-10-15 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131015 VALUES LESS THAN (TIMESTAMP' 2013-10-16 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131016 VALUES LESS THAN (TIMESTAMP' 2013-10-17 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131017 VALUES LESS THAN (TIMESTAMP' 2013-10-18 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131018 VALUES LESS THAN (TIMESTAMP' 2013-10-19 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131019 VALUES LESS THAN (TIMESTAMP' 2013-10-20 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131020 VALUES LESS THAN (TIMESTAMP' 2013-10-21 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131021 VALUES LESS THAN (TIMESTAMP' 2013-10-22 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131022 VALUES LESS THAN (TIMESTAMP' 2013-10-23 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131023 VALUES LESS THAN (TIMESTAMP' 2013-10-24 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131024 VALUES LESS THAN (TIMESTAMP' 2013-10-25 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131025 VALUES LESS THAN (TIMESTAMP' 2013-10-26 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131026 VALUES LESS THAN (TIMESTAMP' 2013-10-27 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131027 VALUES LESS THAN (TIMESTAMP' 2013-10-28 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131028 VALUES LESS THAN (TIMESTAMP' 2013-10-29 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131029 VALUES LESS THAN (TIMESTAMP' 2013-10-30 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131030 VALUES LESS THAN (TIMESTAMP' 2013-10-31 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131031 VALUES LESS THAN (TIMESTAMP' 2013-11-01 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131101 VALUES LESS THAN (TIMESTAMP' 2013-11-02 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131102 VALUES LESS THAN (TIMESTAMP' 2013-11-03 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131103 VALUES LESS THAN (TIMESTAMP' 2013-11-04 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131104 VALUES LESS THAN (TIMESTAMP' 2013-11-05 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131105 VALUES LESS THAN (TIMESTAMP' 2013-11-06 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131106 VALUES LESS THAN (TIMESTAMP' 2013-11-07 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131107 VALUES LESS THAN (TIMESTAMP' 2013-11-08 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131108 VALUES LESS THAN (TIMESTAMP' 2013-11-09 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131109 VALUES LESS THAN (TIMESTAMP' 2013-11-10 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131110 VALUES LESS THAN (TIMESTAMP' 2013-11-11 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131111 VALUES LESS THAN (TIMESTAMP' 2013-11-12 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131112 VALUES LESS THAN (TIMESTAMP' 2013-11-13 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131113 VALUES LESS THAN (TIMESTAMP' 2013-11-14 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131114 VALUES LESS THAN (TIMESTAMP' 2013-11-15 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131115 VALUES LESS THAN (TIMESTAMP' 2013-11-16 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131116 VALUES LESS THAN (TIMESTAMP' 2013-11-17 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131117 VALUES LESS THAN (TIMESTAMP' 2013-11-18 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131118 VALUES LESS THAN (TIMESTAMP' 2013-11-19 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131119 VALUES LESS THAN (TIMESTAMP' 2013-11-20 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131120 VALUES LESS THAN (TIMESTAMP' 2013-11-21 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131121 VALUES LESS THAN (TIMESTAMP' 2013-11-22 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131122 VALUES LESS THAN (TIMESTAMP' 2013-11-23 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131123 VALUES LESS THAN (TIMESTAMP' 2013-11-24 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131124 VALUES LESS THAN (TIMESTAMP' 2013-11-25 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131125 VALUES LESS THAN (TIMESTAMP' 2013-11-26 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131126 VALUES LESS THAN (TIMESTAMP' 2013-11-27 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131127 VALUES LESS THAN (TIMESTAMP' 2013-11-28 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131128 VALUES LESS THAN (TIMESTAMP' 2013-11-29 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131129 VALUES LESS THAN (TIMESTAMP' 2013-11-30 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131130 VALUES LESS THAN (TIMESTAMP' 2013-12-01 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131201 VALUES LESS THAN (TIMESTAMP' 2013-12-02 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131202 VALUES LESS THAN (TIMESTAMP' 2013-12-03 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131203 VALUES LESS THAN (TIMESTAMP' 2013-12-04 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131204 VALUES LESS THAN (TIMESTAMP' 2013-12-05 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131205 VALUES LESS THAN (TIMESTAMP' 2013-12-06 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131206 VALUES LESS THAN (TIMESTAMP' 2013-12-07 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131207 VALUES LESS THAN (TIMESTAMP' 2013-12-08 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131208 VALUES LESS THAN (TIMESTAMP' 2013-12-09 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131209 VALUES LESS THAN (TIMESTAMP' 2013-12-10 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131210 VALUES LESS THAN (TIMESTAMP' 2013-12-11 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131211 VALUES LESS THAN (TIMESTAMP' 2013-12-12 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131212 VALUES LESS THAN (TIMESTAMP' 2013-12-13 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131213 VALUES LESS THAN (TIMESTAMP' 2013-12-14 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131214 VALUES LESS THAN (TIMESTAMP' 2013-12-15 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131215 VALUES LESS THAN (TIMESTAMP' 2013-12-16 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131216 VALUES LESS THAN (TIMESTAMP' 2013-12-17 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131217 VALUES LESS THAN (TIMESTAMP' 2013-12-18 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131218 VALUES LESS THAN (TIMESTAMP' 2013-12-19 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131219 VALUES LESS THAN (TIMESTAMP' 2013-12-20 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131220 VALUES LESS THAN (TIMESTAMP' 2013-12-21 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131221 VALUES LESS THAN (TIMESTAMP' 2013-12-22 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131222 VALUES LESS THAN (TIMESTAMP' 2013-12-23 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131223 VALUES LESS THAN (TIMESTAMP' 2013-12-24 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131224 VALUES LESS THAN (TIMESTAMP' 2013-12-25 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131225 VALUES LESS THAN (TIMESTAMP' 2013-12-26 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131226 VALUES LESS THAN (TIMESTAMP' 2013-12-27 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131227 VALUES LESS THAN (TIMESTAMP' 2013-12-28 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131228 VALUES LESS THAN (TIMESTAMP' 2013-12-29 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131229 VALUES LESS THAN (TIMESTAMP' 2013-12-30 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131230 VALUES LESS THAN (TIMESTAMP' 2013-12-31 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20131231 VALUES LESS THAN (TIMESTAMP' 2014-01-01 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140101 VALUES LESS THAN (TIMESTAMP' 2014-01-02 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140102 VALUES LESS THAN (TIMESTAMP' 2014-01-03 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140103 VALUES LESS THAN (TIMESTAMP' 2014-01-04 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140104 VALUES LESS THAN (TIMESTAMP' 2014-01-05 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140105 VALUES LESS THAN (TIMESTAMP' 2014-01-06 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140106 VALUES LESS THAN (TIMESTAMP' 2014-01-07 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140107 VALUES LESS THAN (TIMESTAMP' 2014-01-08 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140108 VALUES LESS THAN (TIMESTAMP' 2014-01-09 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140109 VALUES LESS THAN (TIMESTAMP' 2014-01-10 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140110 VALUES LESS THAN (TIMESTAMP' 2014-01-11 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140111 VALUES LESS THAN (TIMESTAMP' 2014-01-12 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140112 VALUES LESS THAN (TIMESTAMP' 2014-01-13 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140113 VALUES LESS THAN (TIMESTAMP' 2014-01-14 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140114 VALUES LESS THAN (TIMESTAMP' 2014-01-15 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140115 VALUES LESS THAN (TIMESTAMP' 2014-01-16 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140116 VALUES LESS THAN (TIMESTAMP' 2014-01-17 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140117 VALUES LESS THAN (TIMESTAMP' 2014-01-18 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140118 VALUES LESS THAN (TIMESTAMP' 2014-01-19 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140119 VALUES LESS THAN (TIMESTAMP' 2014-01-20 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140120 VALUES LESS THAN (TIMESTAMP' 2014-01-21 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140121 VALUES LESS THAN (TIMESTAMP' 2014-01-22 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140122 VALUES LESS THAN (TIMESTAMP' 2014-01-23 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140123 VALUES LESS THAN (TIMESTAMP' 2014-01-24 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140124 VALUES LESS THAN (TIMESTAMP' 2014-01-25 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140125 VALUES LESS THAN (TIMESTAMP' 2014-01-26 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140126 VALUES LESS THAN (TIMESTAMP' 2014-01-27 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140127 VALUES LESS THAN (TIMESTAMP' 2014-01-28 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140128 VALUES LESS THAN (TIMESTAMP' 2014-01-29 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140129 VALUES LESS THAN (TIMESTAMP' 2014-01-30 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140130 VALUES LESS THAN (TIMESTAMP' 2014-01-31 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140131 VALUES LESS THAN (TIMESTAMP' 2014-02-01 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140201 VALUES LESS THAN (TIMESTAMP' 2014-02-02 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140202 VALUES LESS THAN (TIMESTAMP' 2014-02-03 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140203 VALUES LESS THAN (TIMESTAMP' 2014-02-04 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140204 VALUES LESS THAN (TIMESTAMP' 2014-02-05 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140205 VALUES LESS THAN (TIMESTAMP' 2014-02-06 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140206 VALUES LESS THAN (TIMESTAMP' 2014-02-07 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140207 VALUES LESS THAN (TIMESTAMP' 2014-02-08 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140208 VALUES LESS THAN (TIMESTAMP' 2014-02-09 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140209 VALUES LESS THAN (TIMESTAMP' 2014-02-10 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140210 VALUES LESS THAN (TIMESTAMP' 2014-02-11 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140211 VALUES LESS THAN (TIMESTAMP' 2014-02-12 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140212 VALUES LESS THAN (TIMESTAMP' 2014-02-13 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140213 VALUES LESS THAN (TIMESTAMP' 2014-02-14 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140214 VALUES LESS THAN (TIMESTAMP' 2014-02-15 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140215 VALUES LESS THAN (TIMESTAMP' 2014-02-16 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140216 VALUES LESS THAN (TIMESTAMP' 2014-02-17 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140217 VALUES LESS THAN (TIMESTAMP' 2014-02-18 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140218 VALUES LESS THAN (TIMESTAMP' 2014-02-19 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140219 VALUES LESS THAN (TIMESTAMP' 2014-02-20 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140220 VALUES LESS THAN (TIMESTAMP' 2014-02-21 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140221 VALUES LESS THAN (TIMESTAMP' 2014-02-22 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140222 VALUES LESS THAN (TIMESTAMP' 2014-02-23 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140223 VALUES LESS THAN (TIMESTAMP' 2014-02-24 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140224 VALUES LESS THAN (TIMESTAMP' 2014-02-25 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140225 VALUES LESS THAN (TIMESTAMP' 2014-02-26 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140226 VALUES LESS THAN (TIMESTAMP' 2014-02-27 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140227 VALUES LESS THAN (TIMESTAMP' 2014-02-28 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140228 VALUES LESS THAN (TIMESTAMP' 2014-03-01 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140301 VALUES LESS THAN (TIMESTAMP' 2014-03-02 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140302 VALUES LESS THAN (TIMESTAMP' 2014-03-03 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140303 VALUES LESS THAN (TIMESTAMP' 2014-03-04 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140304 VALUES LESS THAN (TIMESTAMP' 2014-03-05 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140305 VALUES LESS THAN (TIMESTAMP' 2014-03-06 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140306 VALUES LESS THAN (TIMESTAMP' 2014-03-07 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140307 VALUES LESS THAN (TIMESTAMP' 2014-03-08 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140308 VALUES LESS THAN (TIMESTAMP' 2014-03-09 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140309 VALUES LESS THAN (TIMESTAMP' 2014-03-10 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140310 VALUES LESS THAN (TIMESTAMP' 2014-03-11 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140311 VALUES LESS THAN (TIMESTAMP' 2014-03-12 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140312 VALUES LESS THAN (TIMESTAMP' 2014-03-13 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140313 VALUES LESS THAN (TIMESTAMP' 2014-03-14 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140314 VALUES LESS THAN (TIMESTAMP' 2014-03-15 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140315 VALUES LESS THAN (TIMESTAMP' 2014-03-16 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140316 VALUES LESS THAN (TIMESTAMP' 2014-03-17 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140317 VALUES LESS THAN (TIMESTAMP' 2014-03-18 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140318 VALUES LESS THAN (TIMESTAMP' 2014-03-19 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140319 VALUES LESS THAN (TIMESTAMP' 2014-03-20 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140320 VALUES LESS THAN (TIMESTAMP' 2014-03-21 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140321 VALUES LESS THAN (TIMESTAMP' 2014-03-22 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140322 VALUES LESS THAN (TIMESTAMP' 2014-03-23 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140323 VALUES LESS THAN (TIMESTAMP' 2014-03-24 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140324 VALUES LESS THAN (TIMESTAMP' 2014-03-25 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140325 VALUES LESS THAN (TIMESTAMP' 2014-03-26 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140326 VALUES LESS THAN (TIMESTAMP' 2014-03-27 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140327 VALUES LESS THAN (TIMESTAMP' 2014-03-28 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140328 VALUES LESS THAN (TIMESTAMP' 2014-03-29 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140329 VALUES LESS THAN (TIMESTAMP' 2014-03-30 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140330 VALUES LESS THAN (TIMESTAMP' 2014-03-31 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140331 VALUES LESS THAN (TIMESTAMP' 2014-04-01 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140401 VALUES LESS THAN (TIMESTAMP' 2014-04-02 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140402 VALUES LESS THAN (TIMESTAMP' 2014-04-03 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140403 VALUES LESS THAN (TIMESTAMP' 2014-04-04 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140404 VALUES LESS THAN (TIMESTAMP' 2014-04-05 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140405 VALUES LESS THAN (TIMESTAMP' 2014-04-06 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140406 VALUES LESS THAN (TIMESTAMP' 2014-04-07 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140407 VALUES LESS THAN (TIMESTAMP' 2014-04-08 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140408 VALUES LESS THAN (TIMESTAMP' 2014-04-09 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140409 VALUES LESS THAN (TIMESTAMP' 2014-04-10 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140410 VALUES LESS THAN (TIMESTAMP' 2014-04-11 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140411 VALUES LESS THAN (TIMESTAMP' 2014-04-12 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140412 VALUES LESS THAN (TIMESTAMP' 2014-04-13 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140413 VALUES LESS THAN (TIMESTAMP' 2014-04-14 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140414 VALUES LESS THAN (TIMESTAMP' 2014-04-15 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140415 VALUES LESS THAN (TIMESTAMP' 2014-04-16 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140416 VALUES LESS THAN (TIMESTAMP' 2014-04-17 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140417 VALUES LESS THAN (TIMESTAMP' 2014-04-18 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140418 VALUES LESS THAN (TIMESTAMP' 2014-04-19 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140419 VALUES LESS THAN (TIMESTAMP' 2014-04-20 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140420 VALUES LESS THAN (TIMESTAMP' 2014-04-21 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140421 VALUES LESS THAN (TIMESTAMP' 2014-04-22 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140422 VALUES LESS THAN (TIMESTAMP' 2014-04-23 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140423 VALUES LESS THAN (TIMESTAMP' 2014-04-24 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140424 VALUES LESS THAN (TIMESTAMP' 2014-04-25 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140425 VALUES LESS THAN (TIMESTAMP' 2014-04-26 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140426 VALUES LESS THAN (TIMESTAMP' 2014-04-27 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140427 VALUES LESS THAN (TIMESTAMP' 2014-04-28 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140428 VALUES LESS THAN (TIMESTAMP' 2014-04-29 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140429 VALUES LESS THAN (TIMESTAMP' 2014-04-30 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140430 VALUES LESS THAN (TIMESTAMP' 2014-05-01 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140501 VALUES LESS THAN (TIMESTAMP' 2014-05-02 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140502 VALUES LESS THAN (TIMESTAMP' 2014-05-03 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140503 VALUES LESS THAN (TIMESTAMP' 2014-05-04 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140504 VALUES LESS THAN (TIMESTAMP' 2014-05-05 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140505 VALUES LESS THAN (TIMESTAMP' 2014-05-06 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140506 VALUES LESS THAN (TIMESTAMP' 2014-05-07 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140507 VALUES LESS THAN (TIMESTAMP' 2014-05-08 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140508 VALUES LESS THAN (TIMESTAMP' 2014-05-09 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140509 VALUES LESS THAN (TIMESTAMP' 2014-05-10 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140510 VALUES LESS THAN (TIMESTAMP' 2014-05-11 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140511 VALUES LESS THAN (TIMESTAMP' 2014-05-12 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140512 VALUES LESS THAN (TIMESTAMP' 2014-05-13 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140513 VALUES LESS THAN (TIMESTAMP' 2014-05-14 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140514 VALUES LESS THAN (TIMESTAMP' 2014-05-15 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140515 VALUES LESS THAN (TIMESTAMP' 2014-05-16 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140516 VALUES LESS THAN (TIMESTAMP' 2014-05-17 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140517 VALUES LESS THAN (TIMESTAMP' 2014-05-18 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140518 VALUES LESS THAN (TIMESTAMP' 2014-05-19 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140519 VALUES LESS THAN (TIMESTAMP' 2014-05-20 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140520 VALUES LESS THAN (TIMESTAMP' 2014-05-21 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140521 VALUES LESS THAN (TIMESTAMP' 2014-05-22 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140522 VALUES LESS THAN (TIMESTAMP' 2014-05-23 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140523 VALUES LESS THAN (TIMESTAMP' 2014-05-24 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140524 VALUES LESS THAN (TIMESTAMP' 2014-05-25 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140525 VALUES LESS THAN (TIMESTAMP' 2014-05-26 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140526 VALUES LESS THAN (TIMESTAMP' 2014-05-27 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140527 VALUES LESS THAN (TIMESTAMP' 2014-05-28 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140528 VALUES LESS THAN (TIMESTAMP' 2014-05-29 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140529 VALUES LESS THAN (TIMESTAMP' 2014-05-30 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140530 VALUES LESS THAN (TIMESTAMP' 2014-05-31 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140531 VALUES LESS THAN (TIMESTAMP' 2014-06-01 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140601 VALUES LESS THAN (TIMESTAMP' 2014-06-02 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140602 VALUES LESS THAN (TIMESTAMP' 2014-06-03 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140603 VALUES LESS THAN (TIMESTAMP' 2014-06-04 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140604 VALUES LESS THAN (TIMESTAMP' 2014-06-05 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140605 VALUES LESS THAN (TIMESTAMP' 2014-06-06 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140606 VALUES LESS THAN (TIMESTAMP' 2014-06-07 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140607 VALUES LESS THAN (TIMESTAMP' 2014-06-08 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140608 VALUES LESS THAN (TIMESTAMP' 2014-06-09 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140609 VALUES LESS THAN (TIMESTAMP' 2014-06-10 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140610 VALUES LESS THAN (TIMESTAMP' 2014-06-11 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140611 VALUES LESS THAN (TIMESTAMP' 2014-06-12 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140612 VALUES LESS THAN (TIMESTAMP' 2014-06-13 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140613 VALUES LESS THAN (TIMESTAMP' 2014-06-14 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140614 VALUES LESS THAN (TIMESTAMP' 2014-06-15 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140615 VALUES LESS THAN (TIMESTAMP' 2014-06-16 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140616 VALUES LESS THAN (TIMESTAMP' 2014-06-17 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140617 VALUES LESS THAN (TIMESTAMP' 2014-06-18 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140618 VALUES LESS THAN (TIMESTAMP' 2014-06-19 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140619 VALUES LESS THAN (TIMESTAMP' 2014-06-20 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140620 VALUES LESS THAN (TIMESTAMP' 2014-06-21 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140621 VALUES LESS THAN (TIMESTAMP' 2014-06-22 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140622 VALUES LESS THAN (TIMESTAMP' 2014-06-23 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140623 VALUES LESS THAN (TIMESTAMP' 2014-06-24 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140624 VALUES LESS THAN (TIMESTAMP' 2014-06-25 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140625 VALUES LESS THAN (TIMESTAMP' 2014-06-26 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140626 VALUES LESS THAN (TIMESTAMP' 2014-06-27 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140627 VALUES LESS THAN (TIMESTAMP' 2014-06-28 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140628 VALUES LESS THAN (TIMESTAMP' 2014-06-29 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140629 VALUES LESS THAN (TIMESTAMP' 2014-06-30 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140630 VALUES LESS THAN (TIMESTAMP' 2014-07-01 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140701 VALUES LESS THAN (TIMESTAMP' 2014-07-02 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140702 VALUES LESS THAN (TIMESTAMP' 2014-07-03 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140703 VALUES LESS THAN (TIMESTAMP' 2014-07-04 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140704 VALUES LESS THAN (TIMESTAMP' 2014-07-05 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140705 VALUES LESS THAN (TIMESTAMP' 2014-07-06 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140706 VALUES LESS THAN (TIMESTAMP' 2014-07-07 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140707 VALUES LESS THAN (TIMESTAMP' 2014-07-08 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140708 VALUES LESS THAN (TIMESTAMP' 2014-07-09 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140709 VALUES LESS THAN (TIMESTAMP' 2014-07-10 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140710 VALUES LESS THAN (TIMESTAMP' 2014-07-11 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140711 VALUES LESS THAN (TIMESTAMP' 2014-07-12 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140712 VALUES LESS THAN (TIMESTAMP' 2014-07-13 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140713 VALUES LESS THAN (TIMESTAMP' 2014-07-14 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140714 VALUES LESS THAN (TIMESTAMP' 2014-07-15 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140715 VALUES LESS THAN (TIMESTAMP' 2014-07-16 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140716 VALUES LESS THAN (TIMESTAMP' 2014-07-17 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140717 VALUES LESS THAN (TIMESTAMP' 2014-07-18 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140718 VALUES LESS THAN (TIMESTAMP' 2014-07-19 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140719 VALUES LESS THAN (TIMESTAMP' 2014-07-20 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140720 VALUES LESS THAN (TIMESTAMP' 2014-07-21 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140721 VALUES LESS THAN (TIMESTAMP' 2014-07-22 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140722 VALUES LESS THAN (TIMESTAMP' 2014-07-23 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140723 VALUES LESS THAN (TIMESTAMP' 2014-07-24 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140724 VALUES LESS THAN (TIMESTAMP' 2014-07-25 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140725 VALUES LESS THAN (TIMESTAMP' 2014-07-26 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140726 VALUES LESS THAN (TIMESTAMP' 2014-07-27 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140727 VALUES LESS THAN (TIMESTAMP' 2014-07-28 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140728 VALUES LESS THAN (TIMESTAMP' 2014-07-29 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140729 VALUES LESS THAN (TIMESTAMP' 2014-07-30 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140730 VALUES LESS THAN (TIMESTAMP' 2014-07-31 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140731 VALUES LESS THAN (TIMESTAMP' 2014-08-01 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140801 VALUES LESS THAN (TIMESTAMP' 2014-08-02 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140802 VALUES LESS THAN (TIMESTAMP' 2014-08-03 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140803 VALUES LESS THAN (TIMESTAMP' 2014-08-04 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140804 VALUES LESS THAN (TIMESTAMP' 2014-08-05 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140805 VALUES LESS THAN (TIMESTAMP' 2014-08-06 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140806 VALUES LESS THAN (TIMESTAMP' 2014-08-07 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140807 VALUES LESS THAN (TIMESTAMP' 2014-08-08 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140808 VALUES LESS THAN (TIMESTAMP' 2014-08-09 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140809 VALUES LESS THAN (TIMESTAMP' 2014-08-10 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140810 VALUES LESS THAN (TIMESTAMP' 2014-08-11 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140811 VALUES LESS THAN (TIMESTAMP' 2014-08-12 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140812 VALUES LESS THAN (TIMESTAMP' 2014-08-13 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140813 VALUES LESS THAN (TIMESTAMP' 2014-08-14 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140814 VALUES LESS THAN (TIMESTAMP' 2014-08-15 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140815 VALUES LESS THAN (TIMESTAMP' 2014-08-16 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140816 VALUES LESS THAN (TIMESTAMP' 2014-08-17 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140817 VALUES LESS THAN (TIMESTAMP' 2014-08-18 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140818 VALUES LESS THAN (TIMESTAMP' 2014-08-19 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140819 VALUES LESS THAN (TIMESTAMP' 2014-08-20 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140820 VALUES LESS THAN (TIMESTAMP' 2014-08-21 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140821 VALUES LESS THAN (TIMESTAMP' 2014-08-22 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140822 VALUES LESS THAN (TIMESTAMP' 2014-08-23 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140823 VALUES LESS THAN (TIMESTAMP' 2014-08-24 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140824 VALUES LESS THAN (TIMESTAMP' 2014-08-25 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140825 VALUES LESS THAN (TIMESTAMP' 2014-08-26 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140826 VALUES LESS THAN (TIMESTAMP' 2014-08-27 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140827 VALUES LESS THAN (TIMESTAMP' 2014-08-28 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140828 VALUES LESS THAN (TIMESTAMP' 2014-08-29 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140829 VALUES LESS THAN (TIMESTAMP' 2014-08-30 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140830 VALUES LESS THAN (TIMESTAMP' 2014-08-31 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140831 VALUES LESS THAN (TIMESTAMP' 2014-09-01 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140901 VALUES LESS THAN (TIMESTAMP' 2014-09-02 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140902 VALUES LESS THAN (TIMESTAMP' 2014-09-03 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140903 VALUES LESS THAN (TIMESTAMP' 2014-09-04 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140904 VALUES LESS THAN (TIMESTAMP' 2014-09-05 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140905 VALUES LESS THAN (TIMESTAMP' 2014-09-06 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140906 VALUES LESS THAN (TIMESTAMP' 2014-09-07 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140907 VALUES LESS THAN (TIMESTAMP' 2014-09-08 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140908 VALUES LESS THAN (TIMESTAMP' 2014-09-09 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140909 VALUES LESS THAN (TIMESTAMP' 2014-09-10 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140910 VALUES LESS THAN (TIMESTAMP' 2014-09-11 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140911 VALUES LESS THAN (TIMESTAMP' 2014-09-12 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140912 VALUES LESS THAN (TIMESTAMP' 2014-09-13 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140913 VALUES LESS THAN (TIMESTAMP' 2014-09-14 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140914 VALUES LESS THAN (TIMESTAMP' 2014-09-15 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140915 VALUES LESS THAN (TIMESTAMP' 2014-09-16 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140916 VALUES LESS THAN (TIMESTAMP' 2014-09-17 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140917 VALUES LESS THAN (TIMESTAMP' 2014-09-18 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140918 VALUES LESS THAN (TIMESTAMP' 2014-09-19 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140919 VALUES LESS THAN (TIMESTAMP' 2014-09-20 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140920 VALUES LESS THAN (TIMESTAMP' 2014-09-21 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140921 VALUES LESS THAN (TIMESTAMP' 2014-09-22 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140922 VALUES LESS THAN (TIMESTAMP' 2014-09-23 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140923 VALUES LESS THAN (TIMESTAMP' 2014-09-24 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140924 VALUES LESS THAN (TIMESTAMP' 2014-09-25 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140925 VALUES LESS THAN (TIMESTAMP' 2014-09-26 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140926 VALUES LESS THAN (TIMESTAMP' 2014-09-27 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140927 VALUES LESS THAN (TIMESTAMP' 2014-09-28 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140928 VALUES LESS THAN (TIMESTAMP' 2014-09-29 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140929 VALUES LESS THAN (TIMESTAMP' 2014-09-30 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20140930 VALUES LESS THAN (TIMESTAMP' 2014-10-01 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141001 VALUES LESS THAN (TIMESTAMP' 2014-10-02 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141002 VALUES LESS THAN (TIMESTAMP' 2014-10-03 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141003 VALUES LESS THAN (TIMESTAMP' 2014-10-04 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141004 VALUES LESS THAN (TIMESTAMP' 2014-10-05 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141005 VALUES LESS THAN (TIMESTAMP' 2014-10-06 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141006 VALUES LESS THAN (TIMESTAMP' 2014-10-07 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141007 VALUES LESS THAN (TIMESTAMP' 2014-10-08 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141008 VALUES LESS THAN (TIMESTAMP' 2014-10-09 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141009 VALUES LESS THAN (TIMESTAMP' 2014-10-10 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141010 VALUES LESS THAN (TIMESTAMP' 2014-10-11 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141011 VALUES LESS THAN (TIMESTAMP' 2014-10-12 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141012 VALUES LESS THAN (TIMESTAMP' 2014-10-13 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141013 VALUES LESS THAN (TIMESTAMP' 2014-10-14 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141014 VALUES LESS THAN (TIMESTAMP' 2014-10-15 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141015 VALUES LESS THAN (TIMESTAMP' 2014-10-16 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141016 VALUES LESS THAN (TIMESTAMP' 2014-10-17 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141017 VALUES LESS THAN (TIMESTAMP' 2014-10-18 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141018 VALUES LESS THAN (TIMESTAMP' 2014-10-19 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141019 VALUES LESS THAN (TIMESTAMP' 2014-10-20 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141020 VALUES LESS THAN (TIMESTAMP' 2014-10-21 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141021 VALUES LESS THAN (TIMESTAMP' 2014-10-22 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141022 VALUES LESS THAN (TIMESTAMP' 2014-10-23 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141023 VALUES LESS THAN (TIMESTAMP' 2014-10-24 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141024 VALUES LESS THAN (TIMESTAMP' 2014-10-25 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141025 VALUES LESS THAN (TIMESTAMP' 2014-10-26 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141026 VALUES LESS THAN (TIMESTAMP' 2014-10-27 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141027 VALUES LESS THAN (TIMESTAMP' 2014-10-28 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141028 VALUES LESS THAN (TIMESTAMP' 2014-10-29 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141029 VALUES LESS THAN (TIMESTAMP' 2014-10-30 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141030 VALUES LESS THAN (TIMESTAMP' 2014-10-31 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141031 VALUES LESS THAN (TIMESTAMP' 2014-11-01 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141101 VALUES LESS THAN (TIMESTAMP' 2014-11-02 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141102 VALUES LESS THAN (TIMESTAMP' 2014-11-03 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141103 VALUES LESS THAN (TIMESTAMP' 2014-11-04 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141104 VALUES LESS THAN (TIMESTAMP' 2014-11-05 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141105 VALUES LESS THAN (TIMESTAMP' 2014-11-06 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141106 VALUES LESS THAN (TIMESTAMP' 2014-11-07 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141107 VALUES LESS THAN (TIMESTAMP' 2014-11-08 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141108 VALUES LESS THAN (TIMESTAMP' 2014-11-09 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141109 VALUES LESS THAN (TIMESTAMP' 2014-11-10 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141110 VALUES LESS THAN (TIMESTAMP' 2014-11-11 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141111 VALUES LESS THAN (TIMESTAMP' 2014-11-12 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141112 VALUES LESS THAN (TIMESTAMP' 2014-11-13 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141113 VALUES LESS THAN (TIMESTAMP' 2014-11-14 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141114 VALUES LESS THAN (TIMESTAMP' 2014-11-15 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141115 VALUES LESS THAN (TIMESTAMP' 2014-11-16 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141116 VALUES LESS THAN (TIMESTAMP' 2014-11-17 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141117 VALUES LESS THAN (TIMESTAMP' 2014-11-18 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141118 VALUES LESS THAN (TIMESTAMP' 2014-11-19 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141119 VALUES LESS THAN (TIMESTAMP' 2014-11-20 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141120 VALUES LESS THAN (TIMESTAMP' 2014-11-21 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141121 VALUES LESS THAN (TIMESTAMP' 2014-11-22 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141122 VALUES LESS THAN (TIMESTAMP' 2014-11-23 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141123 VALUES LESS THAN (TIMESTAMP' 2014-11-24 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141124 VALUES LESS THAN (TIMESTAMP' 2014-11-25 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141125 VALUES LESS THAN (TIMESTAMP' 2014-11-26 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141126 VALUES LESS THAN (TIMESTAMP' 2014-11-27 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141127 VALUES LESS THAN (TIMESTAMP' 2014-11-28 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141128 VALUES LESS THAN (TIMESTAMP' 2014-11-29 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141129 VALUES LESS THAN (TIMESTAMP' 2014-11-30 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141130 VALUES LESS THAN (TIMESTAMP' 2014-12-01 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141201 VALUES LESS THAN (TIMESTAMP' 2014-12-02 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141202 VALUES LESS THAN (TIMESTAMP' 2014-12-03 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141203 VALUES LESS THAN (TIMESTAMP' 2014-12-04 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141204 VALUES LESS THAN (TIMESTAMP' 2014-12-05 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141205 VALUES LESS THAN (TIMESTAMP' 2014-12-06 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141206 VALUES LESS THAN (TIMESTAMP' 2014-12-07 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141207 VALUES LESS THAN (TIMESTAMP' 2014-12-08 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141208 VALUES LESS THAN (TIMESTAMP' 2014-12-09 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141209 VALUES LESS THAN (TIMESTAMP' 2014-12-10 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141210 VALUES LESS THAN (TIMESTAMP' 2014-12-11 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141211 VALUES LESS THAN (TIMESTAMP' 2014-12-12 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141212 VALUES LESS THAN (TIMESTAMP' 2014-12-13 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141213 VALUES LESS THAN (TIMESTAMP' 2014-12-14 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141214 VALUES LESS THAN (TIMESTAMP' 2014-12-15 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141215 VALUES LESS THAN (TIMESTAMP' 2014-12-16 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141216 VALUES LESS THAN (TIMESTAMP' 2014-12-17 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141217 VALUES LESS THAN (TIMESTAMP' 2014-12-18 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141218 VALUES LESS THAN (TIMESTAMP' 2014-12-19 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141219 VALUES LESS THAN (TIMESTAMP' 2014-12-20 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141220 VALUES LESS THAN (TIMESTAMP' 2014-12-21 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141221 VALUES LESS THAN (TIMESTAMP' 2014-12-22 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141222 VALUES LESS THAN (TIMESTAMP' 2014-12-23 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141223 VALUES LESS THAN (TIMESTAMP' 2014-12-24 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141224 VALUES LESS THAN (TIMESTAMP' 2014-12-25 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141225 VALUES LESS THAN (TIMESTAMP' 2014-12-26 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141226 VALUES LESS THAN (TIMESTAMP' 2014-12-27 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141227 VALUES LESS THAN (TIMESTAMP' 2014-12-28 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141228 VALUES LESS THAN (TIMESTAMP' 2014-12-29 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141229 VALUES LESS THAN (TIMESTAMP' 2014-12-30 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141230 VALUES LESS THAN (TIMESTAMP' 2014-12-31 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20141231 VALUES LESS THAN (TIMESTAMP' 2015-01-01 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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
  PARTITION P20150101 VALUES LESS THAN (TIMESTAMP' 2015-01-02 00:00:00')
    LOGGING
    NOCOMPRESS 
    TABLESPACE TBS_KPI
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


CREATE UNIQUE INDEX LIVESCREEN.BSC_BROADCAST_RESULT_PK ON LIVESCREEN.BSC_BROADCAST_RESULT
(ID)
LOGGING
TABLESPACE TBS_KPI
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


CREATE OR REPLACE PUBLIC SYNONYM BSC_BROADCAST_RESULT FOR LIVESCREEN.BSC_BROADCAST_RESULT;


ALTER TABLE LIVESCREEN.BSC_BROADCAST_RESULT ADD (
  CONSTRAINT BSC_BROADCAST_RESULT_PK
  PRIMARY KEY
  (ID)
  USING INDEX LIVESCREEN.BSC_BROADCAST_RESULT_PK
  ENABLE VALIDATE);
