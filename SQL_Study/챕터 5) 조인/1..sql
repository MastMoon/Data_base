SELECT 부서.부서번호,
	   부서명,
       이름,
       사원.부서번호
FROM 부서
CROSS JOIN 사원
WHERE 이름 = '배재용';




SELECT 사원번호,
	   직위,
       사원.부서번호,
       부서명
FROM 사원
INNER JOIN 부서
ON 사원.부서번호 = 부서.부서번호
WHERE 이름 = '이소미';

/* Non-ANSI
FROM 사원, 부서
WHERE 사원.부서번호 = 부서.부서번호 
AND 이름 = '이소미';
*/

SELECT 고객.고객번호, 
	   담당자명, 
	   고객회사명,
       COUNT(*) AS 주문건수
       
FROM 고객
INNER JOIN 주문
ON 고객.고객번호 = 주문.고객번호
GROUP BY 고객.고객번호,
	     담당자명,
         고객회사명
ORDER BY 주문건수 DESC;

SELECT 고객.고객번호, 
	   담당자명, 
       고객회사명,
       SUM(단가*주문수량) AS 주문금액합
FROM 고객 
INNER JOIN 주문
ON 고객.고객번호 = 주문.고객번호
INNER JOIN 주문세부
ON 주문.주문번호 = 주문세부.주문번호
GROUP BY 고객.고객번호,
	     담당자명,
         고객회사명
ORDER BY 주문금액합 DESC;