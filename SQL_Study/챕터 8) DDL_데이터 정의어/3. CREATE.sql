CREATE DATABASE 한빛학사;

USE 한빛학사;

CREATE TABLE 학과
(
 학과번호 CHAR(2),
 학과명 VARCHAR(20),
 학과장명 VARCHAR(20)
);
INSERT INTO 학과
VALUES('AA', '컴퓨터공학과', '배경민'),
	  ('BB', '소프트웨어학과', '김남준'),
      ('CC', '디자인융합학과', '박선영');
      
SELECT * FROM 학과;


CREATE TABLE 학생
(
 학번 CHAR(5),
 이름 VARCHAR(20),
 생일 DATE,
 연락처 VARCHAR(20),
 학과번호 CHAR(2)
);
INSERT INTO 학생
VALUES('S0001', '이윤주', '2020-01-30', '01033334444', 'AA'),
	  ('S0001', '이승은', '2021-02-23', NULL, 'AA'),
      ('S0003', '백재용', '2018-03-31', '01077778888', 'DD');

SELECT * FROM 학생;


CREATE TABLE 휴학생 AS
	 SELECT *
     FROM 학생
     WHERE 1 = 2;
     
SELECT * FROM 휴학생;


CREATE TABLE 회원
(
아이디 VARCHAR(20) PRIMARY KEY,
회원명 VARCHAR(20),
키 INT,
몸무게 INT,
체질량지수 DECIMAL(4,1) AS (몸무게 / POWER(키 / 100, 2)) STORED
);

INSERT INTO 회원(아이디, 회원명, 키, 몸무게)
VALUES('APPLE', '김사과', 178, 70);

SELECT * FROM 회원;