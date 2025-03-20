
-- ==================================================
-- SQL 함수 및 예제 정리
-- 이 파일은 문자열 함수(CONCAT, CONCAT_WS, LENGTH 등) 및 SQL 예제 문제를 포함합니다.
-- 각 섹션별로 SQL 구문을 설명하는 주석이 포함되어 있습니다.
-- ==================================================

-- [CH2 예제문제] SQL 기본 개념을 다루는 예제 문제
-- 파일: CH2_예제문제.sql
SELECT * 
FROM 고객 
WHERE 도시 LIKE '서울특별시'
AND 마일리지 BETWEEN 15000 AND 20000;

SELECT DISTINCT 지역, 도시 
FROM 고객
ORDER BY 1, 2;

SELECT *
FROM 고객
WHERE 도시 IN ('춘천시', '과천시', '광명시')
AND (담당자직위 LIKE '%이사%' OR 담당자직위 LIKE '%사원%');

SELECT *
FROM 고객
WHERE NOT (도시 LIKE '%광역시' OR 도시 LIKE'%특별시')
ORDER BY 마일리지 DESC
LIMIT 3;

SELECT *
FROM 고객 
WHERE 지역 IS NOT NULL
AND 담당자직위 <> '대표 이사';

-- [CONCAT 및 CONCAT_WS 함수] 문자열을 연결하는 함수
-- 파일: CONCAT(_WS).sql
SELECT CONCAT('DREAMS', 'COME', 'TRUE')
	 , CONCAT_WS('-', '2025', '03', '20');

-- [자주 사용되는 SQL 패턴] 다양한 SQL 활용 사례
-- 파일: 자주_사용되는_패턴.sql
SELECT * FROM 고객 WHERE REGEXP_LIKE(고객회사명, '-----');
SELECT * FROM 고객 WHERE REGEXP_LIKE(도시, '과천시|오산시');
SELECT * FROM 고객 WHERE REGEXP_LIKE(도시, '[인천|부산|대전]광역시');
SELECT * FROM 고객 WHERE REGEXP_LIKE(고객회사명, '^한');
SELECT * FROM 고객 WHERE REGEXP_LIKE(고객회사명, '^...푸.$');
SELECT * FROM 고객 WHERE REGEXP_LIKE(담당자명, '정+'); -- '정*'
SELECT * FROM 고객 WHERE REGEXP_LIKE(고객번호, '[P-S]$'); -- '[^P-S]$'
SELECT * FROM 고객 WHERE REGEXP_LIKE(고객회사명, '^.{5}$'); -- 고객회사명 5글자
SELECT * FROM 고객 WHERE REGEXP_LIKE(고객번호, '[TS]{2}');
SELECT * FROM 고객 WHERE REGEXP_LIKE(고객번호, '[TS]{1,2}');
SELECT * FROM 고객 WHERE 전화번호 LIKE '%45';

-- [CHAR_LENGTH 및 LENGTH 함수] 문자열 길이를 계산하는 함수
-- 파일: (CHAR_)LENGTH.sql
SELECT CHAR_LENGTH('HELLO~')
	 , LENGTH('HELLO~')
     , CHAR_LENGTH('안 녕히~')
     , LENGTH('안 녕히~')

