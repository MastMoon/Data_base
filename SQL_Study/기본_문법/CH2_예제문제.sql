SELECT * 
FROM 고객 
WHERE 도시 LIKE '서울특별시'
AND 마일리지 BETWEEN 15000 AND 20000;

SELECT DISTINCT 지역, 도시 
FROM 고객
ORDER BY 1, 2;

SELECT *
FROM 고객
WHERE 도시 IN ('춘천시', '과천시', '광명시')
AND (담당자직위 LIKE '%이사%' OR 담당자직위 LIKE '%사원%');

SELECT *
FROM 고객
WHERE NOT (도시 LIKE '%광역시' OR 도시 LIKE'%특별시')
ORDER BY 마일리지 DESC
LIMIT 3;

SELECT *
FROM 고객 
WHERE 지역 IS NOT NULL
AND 담당자직위 <> '대표 이사';