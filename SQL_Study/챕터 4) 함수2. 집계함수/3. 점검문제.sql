SELECT COUNT(도시),
	   COUNT(DISTINCT 도시)
FROM 고객;


SELECT YEAR(주문일) AS 주문년도,
	   COUNT(*) AS 주문건수
FROM 주문
GROUP BY 주문년도;