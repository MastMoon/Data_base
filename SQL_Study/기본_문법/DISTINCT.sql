-- ==============================================
-- 2주차 SQL 학습: DISTINCT 사용법 (2025.03.13)
-- 중복된 데이터를 제거하는 DISTINCT 문법 정리
-- ==============================================

USE 한빛무역; -- 사용할 데이터베이스 선택

-- 1️⃣ 중복된 도시 제거 후 조회 (중복 없이 도시 목록 출력)
SELECT DISTINCT 도시
FROM 고객;

-- 2️⃣ 중복된 담당자명 제거 후 조회
SELECT DISTINCT 담당자명
FROM 고객;

-- 3️⃣ 중복을 제거한 도시 목록을 오름차순 정렬하여 출력
SELECT DISTINCT 도시
FROM 고객
ORDER BY 도시 ASC;

-- 4️⃣ DISTINCT + LIMIT: 중복 제거 후 상위 5개 도시만 출력
SELECT DISTINCT 도시
FROM 고객
LIMIT 5;

-- 5️⃣ 여러 컬럼에 DISTINCT 적용 (도시와 담당자명의 조합이 중복되지 않도록 출력)
SELECT DISTINCT 도시, 담당자명
FROM 고객;

-- 6️⃣ 특정 조건을 포함한 DISTINCT (서울특별시 고객 중 중복 없는 담당자명 조회)
SELECT DISTINCT 담당자명
FROM 고객
WHERE 도시 = '서울특별시';

-- 7️⃣ GROUP BY와 DISTINCT 비교 (도시별 고객 수 출력)
SELECT 도시, COUNT(*) AS 고객수
FROM 고객
GROUP BY 도시;

/*
✅ DISTINCT 문법 정리:
- `SELECT DISTINCT 컬럼명 FROM 테이블;` → 해당 컬럼에서 중복 제거 후 출력
- 여러 컬럼 적용 시, 컬럼들의 조합이 중복되지 않도록 출력됨.
- `GROUP BY`를 활용하면 중복 데이터를 제거하면서 집계 함수도 사용 가능.

⚠ DISTINCT는 **각 컬럼의 조합이 중복되지 않도록 반환**하므로, 다중 컬럼 사용 시 주의 필요.
*/

-- 파일 실행 방법 (MySQL CLI 또는 Workbench)
-- SOURCE DISTINCT.sql;
