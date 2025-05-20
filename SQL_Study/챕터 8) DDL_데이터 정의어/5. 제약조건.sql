-- 방법1(컬럼 레벨의 제약조건 설정)
CREATE TABLE 학과
(
학과번호 CHAR(2) PRIMARY KEY,
학과명 VARCHAR(20) NOT NULL,
학과장명 VARCHAR(20)
);

-- 방법2(테이블 레벨로 제약조건 설정)
CREATE TABLE 학과
(
학과번호 CHAR(2),
학과명 VARCHAR(20) NOT NULL,
학과장명 VARCHAR(20),
PRIMARY KEY(학과번호)
);


-- 방법1 (컬럼 레벨로 제약조건 설정)
CREATE TABLE 학생
(
학번 CHAR(5) PRIMARY KEY,
이름 VARCHAR(20) NOT NULL,
생일 DATE NOT NULL,
연락처 VARCHAR(20) UNIQUE,
학과번호 CHAR(2) REFERENCES 학과(학과번호),
성별 CHAR(1) CHECK(성별 IN ('남','여')),
등록일 DATE DEFAULT(CURDATE())
);

-- 방법2(테이블 레벨로 제약조건 설정)
CREATE TABLE 학생
(
학번 CHAR(5),
이름 VARCHAR(20) NOT NULL,
생일 DATE NOT NULL,
연락처 VARCHAR(20),
학과번호 CHAR(2),
성별 CHAR(1),
등록일 DATE DEFAULT(CURDATE()),
 PRIMARY KEY(학번),
 UNIQUE(연락처),
 CHECK(성별 IN ('남','여')),
 FOREIGN KEY (학과번호) REFERENCES 학과(학과번호)
);