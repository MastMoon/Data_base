INSERT INTO 부서
VALUES('A5', '마케팅부');
SELECT * FROM 부서;

INSERT INTO 제품
VALUES(91, '연어피클소스', NULL, 5000, 40);
SELECT * FROM 제품;

INSERT INTO 제품(제품번호, 제품명, 단가, 재고)
VALUES(90, '연어핫소스', 4000, 50);
SELECT * FROM 제품;

INSERT INTO 사원(사원번호, 이름, 직위, 성별, 입사일)
VALUES('E20', '김사과', '수습사원', '남', CURDATE()),
	  ('E21', '박바나나', '수습사원', '여', CURDATE()),
      ('E22', '정오렌지', '수습사원', '여', CURDATE());
SELECT * FROM 사원;


UPDATE 사원
SET 이름 = '김레몬'
WHERE 사원번호 = 'E20';
SELECT * FROM 사원;

UPDATE 제품
SET 포장단위 = '200 ml bottles'
WHERE 제품번호 = 91;
SELECT * FROM 제품;

UPDATE 제품
SET 단가 = 단가 * 1.1,
	재고 = 재고 - 10
WHERE 제품번호 = 91;
SELECT * FROM 제품;


DELETE FROM 제품
WHERE 제품번호 = 91;
SELECT * FROM 제품;

DELETE FROM 사원
ORDER BY 입사일 DESC
LIMIT 3;
-- WHERE 이름 IN ('김레몬', '박바나나', '정오렌지')
SELECT * FROM 사원;


INSERT INTO 제품(제품번호, 제품명, 단가, 재고)
VALUES(91, '연어피클핫소스', 6000, 50)
ON DUPLICATE KEY UPDATE
제품명 = '연어피클핫소스', 단가 = 6000, 재고 = 50;
SELECT * FROM 제품;