-- 정렬을 수행하는 ORDER BY 문법 정리

USE 한빛무역;

-- 기본 오름차순 정렬 (작은 값 → 큰 값)
SELECT 고객번호, 담당자명, 도시, 마일리지 AS 포인트
FROM 고객
ORDER BY 마일리지 ASC;

-- 내림차순 정렬 (큰 값 → 작은 값)
SELECT 고객번호, 담당자명, 도시, 마일리지 AS 포인트
FROM 고객
ORDER BY 마일리지 DESC;

-- 여러 컬럼으로 정렬 (도시 서울기준, 마일리지 내림차순)
SELECT 고객번호, 담당자명, 도시, 마일리지 AS 포인트
FROM 고객
Where 도시 = '서울특별시'
ORDER BY 마일리지 DESC;

/*

ORDER BY 마일리지 DESC; == ORDER BY 4 DESC; 
같은 의미

*/
