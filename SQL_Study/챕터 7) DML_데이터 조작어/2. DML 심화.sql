CREATE TABLE 고객주문요약
(고객번호 CHAR(5) PRIMARY KEY
,고객회사명 VARCHAR(50)
,주문건수 INT
,최종주문일 DATE
);

INSERT INTO 고객주문요약
		SELECT 고객.고객번호,
			   고객회사명,
			   COUNT(*),
			   MAX(주문일)
		FROM 고객, 주문
		WHERE 고객.고객번호 = 주문.고객번호
        GROUP BY 고객.고객번호, 고객회사명;
SELECT * FROM 고객주문요약;