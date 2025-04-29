# 상관 서브쿼리
SELECT 사원번호,
	   이름,
       상사번호,
       (
       SELECT 이름
       FROM 사원 AS 상사
       WHERE 상사.사원번호 = 사원.상사번호
       ) AS 상사이름
FROM 사원;


# 다중 컬럼 서브쿼리
SELECT 도시,
	   담당자명,
       고객회사명,
       마일리지
FROM 고객
WHERE (도시, 마일리지) IN (
					   SELECT 도시, MAX(마일리지)
                       FROM 고객
                       GROUP BY 도시
	                   );