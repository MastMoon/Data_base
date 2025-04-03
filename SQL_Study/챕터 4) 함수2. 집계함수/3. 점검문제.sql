SELECT COUNT(도시),
	   COUNT(DISTINCT 도시)
FROM 고객;


SELECT YEAR(주문일) AS 주문년도,
	   COUNT(*) AS 주문건수
FROM 주문
GROUP BY 주문년도;


SELECT YEAR(주문일) AS 주문년도,
	   QUARTER(주문일) AS 분기,
	   COUNT(*) AS 주문건수
FROM 주문
GROUP BY 주문년도, 분기
WITH ROLLUP;


SELECT MONTH(주문일) AS 주문월,
	   COUNT(*) AS 주문건수

FROM 주문
WHERE 요청일 < 발송일
GROUP BY 주문월
ORDER BY 주문월;


SELECT 제품명,
	   SUM(재고) AS 재고합
       
FROM 제품
WHERE 제품명 LIKE '%아이스크림%' -- (1)
GROUP BY 제품명;
-- HAVING 제품명 LIKE '%아이스크림%'; -- (2)


SELECT IF(마일리지 >= 50000, 'VIP고객', '일반고객') AS 고객구분,
	   COUNT(*) AS 고객수,
       AVG(마일리지) AS 평균마일리지
       
FROM 고객
GROUP BY 고객구분;
