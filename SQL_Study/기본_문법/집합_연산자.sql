/*
SELECT 고객번호
	 , 담당자명
     , 마일리지
     , 도시
FROM 고객
WHERE 도시 = '부산광역시'
UNION
SELECT 고객번호
	 , 담당자명
     , 마일리지
     , 도시
FROM 고객
WHERE 마일리지 < 1000
ORDER BY 1;
*/

SELECT 고객번호
	 , 담당자명
     , 마일리지
     , 도시
FROM 고객
WHERE 도시 = '부산광역시' OR 마일리지 < 1000
ORDER BY 1;