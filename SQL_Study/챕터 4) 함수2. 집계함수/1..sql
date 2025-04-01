SELECT COUNT(*), -- NULL 값과 상관없이 모든행을 카운트함.
	   COUNT(고객번호), -- NULL값 제외하고 계산.
       COUNT(도시), -- NULL값 제외하고 계산.
       COUNT(지역) -- NULL값 제외하고 계산.
FROM 고객;

SELECT SUM(마일리지),
	   AVG(마일리지),
       MIN(마일리지),
       MAX(마일리지)
FROM 고객
WHERE 도시 = '서울특별시';

SELECT 도시,
	   COUNT(*) AS 고객수,
       AVG(마일리지) AS 평균마일리지
FROM 고객
GROUP BY 1; -- == GROUP BY 도시;


SELECT 담당자직위,
	   도시,
       COUNT(*) AS '고객수',
       AVG(마일리지) AS '평균마일리지'
FROM 고객
GROUP BY 담당자직위, 도시
ORDER BY 1, 2;

SELECT 도시,
	   COUNT(*) AS '고객수',
       AVG(마일리지) AS '평균마일리지'
FROM 고객
GROUP BY 도시
HAVING COUNT(*) >= 10;


SELECT 도시,
	   SUM(마일리지)
       
FROM 고객
WHERE 고객번호 LIKE 'T%'
GROUP BY 도시
HAVING SUM(마일리지) >= 1000;
