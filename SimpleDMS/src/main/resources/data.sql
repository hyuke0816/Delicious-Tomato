

INSERT INTO TB_FAQ
VALUES (1, '제목', '해결방법', 'N', TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') ,NULL, NULL);
INSERT INTO TB_FAQ
VALUES (2, '제목2', '해결방법2', 'N', TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') ,NULL, NULL);
INSERT INTO TB_FAQ
VALUES (3, '제목3', '해결방법3', 'N', TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') ,NULL, NULL);
INSERT INTO TB_FAQ
VALUES (4, '제목4', '해결방법4', 'N', TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') ,NULL, NULL);



-- TODO: login 샘플 데이터
INSERT INTO TB_ROLE VALUES(SQ_ROLE.NEXTVAL, 'ROLE_USER','N', TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') ,NULL, NULL);
-- INSERT INTO TB_ROLE(id, name) VALUES(SQ_ROLE.NEXTVAL, 'ROLE_MODERATOR');
INSERT INTO TB_ROLE VALUES(SQ_ROLE.NEXTVAL, 'ROLE_ADMIN','N', TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') ,NULL, NULL);

-- admin user 1명 최초 생성
-- id : forbob
-- password : 123456
-- email : forbob@naver.com
-- roles : ROLE_ADMIN
INSERT INTO TB_USER VALUES(SQ_USER.NEXTVAL, 'forbob@naver.com','$2a$10$TG1a5ywSrGNgf7/fFH.m0.EdTzHax8AGYNeAr8aIseF3DKyO0lDti','forbob','N', TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') ,NULL, NULL);
INSERT INTO TB_USER_ROLE VALUES(1, 2);

COMMIT;