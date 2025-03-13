-- ==============================================
-- 2주차 SQL 학습: SELECT 사용법 (2025.03.13)
-- 데이터 조회를 위한 기본 SELECT 문법 정리
-- ==============================================

USE 한빛무역; -- 사용할 데이터베이스 선택

-- 1️⃣ 테이블의 모든 데이터를 조회 (모든 컬럼 포함)
SELECT * FROM 고객;

-- 2️⃣ 특정 컬럼만 조회
SELECT 고객번호, 담당자명, 도시, 마일리지
FROM 고객;

-- 3️⃣ 컬럼에 별칭(Alias) 적용하여 출력 (AS 사용)
SELECT 고객번호 AS ID, 담당자명 AS "담당자 이름", 마일리지 AS "포인트"
FROM 고객;

-- 4️⃣ 중복 제거 (DISTINCT와 함께 사용)
SELECT DISTINCT 도시
FROM 고객;

-- 5️⃣ 정렬된 데이터 조회 (ORDER BY 활용)
SELECT 고객번호, 담당자명, 마일리지
FROM 고객
ORDER BY 마일리지 DESC;

-- 6️⃣ 특정 조건을 만족하는 데이터 조회 (WHERE 활용)
SELECT 고객번호, 담당자명, 마일리지
FROM 고객
WHERE 마일리지 > 5000;

-- 7️⃣ 조건문에 여러 조건 포함 (AND, OR)
SELECT 고객번호, 담당자명, 마일리지
FROM 고객
WHERE 도시 = '서울특별시' AND 마일리지 > 5000;

-- 8️⃣ 특정 개수의 행만 조회 (LIMIT 사용)
SELECT 고객번호, 담당자명, 마일리지
FROM 고객
ORDER BY 마일리지 DESC
LIMIT 5;

-- 9️⃣ 특정 범위의 행 조회 (OFFSET 활용)
SELECT 고객번호, 담당자명, 마일리지
FROM 고객
ORDER BY 마일리지 DESC
LIMIT 5 OFFSET 10;

--  🔟 수식 연산 포함 (마일리지 10% 증가된 값 계산)
SELECT 고객번호, 담당자명, 마일리지, 마일리지 * 1.1 AS "10% 인상된 마일리지"
FROM 고객;

/*
✅ SELECT 문법 정리:
- `SELECT * FROM 테이블명;` → 모든 컬럼 조회
- `SELECT 컬럼1, 컬럼2 FROM 테이블명;` → 특정 컬럼 조회
- `SELECT 컬럼명 AS 별칭 FROM 테이블명;` → 컬럼 별칭 설정 가능
- `SELECT DISTINCT 컬럼명 FROM 테이블명;` → 중복 제거하여 조회
- `ORDER BY 컬럼명 ASC/DESC;` → 정렬
- `WHERE 조건;` → 특정 조건에 맞는 데이터만 조회
- `LIMIT N;` → 상위 N개 행만 출력
- `LIMIT N OFFSET M;` → M번째 행부터 N개 출력

⚠ `ORDER BY` 없이 `LIMIT`을 사용하면 반환되는 데이터 순서가 예측되지 않을 수 있음!
*/

-- 파일 실행 방법 (MySQL CLI 또는 Workbench)
-- SOURCE SELECT.sql;
