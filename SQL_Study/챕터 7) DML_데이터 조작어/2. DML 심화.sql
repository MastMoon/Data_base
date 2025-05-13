-- 고객주문요약 테이블 생성
CREATE TABLE 고객주문요약
(고객번호 CHAR(5) PRIMARY KEY
,고객회사명 VARCHAR(50)
,주문건수 INT
,최종주문일 DATE
);

-- INSERT INTO SELECT
INSERT INTO 고객주문요약
		SELECT 고객.고객번호,
			   고객회사명,
			   COUNT(*),
			   MAX(주문일)
		FROM 고객, 주문
		WHERE 고객.고객번호 = 주문.고객번호
        GROUP BY 고객.고객번호, 고객회사명;
SELECT * FROM 고객주문요약;


-- UPDATE SELECT
UPDATE 제품
SET 단가 = (
		  SELECT *
          FROM (
			   SELECT AVG(단가)
               FROM 제품
               WHERE 제품명 LIKE '%소스%'
			   ) AS t
		  )
WHERE 제품번호 = 91;
SELECT * FROM 제품;

-- (WHERE 절 서브쿼리 사용)
UPDATE 고객,
	  (
      SELECT DISTINCT 고객번호
      FROM 주문
      ) AS 주문고객
SET 마일리지 = 마일리지 * 1.1
WHERE 고객.고객번호 IN (주문고객.고객번호);
SELECT * FROM 고객 WHERE 고객번호 IN (SELECT DISTINCT 고객번호 FROM 주문);


-- UPDATE JOIN
UPDATE 고객
INNER JOIN 마일리지등급
ON 마일리지 BETWEEN 하한마일리지 AND 상한마일리지
SET 마일리지 = 마일리지 + 1000
WHERE 등급명 = 'S';

SELECT 고객번호,
	   고객회사명,
       마일리지
FROM 고객
INNER JOIN 마일리지등급
ON 마일리지 BETWEEN 하한마일리지 AND 상한마일리지
WHERE 등급명 = 'S';


-- DELETE SELECT
DELETE FROM 주문
WHERE 주문번호 NOT IN (
					SELECT DISTINCT 주문번호
                    FROM 주문세부
					);
                    

-- DELETE JOIN 
SELECT * FROM 주문 WHERE 주문번호 = 'H0248';
SELECT * FROM 주문세부 WHERE 주문번호 = 'H0248';

DELETE 주문,
	   주문세부
FROM 주문
INNER JOIN 주문세부
ON 주문.주문번호 = 주문세부.주문번호
WHERE 주문.주문번호 = 'H0248';


SELECT 고객.*
FROM 고객
LEFT OUTER JOIN 주문
ON 고객.고객번호 = 주문.고객번호
WHERE 주문.고객번호 IS NULL;

DELETE 고객
FROM 고객
LEFT OUTER JOIN 주문
ON 고객.고객번호 = 주문.고객번호
WHERE 주문.고객번호 IS NULL;

SELECT *
FROM 고객
WHERE 고객번호 IN ('BQQZA', 'RISPA', 'SSAFI', 'TTRAN');