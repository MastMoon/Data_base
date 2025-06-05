-- 실습문제 1번
SELECT 제품명
FROM 제품
WHERE 단가 = (
						SELECT MAX(단가)
                        FROM 제품
                        );
                        
-- 실습문제 2번
SELECT SUM(d.주문수량) AS 주문수량합
FROM 제품 AS p
JOIN 주문세부 AS d
   ON p.제품번호 = d.제품번호
WHERE p.단가 = (
						SELECT MAX(단가)
                        FROM 제품
						);
                        
-- 실습문제 3번
SELECT SUM(d.주문수량) AS 주문수량합
FROM 제품 AS p
JOIN 주문세부 AS d
   ON p.제품번호 = d.제품번호
WHERE p.제품명 LIKE  '%아이스크림%';

-- 실습문제 4번
SELECT
    YEAR(o.주문일) AS 주문년도,
    COUNT(*)       AS 주문건수
FROM 고객 AS c
JOIN 주문   AS o
  ON c.고객번호 = o.고객번호
WHERE c.도시 = '서울특별시'
GROUP BY YEAR(o.주문일)
ORDER BY YEAR(o.주문일) ASC; -- ASC 생략가능
