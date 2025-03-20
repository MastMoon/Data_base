
-- ==================================================
-- SQL 연산자 정리 및 설명
-- 이 파일은 산술, 비교, 논리, 집합 연산자와 관련된 SQL 문을 포함합니다.
-- 각 섹션별로 SQL 구문을 설명하는 주석이 포함되어 있습니다.
-- ==================================================

-- [IN, BETWEEN, AND 연산자] 특정 범위 또는 다중 값과 비교하는 연산자
-- 파일: IN_BETWEEN_AND 연산자.sql
SELECT 고객번호
	 , 담당자명
     , 담당자직위
FROM 고객
WHERE 담당자직위 = '영업 과장' OR 담당자직위 = '마케팅 과장';

SELECT 고객번호
	 , 담당자명
     , 담당자직위
FROM 고객
WHERE 담당자직위 IN ('영업 과장', '마케팅 과장');



SELECT 담당자명
	 , 마일리지
FROM 고객
WHERE 마일리지 >= 100000
AND 마일리지 <= 200000;
-- WHERE 마일리지 BETWEEN 100000 AND 200000;


-- [IS NULL 연산자] NULL 값을 확인하는 연산자
-- 파일: IS_NULL_연산자.sql
SELECT *
FROM 고객
WHERE 지역 IS NULL;



SELECT *
FROM 고객
WHERE 지역 = '';




UPDATE 고객
SET 지역 = NULL
WHERE 지역 = '';

SELECT *
FROM 고객
WHERE 지역 IS NULL;

-- [LIKE 연산자] 특정 패턴과 일치하는 문자열을 검색하는 연산자
-- 파일: LIKE 연산자.sql
SELECT *
FROM 고객
WHERE 도시 LIKE '%광역시'
AND (고객번호 LIKE '_C%' OR 고객번호 LIKE '__C%');

-- [논리 연산자] AND, OR, NOT을 사용하여 논리적 조건을 조합하는 연산자
-- 파일: 논리_연산자.sql
SELECT *
FROM 고객
WHERE 도시 = '부산광역시'
AND 마일리지 < 1000;

-- [비교 연산자] 두 값을 비교하여 TRUE 또는 FALSE를 반환하는 연산자
-- 파일: 비교_연산자.sql
SELECT 23 >= 5
	 , 23 <= 5
     , 23 > 23
	 , 23 < 23
     , 23 = 23
	 , 23 != 23
     , 23 <> 23;


SELECT *
FROM 고객
WHERE 담당자직위 <> '대표 이사';

-- [산술 연산자] 수학적 연산을 수행하는 연산자 (+, -, *, / 등)
-- 파일: 산술_연산자.sql
SELECT 23 + 5 AS 더하기
	 , 23 - 5 AS 빼기
	 , 23 * 5 AS 곱하기
	 , 23 / 5 AS 실수나누기
	 , 23 DIV 5 AS 정수나누기
	 , 23 % 5 AS 나머지1
	 , 23 MOD 5 AS 나머지2;

-- [집합 연산자] 여러 SELECT 결과를 조합하는 UNION, INTERSECT, EXCEPT 연산자
-- 파일: 집합_연산자.sql
SELECT 고객번호
	 , 담당자명
     , 마일리지
     , 도시
FROM 고객
WHERE 도시 = '부산광역시'
UNION
SELECT 고객번호
	 , 담당자명
     , 마일리지
     , 도시
FROM 고객
WHERE 마일리지 < 1000
ORDER BY 1;



SELECT 고객번호
	 , 담당자명
     , 마일리지
     , 도시
FROM 고객
WHERE 도시 = '부산광역시' OR 마일리지 < 1000
ORDER BY 1;

