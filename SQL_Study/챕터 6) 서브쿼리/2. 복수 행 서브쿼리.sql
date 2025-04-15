-- IN은 서브쿼리의 각 결과마다 = 연산자를 사용하여 비교함.
SELECT COUNT(*) AS 주문건수
FROM 주문
WHERE 고객번호 IN (SELECT 고객번호
				FROM 고객
                WHERE 도시 = '부산광역시'
				);
                
                
SELECT 담당자명,
	   고객회사명,
       마일리지
FROM 고객
WHERE 마일리지 > ANY (SELECT 마일리지
					FROM 고객
                    WHERE 도시 = '부산광역시'
					);

SELECT 담당자명,
	   고객회사명,
       마일리지
FROM 고객
WHERE 마일리지 > ALL (SELECT AVG(마일리지)
					FROM 고객
                    GROUP BY 지역
					);

--------------------------                    
SELECT 고객번호,
	   고객회사명
FROM 고객
WHERE EXISTS (SELECT * 
              FROM 주문
              WHERE 고객번호 = 고객.고객번호
              );
              
SELECT 고객번호,
	   고객회사명
FROM 고객
WHERE 고객번호 IN (SELECT DISTINCT 고객번호
              FROM 주문
              );
              
SELECT DISTINCT 고객.고객번호, 
				고객회사명
FROM 고객
INNER JOIN 주문
ON 고객.고객번호 = 주문.고객번호;
          
