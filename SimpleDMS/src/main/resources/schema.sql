-- Table , 시퀀스 등 구조 정의
DROP SEQUENCE SQ_FAQ;
CREATE SEQUENCE SQ_FAQ START WITH 1 INCREMENT BY 1;

DROP SEQUENCE SQ_QNA;
CREATE SEQUENCE SQ_QNA START WITH 1 INCREMENT BY 1;

DROP SEQUENCE SQ_QUESTION;
CREATE SEQUENCE SQ_QUESTION START WITH 1 INCREMENT BY 1;

DROP SEQUENCE SQ_COMMENT;
CREATE SEQUENCE SQ_COMMENT START WITH 1 INCREMENT BY 1;

DROP SEQUENCE SQ_RESERVATION;
CREATE SEQUENCE SQ_RESERVATION START WITH 1 INCREMENT BY 1;

DROP SEQUENCE SQ_ANNOUNCE;
CREATE SEQUENCE SQ_ANNOUNCE START WITH 1 INCREMENT BY 1;

DROP SEQUENCE SQ_FREE;
CREATE SEQUENCE SQ_FREE START WITH 1 INCREMENT BY 1;

DROP SEQUENCE SQ_PROFILE;
CREATE SEQUENCE SQ_PROFILE START WITH 1 INCREMENT BY 1;

DROP SEQUENCE SQ_REVIEW;
CREATE SEQUENCE SQ_REVIEW START WITH 1 INCREMENT BY 1;

DROP SEQUENCE SQ_DINER;
CREATE SEQUENCE SQ_DINER START WITH 1 INCREMENT BY 1;

DROP SEQUENCE SQ_MENU;
CREATE SEQUENCE SQ_MENU START WITH 1 INCREMENT BY 1;

DROP SEQUENCE SQ_SCORE;
CREATE SEQUENCE SQ_SCORE START WITH 1 INCREMENT BY 1;

DROP SEQUENCE SQ_COLUMN;
CREATE SEQUENCE SQ_COLUMN START WITH 1 INCREMENT BY 1;

DROP SEQUENCE SQ_GALLERY;
CREATE SEQUENCE SQ_GALLERY START WITH 1 INCREMENT BY 1;

DROP SEQUENCE SQ_FAVORITE;
CREATE SEQUENCE SQ_FAVORITE START WITH 1 INCREMENT BY 1;

DROP SEQUENCE SQ_LASTVIEW;
CREATE SEQUENCE SQ_LASTVIEW START WITH 1 INCREMENT BY 1;



DROP TABLE TB_FAQ CASCADE CONSTRAINTS;
DROP TABLE TB_QUESTION CASCADE CONSTRAINTS;
DROP TABLE TB_COMMENT CASCADE CONSTRAINTS;
DROP TABLE TB_RESERVATION CASCADE CONSTRAINTS;
DROP TABLE TB_ANNOUNCE CASCADE CONSTRAINTS;
DROP TABLE TB_FREE CASCADE CONSTRAINTS;
DROP TABLE TB_PROFILE CASCADE CONSTRAINTS;
DROP TABLE TB_REVIEW CASCADE CONSTRAINTS;
DROP TABLE TB_DINER CASCADE CONSTRAINTS;
DROP TABLE TB_MENU CASCADE CONSTRAINTS;
DROP TABLE TB_SCORE CASCADE CONSTRAINTS;
DROP TABLE TB_COLUMN CASCADE CONSTRAINTS;
DROP TABLE TB_GALLERY CASCADE CONSTRAINTS;
DROP TABLE TB_FAVORITE CASCADE CONSTRAINTS;
DROP TABLE TB_LASTVIEW CASCADE CONSTRAINTS;






CREATE TABLE TB_DINER
(
    DNO         NUMBER NOT NULL PRIMARY KEY,
    DNAME       VARCHAR2(255),
    SCORE       VARCHAR2(255),
    LOC         VARCHAR2(255),
    PHONE       VARCHAR2(255),
    MENU        VARCHAR2(255),
    THEME       VARCHAR2(255),
    REVIEW      VARCHAR2(255),
    MAINPHOTO   VARCHAR2(2000), -- 리스트에서 보이는 사진
    PHOTO1      VARCHAR2(2000), -- 디테일 사진1
    PHOTO2      VARCHAR2(2000), -- 디테일 사진2
    PHOTO3      VARCHAR2(2000), -- 디테일 사진3
    LAT         NUMBER,
    LNG         NUMBER,
    VIEWS       NUMBER DEFAULT '0',
    DNO_COUNT   NUMBER DEFAULT '0',
    DELETE_YN   VARCHAR2(1) DEFAULT 'N',
    INSERT_TIME VARCHAR2(255),
    UPDATE_TIME VARCHAR2(255),
    DELETE_TIME VARCHAR2(255)
);


CREATE TABLE TB_FAQ
(
    NO          NUMBER NOT NULL PRIMARY KEY,
    TITLE       VARCHAR2(255),
    CONTENT     VARCHAR2(3000),
    DELETE_YN   VARCHAR2(1) DEFAULT 'N',
    INSERT_TIME VARCHAR2(255),
    UPDATE_TIME VARCHAR2(255),
    DELETE_TIME VARCHAR2(255)
);

-- TODO: 질문 테이블
CREATE TABLE TB_QUESTION
(
    QNO         NUMBER NOT NULL PRIMARY KEY,
    TITLE       VARCHAR2(255),
    CONTENT     VARCHAR2(255),
    ID          NUMBER, -- 유저 id 컬럼
    VIEWS       NUMBER DEFAULT 0,
    WRITER      VARCHAR2(255),
    DELETE_YN   VARCHAR2(1) DEFAULT 'N',
    INSERT_TIME VARCHAR2(255),
    UPDATE_TIME VARCHAR2(255),
    DELETE_TIME VARCHAR2(255)
);
-- TODO: 게시판 댓글 테이블
CREATE TABLE TB_COMMENT
(
    CNO         NUMBER NOT NULL PRIMARY KEY,
    QNO         NUMBER, -- 질문테이블 조인용 공통 컬럼
    FNO         NUMBER, -- 자유게시판 조인용 공통 컬럼
    ID          NUMBER, -- 유저 id 컬럼
    WRITER      VARCHAR2(255),
    CONTENT     VARCHAR2(255),
    DELETE_YN   VARCHAR2(1) DEFAULT 'N',
    INSERT_TIME VARCHAR2(255),
    UPDATE_TIME VARCHAR2(255),
    DELETE_TIME VARCHAR2(255)
);

CREATE TABLE TB_ANNOUNCE
(
    AID         NUMBER NOT NULL PRIMARY KEY,
    TITLE       VARCHAR2(255),
    CONTENT     VARCHAR2(4000),
    WRITER      VARCHAR2(255),
    VIEWS       NUMBER DEFAULT 0,
    DELETE_YN   VARCHAR2(1) DEFAULT 'N',
    INSERT_TIME VARCHAR2(255),
    UPDATE_TIME VARCHAR2(255),
    DELETE_TIME VARCHAR2(255)
);

CREATE TABLE TB_FREE
(
    FNO               NUMBER NOT NULL PRIMARY KEY,
    ID                NUMBER, -- 유저id컬럼
    WRITER            VARCHAR2(1000),
    TITLE             VARCHAR2(1000),
    CONTENT           VARCHAR2(4000),
    GALLERY_TITLE     VARCHAR2(1000),
    GALLERY_FILE_NAME VARCHAR2(1000),
    GALLERY_TYPE      VARCHAR2(1000),
    BLOB_FILE         BLOB,
    VIEWS             NUMBER DEFAULT 0,
    DELETE_YN         VARCHAR2(1) DEFAULT 'N',
    INSERT_TIME       VARCHAR2(255),
    UPDATE_TIME       VARCHAR2(255),
    DELETE_TIME       VARCHAR2(255)
);

CREATE TABLE TB_PROFILE
(
    PNO               NUMBER NOT NULL PRIMARY KEY,
    ID                NUMBER, -- 유저id컬럼
    IMAGE_FILE_NAME VARCHAR2(1000),
    BLOB_FILE         BLOB,
    DELETE_YN         VARCHAR2(1) DEFAULT 'N',
    INSERT_TIME       VARCHAR2(255),
    UPDATE_TIME       VARCHAR2(255),
    DELETE_TIME       VARCHAR2(255)
);

CREATE TABLE TB_RESERVATION
(
    RID              NUMBER NOT NULL PRIMARY KEY,
    RNAME            VARCHAR2(1000), -- 예약자명
    RCOUNT           NUMBER, -- 인원수
    PHONE            VARCHAR2(1000), -- 전화번호
    DNO              NUMBER, -- 식당번호(조인용 컬럼)
    ID               NUMBER, -- 유저ID
    RDATE            VARCHAR2(1000), -- 예약일자
    RTIME            VARCHAR2(1000), -- 예약시간
    DELETE_YN        VARCHAR2(1) DEFAULT 'N',
    INSERT_TIME      VARCHAR2(255),
    UPDATE_TIME      VARCHAR2(255),
    DELETE_TIME      VARCHAR2(255)
);

CREATE TABLE TB_REVIEW
(
    RNO         NUMBER NOT NULL PRIMARY KEY,
    ID          NUMBER,
    DNO         NUMBER,
    RCONTENT    VARCHAR2(2000),
--     RPHOTO      VARCHAR2(255),
    DELETE_YN   VARCHAR2(1) DEFAULT 'N',
    INSERT_TIME VARCHAR2(255),
    UPDATE_TIME VARCHAR2(255),
    DELETE_TIME VARCHAR2(255)
);


CREATE TABLE TB_MENU
(
    MENU_ID     NUMBER NOT NULL PRIMARY KEY,
    MENU_NAME   VARCHAR2(255),
    MENU_PRICE  VARCHAR2(2000),
    DNO         NUMBER,
    DELETE_YN   VARCHAR2(1) DEFAULT 'N',
    INSERT_TIME VARCHAR2(255),
    UPDATE_TIME VARCHAR2(255),
    DELETE_TIME VARCHAR2(255)
);


CREATE TABLE TB_SCORE
(
    SID         NUMBER NOT NULL PRIMARY KEY,
    TASTE       NUMBER, -- 맛
    SERVICE     NUMBER, -- 서비스
    LOC         NUMBER, -- 접근성
    MOOD        NUMBER, -- 분위기
    COST        NUMBER, -- 가성비
    DNO         NUMBER, -- 조인용
    RNO         NUMBER,
    GENDER      VARCHAR2(1000), -- 성별
    DELETE_YN   VARCHAR2(1) DEFAULT 'N',
    INSERT_TIME VARCHAR2(255),
    UPDATE_TIME VARCHAR2(255),
    DELETE_TIME VARCHAR2(255)
);


CREATE TABLE TB_COLUMN
(
    CID         NUMBER NOT NULL PRIMARY KEY,
    TITLE       VARCHAR2(255),
    CONTENT     VARCHAR2(2000),
    PHOTO       VARCHAR2(255),
    WRITER      VARCHAR2(255),
    ID          NUMBER, -- 글쓴 사람 고유ID값
    VIEWS       NUMBER DEFAULT 0,
    DELETE_YN   VARCHAR2(1) DEFAULT 'N',
    INSERT_TIME VARCHAR2(255),
    UPDATE_TIME VARCHAR2(255),
    DELETE_TIME VARCHAR2(255)
);

CREATE TABLE TB_GALLERY
(
    GID               NUMBER NOT NULL PRIMARY KEY,
    GALLERY_TITLE     VARCHAR2(1000),
    GALLERY_FILE_NAME VARCHAR2(1000),
    GALLERY_TYPE      VARCHAR2(1000),
    GALLERY_DATA      BLOB,
    DELETE_YN         VARCHAR2(1) DEFAULT 'N',
    INSERT_TIME       VARCHAR2(255),
    UPDATE_TIME       VARCHAR2(255),
    DELETE_TIME       VARCHAR2(255)
);

-- Todo: 찜목록 테이블
CREATE TABLE TB_FAVORITE
(
    FID         NUMBER NOT NULL PRIMARY KEY,
    ID          NUMBER, -- 유저id컬럼
    DNO         NUMBER, -- 식당id컬럼
    DELETE_YN   VARCHAR2(1) DEFAULT 'N',
    INSERT_TIME VARCHAR2(255),
    UPDATE_TIME VARCHAR2(255),
    DELETE_TIME VARCHAR2(255)
);

-- Todo: 찜목록 테이블
CREATE TABLE TB_LASTVIEW
(
    LID         NUMBER NOT NULL PRIMARY KEY,
    ID          NUMBER, -- 유저id컬럼
    DNO         NUMBER, -- 식당id컬럼
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
CREATE TABLE TB_USER
(
    ID          NUMBER NOT NULL PRIMARY KEY,
    USERNAME    VARCHAR2(1000),
    EMAIL       VARCHAR2(1000),
    PASSWORD    VARCHAR2(1000),
    NAME        VARCHAR2(1000),
    BIRTHDAY    VARCHAR2(1000),
    GENDER      VARCHAR2(1000),
    PHONE       VARCHAR2(1000),
    ADDRESS     VARCHAR2(1000),
    DELETE_YN   VARCHAR2(1) DEFAULT 'N',
    INSERT_TIME VARCHAR2(255),
    UPDATE_TIME VARCHAR2(255),
    DELETE_TIME VARCHAR2(255)
);
-- 역할 테이블 : ROLE_USER, ROLE_ADMIN
CREATE TABLE TB_ROLE
(
    RID         NUMBER NOT NULL PRIMARY KEY,
    RNAME       VARCHAR2(1000) UNIQUE,
    DELETE_YN   VARCHAR2(1) DEFAULT 'N',
    INSERT_TIME VARCHAR2(255),
    UPDATE_TIME VARCHAR2(255),
    DELETE_TIME VARCHAR2(255)
);
-- 매핑테이블 : TB_USER vs TB_ROLE 연결시켜주는 테이블 ( Many To Many 관계에서 사용 )
CREATE TABLE TB_USER_ROLE
(
    USER_ID NUMBER NOT NULL,
    ROLE_ID NUMBER NOT NULL,
    PRIMARY KEY (USER_ID, ROLE_ID) -- 복합키 ( 속성 2이상을 조합해서 기본키로 만드는것 )
);
--
-- DROP SEQUENCE SQ_USER;
-- CREATE SEQUENCE SQ_USER
--     INCREMENT BY 1 START WITH 1
--     MINVALUE 1
--     MAXVALUE 99999999;
--
-- DROP SEQUENCE SQ_ROLE;
-- CREATE SEQUENCE SQ_ROLE
--     INCREMENT BY 1 START WITH 1
--     MINVALUE 1
--     MAXVALUE 99999999;
--
-- DROP TABLE TB_USER CASCADE CONSTRAINTS;
-- DROP TABLE TB_ROLE CASCADE CONSTRAINTS;
-- DROP TABLE TB_USER_ROLE CASCADE CONSTRAINTS;
--
-- -- 유저 테이블
-- CREATE TABLE TB_USER(
--                         ID NUMBER NOT NULL PRIMARY KEY,
--                         EMAIL VARCHAR2(1000),
--                         PASSWORD VARCHAR2(1000),
--                         USERNAME VARCHAR2(1000),
--                         DELETE_YN   VARCHAR2(1) DEFAULT 'N',
--                         INSERT_TIME VARCHAR2(255),
--                         UPDATE_TIME VARCHAR2(255),
--                         DELETE_TIME VARCHAR2(255)
-- );
-- -- 역할 테이블 : ROLE_USER, ROLE_ADMIN
-- CREATE TABLE TB_ROLE(
--                         RID NUMBER NOT NULL PRIMARY KEY,
--                         NAME VARCHAR2(1000) UNIQUE,
--                         DELETE_YN   VARCHAR2(1) DEFAULT 'N',
--                         INSERT_TIME VARCHAR2(255),
--                         UPDATE_TIME VARCHAR2(255),
--                         DELETE_TIME VARCHAR2(255)
-- );
-- -- 매핑테이블 : TB_USER vs TB_ROLE 연결시켜주는 테이블 ( Many To Many 관계에서 사용 )
-- CREATE TABLE TB_USER_ROLE (
--                               USER_ID NUMBER NOT NULL,
--                               ROLE_ID NUMBER NOT NULL,
--                               PRIMARY KEY (USER_ID, ROLE_ID) -- 복합키 ( 속성 2이상을 조합해서 기본키로 만드는것 )
-- );

COMMIT;








