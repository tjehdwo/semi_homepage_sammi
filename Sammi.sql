CREATE TABLE USERINFO (
USER_ID NUMBER(5) PRIMARY KEY,
ID VARCHAR2(50) NOT NULL,
PASSWORD VARCHAR2(50) NOT NULL,
PWCHECK VARCHAR2(50) NOT NULL,
PHONE_NUMBER VARCHAR2(15) NOT NULL,
EMAIL VARCHAR2(50),
ADDRESS VARCHAR2(50) NOT NULL
);

CREATE TABLE CONNECTING (
CONNECTING_ID NUMBER(5) PRIMARY KEY,
CONNECTING_INTERMEDIARY_ID NUMBER(5) NOT NULL,
CONNECTING_DETAIL VARCHAR2(500) NOT NULL,
CONNECTING_DATE DATE NOT NULL,
CONNECTING_A_C CHAR(1) NOT NULL,
CONNECTING_USER_ID NUMBER,
FOREIGN KEY(CONNECTING_USER_ID) REFERENCES USERINFO(USER_ID) ON DELETE CASCADE
);

CREATE SEQUENCE CONNECTING_SEQ
 START WITH 1
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;
 
CREATE OR REPLACE TRIGGER CONNECTING_TRIGGER
BEFORE INSERT ON CONNECTING
FOR EACH ROW
BEGIN
    SELECT CONNECTING_SEQ.NEXTVAL
    INTO:NEW.CONNECTING_USER_ID
    FROM DUAL;
END;
/

CREATE SEQUENCE USERINFO_SEQ
 START WITH 1
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;
 
 CREATE OR REPLACE TRIGGER USERINFO_TRIGGER
 BEFORE INSERT ON USERINFO
 FOR EACH ROW
 BEGIN
    SELECT USERINFO_SEQ.NEXTVAL
    INTO:NEW.USER_ID
    FROM DUAL;
END;
/

CREATE TABLE INTERMEDIARY (
INTERMEDIARY_ID NUMBER(5) PRIMARY KEY,
BUSINESS_NUMBER VARCHAR2(20) NOT NULL,
CEO_NAME VARCHAR2(255) NOT NULL,
COMPANY_NAME VARCHAR2(255) NOT NULL,
COMPANY_ADDRESS VARCHAR2(255) NOT NULL,
CONTACT_START_TIME DATE NOT NULL,
CONTACT_END_TIME DATE NOT NULL,
INTERMEDIARY_USER_ID NUMBER(5),
FOREIGN KEY(INTERMEDIARY_USER_ID) REFERENCES USERINFO(USER_ID) ON DELETE CASCADE
);
CREATE TABLE REALESTATEINFO (
REALESTATE_ID NUMBER(5) PRIMARY KEY,
INTERMEDIARY_ID NUMBER(5) NOT NULL,
REALESTATE_NAME VARCHAR2(255),
REALESTATE_TYPE VARCHAR2(50) NOT NULL,
REALESTATE_CONDITION VARCHAR(40) NOT NULL,
REALESTATE_AREA NUMBER(5,4) NOT NULL,
FLOORS VARCHAR2(20) NOT NULL,
ROOMS_COUNT NUMBER(3) NOT NULL,
TOILET_COUNT NUMBER(3) NOT NULL,
REALESTATE_SALEPRICE NUMBER(20) NOT NULL,
REALESTATE_MONTHLY NUMBER(10),
REALESTATE_MAINTENANCE_COST NUMBER(10),
AVAILABLE_MOVE_IN_DATE DATE NOT NULL,
PARKING_COUNT NUMBER(5),
REALESTATE_OPTIION VARCHAR2(255),
REALESTATE_PHOTOS VARCHAR2(255),
OTHER_COMMENT VARCHAR(255),
REALESTATE_DATE DATE,
FOREIGN KEY(INTERMEDIARY_ID) REFERENCES INTERMEDIARY(INTERMEDIARY_ID) ON DELETE CASCADE
);
CREATE SEQUENCE USERINFO_seq
 START WITH 1
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;
 CREATE OR REPLACE TRIGGER USERINFO_TRIGGER
 BEFORE INSERT ON USERINFO
 FOR EACH ROW
 BEGIN
    SELECT USERINFO_SEQ.NEXTVAL
    INTO:NEW.USER_ID
    FROM DUAL;
END;
/
CREATE SEQUENCE INTERMEDIARY_SEQ
 START WITH 1
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;
 CREATE OR REPLACE TRIGGER INTERMEDIARY_TRIGGER
 BEFORE INSERT ON INTERMEDIARY
 FOR EACH ROW
 BEGIN
    SELECT INTERMEDIARY_seq.NEXTVAL
    INTO:NEW.INTERMEDIARY_ID
    FROM DUAL;
END;
/
CREATE SEQUENCE REALESTATEINFO_SEQ
 START WITH 1
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;
 CREATE OR REPLACE TRIGGER REALESTATEINFO_TRIGGER
 BEFORE INSERT ON REALESTATEINFO
 FOR EACH ROW
 BEGIN
    SELECT REALESTATEINFO_SEQ.NEXTVAL
    INTO:NEW.REALESTATE_ID
    FROM DUAL;
END;
/






