# 조건절에서 사용하는 서브쿼리
SELECT 도시,
	   AVG(마일리지) AS 평균마일리지
FROM 고객
GROUP BY 도시
HAVING AVG(마일리지) > (
					 SELECT AVG(마일리지)
					 FROM 고객
                     );
                     
			
# FROM절에서 사용하는 서브쿼리 (인라인 뷰)
SELECT 담당자명,
	   고객회사명,
	   마일리지,
       고객.도시,
       도시_평균마일리지,
       도시_평균마일리지 - 마일리지 AS 차이
FROM 고객,
	 (SELECT 도시,
		     AVG(마일리지) AS 도시_평균마일리지
     FROM 고객
     GROUP BY 도시
     ) AS 도시별요약
WHERE 고객.도시 = 도시별요약.도시;


# SELECT절에서 사용하는 서브쿼리
SELECT 고객번호,
	   담당자명,
       (SELECT MAX(주문일)
        FROM 주문
        WHERE 주문.고객번호 = 고객.고객번호
       ) AS 최종주문일
FROM 고객;


# CTE 사용 작성
WITH 도시별요약 AS
	(
	SELECT 도시,
		   AVG(마일리지) AS 도시_평균마일리지
	FROM 고객
	GROUP BY 도시
    )
    
SELECT 담당자명,
	   고객회사명,
	   마일리지,
       고객.도시,
       도시_평균마일리지,
       도시_평균마일리지 - 마일리지 AS 차이
FROM 고객, 
	 도시별요약
WHERE 고객.도시 = 도시별요약.도시;