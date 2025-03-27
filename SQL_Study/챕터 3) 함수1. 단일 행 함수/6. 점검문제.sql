
SELECT 고객회사명
	 , CONCAT('**', SUBSTR(고객회사명, 3)) AS 고객회사명2
     , 전화번호
     , REPLACE(SUBSTR(전화번호, 2), ')', '-') AS 전화번호2
FROM 고객;

SELECT 고객회사명
	 , CONCAT('**', SUBSTR(고객회사명, 3)) AS 고객회사명2
     , 전화번호
     , CONCAT( CONCAT(SUBSTRING_INDEX(TRIM(LEADING '(' FROM 전화번호), ')' , 1), '-'), SUBSTRING_INDEX(전화번호, ')', -1) ) AS '전화번호2'
FROM 고객;




SELECT 주문번호, 제품번호, 단가, 주문수량, 할인율,
	   TRUNCATE(주문수량 * 단가, -1) AS 주문금액,
       TRUNCATE(주문수량 * 단가 * 할인율, -1) AS 할인금액,
       TRUNCATE(TRUNCATE(주문수량 * 단가, -1) - TRUNCATE(주문수량 * 단가 * 할인율, -1), -1) AS 실주문금액
FROM 주문세부;




SELECT 이름, 생일,
       FLOOR(DATEDIFF(CURDATE(), 생일) / 365) AS 만나이,
       입사일,
       DATEDIFF(CURDATE(), 입사일) AS 입사일수,
       DATE_ADD(입사일, INTERVAL 500 DAY) AS 500일후
FROM 사원;