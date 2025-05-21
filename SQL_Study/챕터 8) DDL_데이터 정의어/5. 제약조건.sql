-- ==================================================
-- 예제 1) 학과 테이블 생성 (컬럼 레벨 제약조건)
-- 목적: 각 컬럼 정의 시 직접 PRIMARY KEY, NOT NULL을 설정
-- SQL:
CREATE TABLE 학과
(
  학과번호   CHAR(2)       PRIMARY KEY,    -- 컬럼 레벨 기본키
  학과명     VARCHAR(20)   NOT NULL,       -- 컬럼 레벨 NOT NULL
  학과장명   VARCHAR(20)                    -- 제약 없음
);
-- 예상 스키마:
-- 학과번호(CHAR2, PK), 학과명(VARCHAR20, NOT NULL), 학과장명(VARCHAR20)


-- ==================================================
-- 예제 2) 학과 테이블 생성 (테이블 레벨 제약조건)
-- 목적: 컬럼 정의 후 맨 아래에서 PRIMARY KEY를 선언
-- SQL:
CREATE TABLE 학과
(
  학과번호   CHAR(2),                       -- 제약은 뒤에서 선언
  학과명     VARCHAR(20)   NOT NULL,       
  학과장명   VARCHAR(20),
  PRIMARY KEY(학과번호)                    -- 테이블 레벨 기본키
);
-- 예상 스키마:
-- 학과번호(CHAR2, PK), 학과명(VARCHAR20, NOT NULL), 학과장명(VARCHAR20)


-- ==================================================
-- 예제 3) 학생 테이블 생성 (컬럼 레벨 제약조건)
-- 목적: 주요 제약을 각 컬럼 바로 뒤에 설정 (PK, NOT NULL, UNIQUE, FK, CHECK, DEFAULT)
-- SQL:
CREATE TABLE 학생
(
  학번       CHAR(5)       PRIMARY KEY,               -- 기본키
  이름       VARCHAR(20)   NOT NULL,                  -- NOT NULL
  생일       DATE          NOT NULL,                  -- NOT NULL
  연락처     VARCHAR(20)   UNIQUE,                    -- 유일 제약
  학과번호   CHAR(2)       REFERENCES 학과(학과번호),  -- 외래키
  성별       CHAR(1)       CHECK(성별 IN ('남','여')), -- 체크 제약
  등록일     DATE          DEFAULT(CURDATE())         -- 기본값
);
-- 예상 스키마:
-- 학번(PK), 이름(NOT NULL), 생일(NOT NULL), 연락처(UNIQUE), 학과번호(FK), 성별(CHECK), 등록일(DEFAULT)


-- ==================================================
-- 예제 4) 학생 테이블 생성 (테이블 레벨 제약조건)
-- 목적: 제약을 테이블 정의 하단에 모아서 선언 (PK, UNIQUE, CHECK, FK)
-- SQL:
CREATE TABLE 학생
(
  학번       CHAR(5),
  이름       VARCHAR(20)   NOT NULL,
  생일       DATE          NOT NULL,
  연락처     VARCHAR(20),
  학과번호   CHAR(2),
  성별       CHAR(1),
  등록일     DATE          DEFAULT(CURDATE()),

  PRIMARY KEY(학번),                        -- 기본키
  UNIQUE(연락처),                           -- 유일 제약
  CHECK(성별 IN ('남','여')),               -- 체크 제약
  FOREIGN KEY(학과번호) REFERENCES 학과(학과번호)  -- 외래키
);
-- 예상 스키마:
-- 학번(PK), 이름(NOT NULL), 생일(NOT NULL), 연락처(UNIQUE), 학과번호(FK), 성별(CHECK), 등록일(DEFAULT)
