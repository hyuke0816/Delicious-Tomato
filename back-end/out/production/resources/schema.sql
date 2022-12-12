-- Table , 시퀀스 등 구조 정의
DROP SEQUENCE SQ_DEPT;
CREATE SEQUENCE SQ_DEPT START WITH 50 INCREMENT BY 10;

DROP SEQUENCE SQ_EMP;
CREATE SEQUENCE SQ_EMP START WITH 8000 INCREMENT BY 1;

DROP SEQUENCE SQ_CUSTOMER;
CREATE SEQUENCE SQ_CUSTOMER START WITH 1 INCREMENT BY 1;

DROP SEQUENCE SQ_RESERVE;
CREATE SEQUENCE SQ_RESERVE START WITH 1 INCREMENT BY 1;

DROP SEQUENCE SQ_FILE;
CREATE SEQUENCE SQ_FILE START WITH 1 INCREMENT BY 1;

DROP SEQUENCE SQ_GALLERY;
CREATE SEQUENCE SQ_GALLERY START WITH 1 INCREMENT BY 1;

DROP SEQUENCE SQ_TUTORIAL;
CREATE SEQUENCE SQ_TUTORIAL START WITH 1 INCREMENT BY 1;

---------------------- 팀플에 필요한 테이블만 따로 빼놨음

DROP SEQUENCE SQ_QNA;
CREATE SEQUENCE SQ_QNA START WITH 1 INCREMENT BY 1;

DROP SEQUENCE SQ_FAQ;
CREATE SEQUENCE SQ_FAQ START WITH 1 INCREMENT BY 1;

DROP SEQUENCE SQ_DINER;
CREATE SEQUENCE SQ_DINER START WITH 1 INCREMENT BY 1;

DROP TABLE TB_EMP CASCADE CONSTRAINT;
DROP TABLE TB_DEPT CASCADE CONSTRAINT;
DROP TABLE TB_CUSTOMER CASCADE CONSTRAINT;
DROP TABLE TB_RESERVE CASCADE CONSTRAINT;

DROP TABLE TB_FILE CASCADE CONSTRAINT;
DROP TABLE TB_GALLERY CASCADE CONSTRAINT;
DROP TABLE TB_TUTORIAL CASCADE CONSTRAINT;

---------------------- 팀플에 필요한 테이블만 따로 빼놨음
DROP TABLE TB_QNA CASCADE CONSTRAINT;
DROP TABLE TB_FAQ CASCADE CONSTRAINT;
DROP TABLE TB_DINER CASCADE CONSTRAINT;


CREATE TABLE TB_DEPT
(
    DNO         NUMBER NOT NULL PRIMARY KEY,
    DNAME       VARCHAR2(255),
    LOC         VARCHAR2(255),
    DELETE_YN   VARCHAR2(1) DEFAULT 'N',
    INSERT_TIME VARCHAR2(255),
    UPDATE_TIME VARCHAR2(255),
    DELETE_TIME VARCHAR2(255)
);

CREATE TABLE TB_EMP
(
    ENO         NUMBER NOT NULL PRIMARY KEY,
    ENAME       VARCHAR2(255),
    JOB         VARCHAR2(255),
    MANAGER     NUMBER,
    HIREDATE    VARCHAR2(255),
    SALARY      NUMBER,
    COMMISSION  NUMBER,
    DNO         NUMBER,
    DELETE_YN   VARCHAR2(1) DEFAULT 'N',
    INSERT_TIME VARCHAR2(255),
    UPDATE_TIME VARCHAR2(255),
    DELETE_TIME VARCHAR2(255)
);

CREATE TABLE TB_CUSTOMER
(
    CID         NUMBER NOT NULL PRIMARY KEY,
    FIRST_NAME  VARCHAR2(255),
    LAST_NAME   VARCHAR2(255),
    EMAIL       VARCHAR2(255),
    PHONE       VARCHAR2(255),
    DELETE_YN   VARCHAR2(1) DEFAULT 'N',
    INSERT_TIME VARCHAR2(255),
    UPDATE_TIME VARCHAR2(255),
    DELETE_TIME VARCHAR2(255)
);

-- Upload Table
CREATE TABLE TB_FILE
(
    FID          NUMBER NOT NULL PRIMARY KEY,
    FILE_TITLE   VARCHAR2(1000),
    FILE_CONTENT VARCHAR2(1000),
    FILE_NAME    VARCHAR2(1000),
    FILE_TYPE    VARCHAR2(1000),
    FILE_DATA    BLOB,
    DELETE_YN    VARCHAR2(1) DEFAULT 'N',
    INSERT_TIME  VARCHAR2(255),
    UPDATE_TIME  VARCHAR2(255),
    DELETE_TIME  VARCHAR2(255)
);

-- Upload Gallery Table
CREATE TABLE TB_GALLERY
(
    GID                  NUMBER NOT NULL PRIMARY KEY,
    GALLERY_TITLE        VARCHAR2(1000),
    GALLERY_FILE_NAME    VARCHAR2(1000),
    GALLERY_TYPE         VARCHAR2(1000),
    GALLERY_DATA         BLOB,
    DELETE_YN            VARCHAR2(1) DEFAULT 'N',
    INSERT_TIME          VARCHAR2(255),
    UPDATE_TIME          VARCHAR2(255),
    DELETE_TIME          VARCHAR2(255)
);

-- Upload TB_TUTORIAL Excel Table
CREATE TABLE TB_TUTORIAL
(
    ID                   NUMBER NOT NULL PRIMARY KEY,
    TITLE                VARCHAR2(1000),
    DESCRIPTION          VARCHAR2(1000),
    PUBLISHED            VARCHAR2(1000),
    DELETE_YN            VARCHAR2(1) DEFAULT 'N',
    INSERT_TIME          VARCHAR2(255),
    UPDATE_TIME          VARCHAR2(255),
    DELETE_TIME          VARCHAR2(255)
);

-- 예약 테이블
CREATE TABLE TB_RESERVE
(
    RID                  NUMBER NOT NULL PRIMARY KEY,
    EMAIL                VARCHAR2(1000),
    FIRST_NAME           VARCHAR2(1000),
    LAST_NAME            VARCHAR2(1000),
    SIGHTS               VARCHAR2(1000), -- 관광지
    START_DATE           VARCHAR2(1000), -- 시작날짜
    END_DATE             VARCHAR2(1000), -- 종료날짜
    RESERVATION_YN       VARCHAR2(1) DEFAULT 'N', -- 예약 유무
    ADDRESS              VARCHAR2(1000), -- 주소
    PHONE                VARCHAR2(1000), -- 전화번호
    DELETE_YN            VARCHAR2(1) DEFAULT 'N',
    INSERT_TIME          VARCHAR2(255),
    UPDATE_TIME          VARCHAR2(255),
    DELETE_TIME          VARCHAR2(255)
);

---------------------- 팀플에 필요한 테이블만 따로 빼놨음

CREATE TABLE TB_FAQ
(
    FNO          NUMBER NOT NULL PRIMARY KEY,
    TITLE       VARCHAR2(255),
    CONTENT     VARCHAR2(255),
    DELETE_YN   VARCHAR2(1) DEFAULT 'N',
    INSERT_TIME VARCHAR2(255),
    UPDATE_TIME VARCHAR2(255),
    DELETE_TIME VARCHAR2(255)
);

CREATE TABLE TB_QNA
(
    QNO         NUMBER NOT NULL PRIMARY KEY,
    QUESTION    VARCHAR2(255),
    ANSWER      VARCHAR2(255),
    QUESTIONER  VARCHAR2(255),
    ANSWERER    VARCHAR2(255),
    EMAIL       VARCHAR2(255),
    DELETE_YN   VARCHAR2(1) DEFAULT 'N',
    INSERT_TIME VARCHAR2(255),
    UPDATE_TIME VARCHAR2(255),
    DELETE_TIME VARCHAR2(255)
);

CREATE TABLE TB_DINER
(
    SNO         NUMBER NOT NULL PRIMARY KEY,
    SNAME       VARCHAR2(255),
    SCORE       VARCHAR2(255),
    LOC         VARCHAR2(255),
    PHONE       VARCHAR2(255),
    MENU        VARCHAR2(255),
    REVIEW      VARCHAR2(255),
    DELETE_YN   VARCHAR2(1) DEFAULT 'N',
    INSERT_TIME VARCHAR2(255),
    UPDATE_TIME VARCHAR2(255),
    DELETE_TIME VARCHAR2(255)
    );

-- TODO: login 관련 테이블/시퀀스
DROP SEQUENCE SQ_USER;
CREATE SEQUENCE SQ_USER
    INCREMENT BY 1 START WITH 1
    MINVALUE 1
    MAXVALUE 99999999;

DROP SEQUENCE SQ_ROLE;
CREATE SEQUENCE SQ_ROLE
    INCREMENT BY 1 START WITH 1
    MINVALUE 1
    MAXVALUE 99999999;

DROP TABLE TB_USER CASCADE CONSTRAINTS;
DROP TABLE TB_ROLE CASCADE CONSTRAINTS;
DROP TABLE TB_USER_ROLE CASCADE CONSTRAINTS;

-- 유저 테이블
CREATE TABLE TB_USER(
                        ID NUMBER NOT NULL PRIMARY KEY,
                        EMAIL VARCHAR2(1000),
                        PASSWORD VARCHAR2(1000),
                        USERNAME VARCHAR2(1000),
                        DELETE_YN   VARCHAR2(1) DEFAULT 'N',
                        INSERT_TIME VARCHAR2(255),
                        UPDATE_TIME VARCHAR2(255),
                        DELETE_TIME VARCHAR2(255)
);
-- 역할 테이블 : ROLE_USER, ROLE_ADMIN
CREATE TABLE TB_ROLE(
                        RID NUMBER NOT NULL PRIMARY KEY,
                        NAME VARCHAR2(1000) UNIQUE,
                        DELETE_YN   VARCHAR2(1) DEFAULT 'N',
                        INSERT_TIME VARCHAR2(255),
                        UPDATE_TIME VARCHAR2(255),
                        DELETE_TIME VARCHAR2(255)
);
-- 매핑테이블 : TB_USER vs TB_ROLE 연결시켜주는 테이블 ( Many To Many 관계에서 사용 )
CREATE TABLE TB_USER_ROLE (
                              USER_ID NUMBER NOT NULL,
                              ROLE_ID NUMBER NOT NULL,
                              PRIMARY KEY (USER_ID, ROLE_ID) -- 복합키 ( 속성 2이상을 조합해서 기본키로 만드는것 )
);

COMMIT;








