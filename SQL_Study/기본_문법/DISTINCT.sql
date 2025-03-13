-- ==============================================
-- 2주차 SQL 학습: DISTINCT 사용법 (2025.03.13)
-- 중복된 데이터를 제거하는 DISTINCT 문법 정리
-- ==============================================

USE 한빛무역; -- 사용할 데이터베이스 선택

-- 중복된 도시 제거 후 조회 (중복 없이 도시 목록 출력)
SELECT DISTINCT 도시
FROM 고객;

-- 중복을 제거한 도시 목록을 오름차순 정렬하여 출력
SELECT DISTINCT 도시
FROM 고객
ORDER BY 도시 ASC;

-- DISTINCT + LIMIT: 중복 제거 후 상위 5개 도시만 출력
SELECT DISTINCT 도시
FROM 고객
LIMIT 5;
