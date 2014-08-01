ALTER TABLE LIVESCREEN.PROGRAMS
 DROP PRIMARY KEY CASCADE;

DROP TABLE LIVESCREEN.PROGRAMS CASCADE CONSTRAINTS;

CREATE TABLE LIVESCREEN.PROGRAMS
(
  PROGRAM_ID       VARCHAR2(50 BYTE),
  TIMEPLUG         DATE,
  SUBCONTENTS      VARCHAR2(1000 BYTE),
  CPS_TOPIC_ID     NUMBER(30)                   NOT NULL,
  STATUS           NUMBER(5)                    DEFAULT 0,
  INDEXS           NUMBER(30)                   NOT NULL,
  DURATION_UPDATE  VARCHAR2(100 BYTE)           DEFAULT '0',
  TYPE             NUMBER(5)                    DEFAULT 0,
  INSERT_TIME      DATE                         DEFAULT sysdate,
  CHAIN_ID         VARCHAR2(50 BYTE),
  CORRECTANSWER    NUMBER(5)
)
NOCOMPRESS 
TABLESPACE USERS
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
PARTITION BY RANGE (TIMEPLUG)
(  
  PARTITION PART_1 VALUES LESS THAN (TO_DATE(' 2011-02-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PART_2 VALUES LESS THAN (TO_DATE(' 2011-03-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PART_3 VALUES LESS THAN (TO_DATE(' 2011-04-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PART_4 VALUES LESS THAN (TO_DATE(' 2011-05-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PART_5 VALUES LESS THAN (TO_DATE(' 2011-06-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PART_6 VALUES LESS THAN (TO_DATE(' 2011-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PART_7 VALUES LESS THAN (TO_DATE(' 2011-08-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PART_8 VALUES LESS THAN (TO_DATE(' 2011-09-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PART_9 VALUES LESS THAN (TO_DATE(' 2011-10-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PART_10 VALUES LESS THAN (TO_DATE(' 2011-11-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PART_11 VALUES LESS THAN (TO_DATE(' 2011-12-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PART_12 VALUES LESS THAN (TO_DATE(' 2012-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201201 VALUES LESS THAN (TO_DATE(' 2012-02-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201202 VALUES LESS THAN (TO_DATE(' 2012-03-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201203 VALUES LESS THAN (TO_DATE(' 2012-04-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201204 VALUES LESS THAN (TO_DATE(' 2012-05-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201205 VALUES LESS THAN (TO_DATE(' 2012-06-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201206 VALUES LESS THAN (TO_DATE(' 2012-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201207 VALUES LESS THAN (TO_DATE(' 2012-08-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201208 VALUES LESS THAN (TO_DATE(' 2012-09-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201209 VALUES LESS THAN (TO_DATE(' 2012-10-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201210 VALUES LESS THAN (TO_DATE(' 2012-11-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201211 VALUES LESS THAN (TO_DATE(' 2012-12-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201212 VALUES LESS THAN (TO_DATE(' 2013-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201301 VALUES LESS THAN (TO_DATE(' 2013-02-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201302 VALUES LESS THAN (TO_DATE(' 2013-03-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201303 VALUES LESS THAN (TO_DATE(' 2013-04-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201304 VALUES LESS THAN (TO_DATE(' 2013-05-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201305 VALUES LESS THAN (TO_DATE(' 2013-06-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201306 VALUES LESS THAN (TO_DATE(' 2013-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201307 VALUES LESS THAN (TO_DATE(' 2013-08-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201308 VALUES LESS THAN (TO_DATE(' 2013-09-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201309 VALUES LESS THAN (TO_DATE(' 2013-10-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201310 VALUES LESS THAN (TO_DATE(' 2013-11-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201311 VALUES LESS THAN (TO_DATE(' 2013-12-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201312 VALUES LESS THAN (TO_DATE(' 2014-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201401 VALUES LESS THAN (TO_DATE(' 2014-02-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201402 VALUES LESS THAN (TO_DATE(' 2014-03-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201403 VALUES LESS THAN (TO_DATE(' 2014-04-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201404 VALUES LESS THAN (TO_DATE(' 2014-05-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201405 VALUES LESS THAN (TO_DATE(' 2014-06-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201406 VALUES LESS THAN (TO_DATE(' 2014-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201407 VALUES LESS THAN (TO_DATE(' 2014-08-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201408 VALUES LESS THAN (TO_DATE(' 2014-09-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201409 VALUES LESS THAN (TO_DATE(' 2014-10-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201410 VALUES LESS THAN (TO_DATE(' 2014-11-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201411 VALUES LESS THAN (TO_DATE(' 2014-12-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
                FLASH_CACHE      DEFAULT
                CELL_FLASH_CACHE DEFAULT
               ),  
  PARTITION PROGRAMS201412 VALUES LESS THAN (TO_DATE(' 2015-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   1
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

COMMENT ON COLUMN LIVESCREEN.PROGRAMS.STATUS IS '0: Not Approved; 1: Approved; 2: Disable';

COMMENT ON COLUMN LIVESCREEN.PROGRAMS.TYPE IS '0: Regular, 1: Game';

COMMENT ON COLUMN LIVESCREEN.PROGRAMS.INSERT_TIME IS 'Thoi gian insert program vao DB';

COMMENT ON COLUMN LIVESCREEN.PROGRAMS.CHAIN_ID IS 'TRIVIA: Cac program thuoc cung mot file .xml se cung 1 CHAIN_ID';

COMMENT ON COLUMN LIVESCREEN.PROGRAMS.CORRECTANSWER IS 'TRIVIA: STT cua menu la cau tra loi dung trong 1 program';



CREATE UNIQUE INDEX LIVESCREEN.PROGRAMS_PK ON LIVESCREEN.PROGRAMS
(PROGRAM_ID)
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


CREATE OR REPLACE SYNONYM CBC.PROGRAMS FOR LIVESCREEN.PROGRAMS;


CREATE OR REPLACE PUBLIC SYNONYM PROGRAMS FOR LIVESCREEN.PROGRAMS;


ALTER TABLE LIVESCREEN.PROGRAMS ADD (
  CONSTRAINT PROGRAMS_PK
  PRIMARY KEY
  (PROGRAM_ID)
  USING INDEX LIVESCREEN.PROGRAMS_PK
  ENABLE VALIDATE);
