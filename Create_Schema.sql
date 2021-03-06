DROP TABLE FEEDBACK CASCADE CONSTRAINTS ;

DROP TABLE FEEDBACK_RESPONSES CASCADE CONSTRAINTS ;

DROP TABLE ORGANISATIONS CASCADE CONSTRAINTS ;

DROP TABLE ORG_QUESTIONS CASCADE CONSTRAINTS ;

DROP TABLE QUESTIONS CASCADE CONSTRAINTS ;

DROP TABLE SURVEY CASCADE CONSTRAINTS ;

DROP TABLE SURVEY_FEEDBACK CASCADE CONSTRAINTS ;

DROP TABLE SURVEY_QUESTIONS CASCADE CONSTRAINTS ;

DROP TABLE "USER" CASCADE CONSTRAINTS ;

DROP TABLE USER_FEEDBACK CASCADE CONSTRAINTS ;

CREATE TABLE FEEDBACK
  (
    FEEDBACK_ID    NUMBER (10) NOT NULL ,
    FEEDBACK_DATE  DATE ,
    IS_ANONYMOUS   CHAR (1) ,
    FEEDBACK_SCORE NUMBER (2)
  ) ;
ALTER TABLE FEEDBACK ADD CONSTRAINT FEEDBACK_PK PRIMARY KEY ( FEEDBACK_ID ) ;


CREATE TABLE FEEDBACK_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,FEEDBACK_ID NUMBER (10) NOT NULL
 ,FEEDBACK_DATE DATE
 ,IS_ANONYMOUS CHAR (1)
 ,FEEDBACK_SCORE NUMBER (2)
 );

CREATE OR REPLACE TRIGGER FEEDBACK_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON FEEDBACK for each row 
 Declare 
  rec FEEDBACK_JN%ROWTYPE; 
  blank FEEDBACK_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.FEEDBACK_ID := :NEW.FEEDBACK_ID; 
      rec.FEEDBACK_DATE := :NEW.FEEDBACK_DATE; 
      rec.IS_ANONYMOUS := :NEW.IS_ANONYMOUS; 
      rec.FEEDBACK_SCORE := :NEW.FEEDBACK_SCORE; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.FEEDBACK_ID := :OLD.FEEDBACK_ID; 
      rec.FEEDBACK_DATE := :OLD.FEEDBACK_DATE; 
      rec.IS_ANONYMOUS := :OLD.IS_ANONYMOUS; 
      rec.FEEDBACK_SCORE := :OLD.FEEDBACK_SCORE; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into FEEDBACK_JN VALUES rec; 
  END; 
  /
CREATE TABLE FEEDBACK_RESPONSES
  (
    FEEDBACK_ID NUMBER (10) NOT NULL ,
    QUESTION_ID NUMBER (10) NOT NULL ,
    RESPONSE    NUMBER (2)
  ) ;
ALTER TABLE FEEDBACK_RESPONSES ADD CONSTRAINT FEEDBACK_RESPONSES_PK PRIMARY KEY ( FEEDBACK_ID, QUESTION_ID ) ;


CREATE TABLE FEEDBACK_RESPONSES_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,FEEDBACK_ID NUMBER (10) NOT NULL
 ,QUESTION_ID NUMBER (10) NOT NULL
 ,RESPONSE NUMBER (2)
 );

CREATE OR REPLACE TRIGGER FEEDBACK_RESPONSES_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON FEEDBACK_RESPONSES for each row 
 Declare 
  rec FEEDBACK_RESPONSES_JN%ROWTYPE; 
  blank FEEDBACK_RESPONSES_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.FEEDBACK_ID := :NEW.FEEDBACK_ID; 
      rec.QUESTION_ID := :NEW.QUESTION_ID; 
      rec.RESPONSE := :NEW.RESPONSE; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.FEEDBACK_ID := :OLD.FEEDBACK_ID; 
      rec.QUESTION_ID := :OLD.QUESTION_ID; 
      rec.RESPONSE := :OLD.RESPONSE; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into FEEDBACK_RESPONSES_JN VALUES rec; 
  END; 
  /
CREATE TABLE ORGANISATIONS
  (
    ORG_ID   NUMBER (10) NOT NULL ,
    ORG_NAME VARCHAR2 (50) ,
    ORG_CODE VARCHAR2 (3)
  ) ;
ALTER TABLE ORGANISATIONS ADD CONSTRAINT ORGANISATIONS_PK PRIMARY KEY ( ORG_ID ) ;


CREATE TABLE ORGANISATIONS_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,ORG_ID NUMBER (10) NOT NULL
 ,ORG_NAME VARCHAR2 (50)
 ,ORG_CODE VARCHAR2 (3)
 );

CREATE OR REPLACE TRIGGER ORGANISATIONS_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON ORGANISATIONS for each row 
 Declare 
  rec ORGANISATIONS_JN%ROWTYPE; 
  blank ORGANISATIONS_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.ORG_ID := :NEW.ORG_ID; 
      rec.ORG_NAME := :NEW.ORG_NAME; 
      rec.ORG_CODE := :NEW.ORG_CODE; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.ORG_ID := :OLD.ORG_ID; 
      rec.ORG_NAME := :OLD.ORG_NAME; 
      rec.ORG_CODE := :OLD.ORG_CODE; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into ORGANISATIONS_JN VALUES rec; 
  END; 
  /
CREATE TABLE ORG_QUESTIONS
  (
    ORG_ID      NUMBER (10) NOT NULL ,
    QUESTION_ID NUMBER (10) NOT NULL
  ) ;
ALTER TABLE ORG_QUESTIONS ADD CONSTRAINT ORG_QUESTIONS_PK PRIMARY KEY ( ORG_ID, QUESTION_ID ) ;


CREATE TABLE ORG_QUESTIONS_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,ORG_ID NUMBER (10) NOT NULL
 ,QUESTION_ID NUMBER (10) NOT NULL
 );

CREATE OR REPLACE TRIGGER ORG_QUESTIONS_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON ORG_QUESTIONS for each row 
 Declare 
  rec ORG_QUESTIONS_JN%ROWTYPE; 
  blank ORG_QUESTIONS_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.ORG_ID := :NEW.ORG_ID; 
      rec.QUESTION_ID := :NEW.QUESTION_ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.ORG_ID := :OLD.ORG_ID; 
      rec.QUESTION_ID := :OLD.QUESTION_ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into ORG_QUESTIONS_JN VALUES rec; 
  END; 
  /
CREATE TABLE QUESTIONS
  (
    QUESTION_ID       NUMBER (10) NOT NULL ,
    QUESTION          VARCHAR2 (100) ,
    QUESTION_CATEGORY VARCHAR2 (30) ,
    QUESTION_TYPE     VARCHAR2 (10)
  ) ;
ALTER TABLE QUESTIONS ADD CONSTRAINT QUESTIONS_PK PRIMARY KEY ( QUESTION_ID ) ;


CREATE TABLE QUESTIONS_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,QUESTION_ID NUMBER (10) NOT NULL
 ,QUESTION VARCHAR2 (100)
 ,QUESTION_CATEGORY VARCHAR2 (30)
 ,QUESTION_TYPE VARCHAR2 (10)
 );

CREATE OR REPLACE TRIGGER QUESTIONS_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON QUESTIONS for each row 
 Declare 
  rec QUESTIONS_JN%ROWTYPE; 
  blank QUESTIONS_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.QUESTION_ID := :NEW.QUESTION_ID; 
      rec.QUESTION := :NEW.QUESTION; 
      rec.QUESTION_CATEGORY := :NEW.QUESTION_CATEGORY; 
      rec.QUESTION_TYPE := :NEW.QUESTION_TYPE; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.QUESTION_ID := :OLD.QUESTION_ID; 
      rec.QUESTION := :OLD.QUESTION; 
      rec.QUESTION_CATEGORY := :OLD.QUESTION_CATEGORY; 
      rec.QUESTION_TYPE := :OLD.QUESTION_TYPE; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into QUESTIONS_JN VALUES rec; 
  END; 
  /
CREATE TABLE SURVEY
  (
    SURVEY_ID   NUMBER (10) NOT NULL ,
    RECIPIENT   NUMBER (10) NOT NULL ,
    SURVEY_NAME VARCHAR2 (30) ,
    SURVEY_TYPE VARCHAR2 (10)
  ) ;
ALTER TABLE SURVEY ADD CONSTRAINT SURVEY_PK PRIMARY KEY ( SURVEY_ID ) ;


CREATE TABLE SURVEY_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,SURVEY_ID NUMBER (10) NOT NULL
 ,RECIPIENT NUMBER (10) NOT NULL
 ,SURVEY_NAME VARCHAR2 (30)
 ,SURVEY_TYPE VARCHAR2 (10)
 );

CREATE OR REPLACE TRIGGER SURVEY_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON SURVEY for each row 
 Declare 
  rec SURVEY_JN%ROWTYPE; 
  blank SURVEY_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.SURVEY_ID := :NEW.SURVEY_ID; 
      rec.RECIPIENT := :NEW.RECIPIENT; 
      rec.SURVEY_NAME := :NEW.SURVEY_NAME; 
      rec.SURVEY_TYPE := :NEW.SURVEY_TYPE; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.SURVEY_ID := :OLD.SURVEY_ID; 
      rec.RECIPIENT := :OLD.RECIPIENT; 
      rec.SURVEY_NAME := :OLD.SURVEY_NAME; 
      rec.SURVEY_TYPE := :OLD.SURVEY_TYPE; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into SURVEY_JN VALUES rec; 
  END; 
  /
CREATE TABLE SURVEY_FEEDBACK
  (
    SURVEY_ID   NUMBER (10) NOT NULL ,
    FEEDBACK_ID NUMBER (10) NOT NULL
  ) ;
ALTER TABLE SURVEY_FEEDBACK ADD CONSTRAINT SURVEY_FEEDBACK_PK PRIMARY KEY ( SURVEY_ID, FEEDBACK_ID ) ;


CREATE TABLE SURVEY_FEEDBACK_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,SURVEY_ID NUMBER (10) NOT NULL
 ,FEEDBACK_ID NUMBER (10) NOT NULL
 );

CREATE OR REPLACE TRIGGER SURVEY_FEEDBACK_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON SURVEY_FEEDBACK for each row 
 Declare 
  rec SURVEY_FEEDBACK_JN%ROWTYPE; 
  blank SURVEY_FEEDBACK_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.SURVEY_ID := :NEW.SURVEY_ID; 
      rec.FEEDBACK_ID := :NEW.FEEDBACK_ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.SURVEY_ID := :OLD.SURVEY_ID; 
      rec.FEEDBACK_ID := :OLD.FEEDBACK_ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into SURVEY_FEEDBACK_JN VALUES rec; 
  END; 
  /
CREATE TABLE SURVEY_QUESTIONS
  (
    SURVEY_ID   NUMBER (10) NOT NULL ,
    QUESTION_ID NUMBER (10) NOT NULL
  ) ;
ALTER TABLE SURVEY_QUESTIONS ADD CONSTRAINT SURVEY_QUESTIONS_PK PRIMARY KEY ( SURVEY_ID, QUESTION_ID ) ;


CREATE TABLE SURVEY_QUESTIONS_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,SURVEY_ID NUMBER (10) NOT NULL
 ,QUESTION_ID NUMBER (10) NOT NULL
 );

CREATE OR REPLACE TRIGGER SURVEY_QUESTIONS_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON SURVEY_QUESTIONS for each row 
 Declare 
  rec SURVEY_QUESTIONS_JN%ROWTYPE; 
  blank SURVEY_QUESTIONS_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.SURVEY_ID := :NEW.SURVEY_ID; 
      rec.QUESTION_ID := :NEW.QUESTION_ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.SURVEY_ID := :OLD.SURVEY_ID; 
      rec.QUESTION_ID := :OLD.QUESTION_ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into SURVEY_QUESTIONS_JN VALUES rec; 
  END; 
  /
CREATE TABLE "USER"
  (
    USER_ID   NUMBER (10) NOT NULL ,
    USER_NAME VARCHAR2 (100) ,
    ORG_ID    NUMBER (10) NOT NULL ,
    DOB       DATE
  ) ;
ALTER TABLE "USER" ADD CONSTRAINT USER_PK PRIMARY KEY ( USER_ID ) ;


CREATE TABLE USER_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,USER_ID NUMBER (10) NOT NULL
 ,USER_NAME VARCHAR2 (100)
 ,ORG_ID NUMBER (10) NOT NULL
 ,DOB DATE
 );

CREATE OR REPLACE TRIGGER USER_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON USER for each row 
 Declare 
  rec USER_JN%ROWTYPE; 
  blank USER_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.USER_ID := :NEW.USER_ID; 
      rec.USER_NAME := :NEW.USER_NAME; 
      rec.ORG_ID := :NEW.ORG_ID; 
      rec.DOB := :NEW.DOB; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.USER_ID := :OLD.USER_ID; 
      rec.USER_NAME := :OLD.USER_NAME; 
      rec.ORG_ID := :OLD.ORG_ID; 
      rec.DOB := :OLD.DOB; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into USER_JN VALUES rec; 
  END; 
  /
CREATE TABLE USER_FEEDBACK
  (
    FEEDBACK_ID NUMBER (10) NOT NULL ,
    SUBMITTER   NUMBER (10) NOT NULL
  ) ;
ALTER TABLE USER_FEEDBACK ADD CONSTRAINT USER_FEEDBACK_PK PRIMARY KEY ( FEEDBACK_ID, SUBMITTER ) ;


CREATE TABLE USER_FEEDBACK_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,FEEDBACK_ID NUMBER (10) NOT NULL
 ,SUBMITTER NUMBER (10) NOT NULL
 );

CREATE OR REPLACE TRIGGER USER_FEEDBACK_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON USER_FEEDBACK for each row 
 Declare 
  rec USER_FEEDBACK_JN%ROWTYPE; 
  blank USER_FEEDBACK_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.FEEDBACK_ID := :NEW.FEEDBACK_ID; 
      rec.SUBMITTER := :NEW.SUBMITTER; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.FEEDBACK_ID := :OLD.FEEDBACK_ID; 
      rec.SUBMITTER := :OLD.SUBMITTER; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into USER_FEEDBACK_JN VALUES rec; 
  END; 
  /
ALTER TABLE FEEDBACK_RESPONSES ADD CONSTRAINT FEEDBACK_RESPONSES_FEEDBACK_FK FOREIGN KEY ( FEEDBACK_ID ) REFERENCES FEEDBACK ( FEEDBACK_ID ) ;

ALTER TABLE ORG_QUESTIONS ADD CONSTRAINT ORG_QUESTIONS_ORGANISATIONS_FK FOREIGN KEY ( ORG_ID ) REFERENCES ORGANISATIONS ( ORG_ID ) ;

ALTER TABLE ORG_QUESTIONS ADD CONSTRAINT ORG_QUESTIONS_QUESTIONS_FK FOREIGN KEY ( QUESTION_ID ) REFERENCES QUESTIONS ( QUESTION_ID ) ;

ALTER TABLE SURVEY_FEEDBACK ADD CONSTRAINT SURVEY_FEEDBACK_FEEDBACK_FK FOREIGN KEY ( FEEDBACK_ID ) REFERENCES FEEDBACK ( FEEDBACK_ID ) ;

ALTER TABLE SURVEY_FEEDBACK ADD CONSTRAINT SURVEY_FEEDBACK_SURVEY_FK FOREIGN KEY ( SURVEY_ID ) REFERENCES SURVEY ( SURVEY_ID ) ;

ALTER TABLE SURVEY_QUESTIONS ADD CONSTRAINT SURVEY_QUESTIONS_QUESTIONS_FK FOREIGN KEY ( QUESTION_ID ) REFERENCES QUESTIONS ( QUESTION_ID ) ;

ALTER TABLE SURVEY_QUESTIONS ADD CONSTRAINT SURVEY_QUESTIONS_SURVEY_FK FOREIGN KEY ( SURVEY_ID ) REFERENCES SURVEY ( SURVEY_ID ) ;

ALTER TABLE SURVEY ADD CONSTRAINT SURVEY_USER_FK FOREIGN KEY ( RECIPIENT ) REFERENCES "USER" ( USER_ID ) ;

ALTER TABLE USER_FEEDBACK ADD CONSTRAINT USER_FEEDBACK_FEEDBACK_FK FOREIGN KEY ( FEEDBACK_ID ) REFERENCES FEEDBACK ( FEEDBACK_ID ) ;

ALTER TABLE USER_FEEDBACK ADD CONSTRAINT USER_FEEDBACK_USER_FK FOREIGN KEY ( SUBMITTER ) REFERENCES "USER" ( USER_ID ) ;

ALTER TABLE "USER" ADD CONSTRAINT USER_ORGANISATIONS_FK FOREIGN KEY ( ORG_ID ) REFERENCES ORGANISATIONS ( ORG_ID ) ;
