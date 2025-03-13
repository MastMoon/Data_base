-- ==============================================
-- 2주차 SQL 학습: LIMIT 사용법 (2025.03.13)
-- 특정 개수의 행만 조회하는 LIMIT 문법 정리
-- ==============================================

USE 한빛무역; -- 사용할 데이터베이스 선택

-- 1️⃣ 상위 5개 행만 조회 (기본 사용법)
SELECT 고객번호, 담당자명, 도시, 마일리지
FROM 고객
ORDER BY 마일리지 DESC
LIMIT 5;

-- 2️⃣ 특정 위치에서부터 조회 (10번째 행부터 3개 출력)
SELECT 고객번호, 담당자명, 도시, 마일리지
FROM 고객
ORDER BY 마일리지 DESC
LIMIT 10, 3;  -- (OFFSET 10, ROWS 3)

-- 3️⃣ OFFSET을 사용한 동일한 쿼리 (위와 동일한 결과)
SELECT 고객번호, 담당자명, 도시, 마일리지
FROM 고객
ORDER BY 마일리지 DESC
LIMIT 3 OFFSET 10;  -- OFFSET 10부터 시작해서 3개 출력

-- 4️⃣ 특정 도시 고객 중 마일리지가 높은 상위 3명만 조회
SELECT 고객번호, 담당자명, 마일리지
FROM 고객
WHERE 도시 = '서울특별시'
ORDER BY 마일리지 DESC
LIMIT 3;

-- 5️⃣ DISTINCT와 함께 LIMIT 사용 (중복 제거 후 상위 5개 도시만 출력)
SELECT DISTINCT 도시
FROM 고객
LIMIT 5;

/*
✅ LIMIT 문법 정리:
- `LIMIT N;`  → 상위 N개 행 출력
- `LIMIT M, N;` → M번째 행부터 N개 출력 (OFFSET M)
- `LIMIT N OFFSET M;` → M번째 행부터 N개 출력 (동일한 기능)

⚠ OFFSET을 사용할 때 데이터 개수가 부족하면 빈 결과가 반환될 수 있음.
*/

-- 파일 실행 방법 (MySQL CLI 또는 Workbench)
-- SOURCE LIMIT.sql;
