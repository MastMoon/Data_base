-- [고객 테이블 - 전화번호 및 고객회사명 처리 예시]
-- Query 1: 고객회사명의 일부 문자를 변경하고 전화번호에서 괄호를 치환합니다.
SELECT 
    고객회사명,
    CONCAT('**', SUBSTR(고객회사명, 3)) AS 고객회사명2,
       -- 예: 고객회사명이 '대한상사'인 경우 → '**상사'
    전화번호,
    REPLACE(SUBSTR(전화번호, 2), ')', '-') AS 전화번호2
       -- 예: 전화번호가 '(02)1234-5678'인 경우
       -- SUBSTR(전화번호, 2) → '02)1234-5678'
       -- REPLACE(..., ')', '-') → '02-1234-5678'
FROM 고객;


-- Query 2: 전화번호에서 앞쪽의 '('를 제거한 후, ')'를 기준으로 분리하여 재구성합니다.
SELECT 
    고객회사명,
    CONCAT('**', SUBSTR(고객회사명, 3)) AS 고객회사명2,
       -- 예: '대한상사' → '**상사'
    전화번호,
    CONCAT(
        CONCAT(SUBSTRING_INDEX(TRIM(LEADING '(' FROM 전화번호), ')', 1), '-'),
        SUBSTRING_INDEX(전화번호, ')', -1)
    ) AS '전화번호2'
       -- 예: 전화번호가 '(02)1234-5678'인 경우
       -- TRIM(LEADING '(' FROM 전화번호) → '02)1234-5678'
       -- SUBSTRING_INDEX(..., ')', 1) → '02'
       -- SUBSTRING_INDEX(전화번호, ')', -1) → '1234-5678'
       -- 최종 결과: '02-1234-5678'
FROM 고객;


-- [주문세부 테이블 - 주문금액 계산 예시]
SELECT 
    주문번호, 
    제품번호, 
    단가, 
    주문수량, 
    할인율,
    TRUNCATE(주문수량 * 단가, -1) AS 주문금액,
       -- 예: 단가 12345, 주문수량 3인 경우 → 3 * 12345 = 37035 → TRUNCATE(37035, -1) = 37030
    TRUNCATE(주문수량 * 단가 * 할인율, -1) AS 할인금액,
       -- 예: 할인율이 0.1인 경우 → 37035 * 0.1 = 3703.5 → TRUNCATE(3703.5, -1) = 3700
    TRUNCATE(
         TRUNCATE(주문수량 * 단가, -1) - TRUNCATE(주문수량 * 단가 * 할인율, -1),
         -1
    ) AS 실주문금액
       -- 예: 37030 - 3700 = 33330 → TRUNCATE(33330, -1) = 33330
FROM 주문세부;


-- [사원 테이블 - 나이 및 입사일 관련 계산 예시]
SELECT 
    이름, 
    생일,
    FLOOR(DATEDIFF(CURDATE(), 생일) / 365) AS 만나이,
       -- 예: 생일이 '1990-05-15'이고 현재 날짜가 '2025-03-28'인 경우
       -- DATEDIFF('2025-03-28','1990-05-15')의 결과를 365로 나눈 후 내림 → 만나이: 34
    입사일,
    DATEDIFF(CURDATE(), 입사일) AS 입사일수,
       -- 예: 입사일이 '2015-06-01'인 경우, 현재 날짜 '2025-03-28'과의 일수 차이 (예: 약 3588일)
    DATE_ADD(입사일, INTERVAL 500 DAY) AS `500일후`
       -- 예: '2015-06-01' + 500일 → '2016-10-12' (예시)
FROM 사원;


-- 선행학습(내가 생각해서 만든 코드)
SELECT
	담당자명,
    고객회사명,
    도시,
    IF(도시 LIKE '%광역시' OR 도시 LIKE '%특별시', '대도시', '도시') AS 도시구분, -- 도시 구분
    마일리지,
    IF(마일리지 >= 100000, 'VVIP고객', IF(마일리지 >= 10000, 'VIP고객', '일반고객')) -- 마일리지 구분
    /*
    -- 교과서
    CASE WHEN 마일리지 >= 100000 THEN 'VVIP고객'
		 WHEN 마일리지 >= 10000 THEN 'VIP고객'
         ELSE '일반고객'
	END AS 마일리지구분
    
    */
FROM 고객;


SELECT
	 주문번호,
     고객번호,
     주문일,
     YEAR(주문일) AS 주문년도,
     QUARTER(주문일) AS 주문분기,
     MONTH(주문일) AS 주문월,
     DAY(주문일) AS 주문일,
     WEEKDAY(주문일) AS 주문요일,
     CASE WHEN WEEKDAY(주문일) = 0 THEN '월요일'
		  WHEN WEEKDAY(주문일) = 1 THEN '화요일'
          WHEN WEEKDAY(주문일) = 2 THEN '수요일'
          WHEN WEEKDAY(주문일) = 3 THEN '목요일'
          WHEN WEEKDAY(주문일) = 4 THEN '금요일'
          WHEN WEEKDAY(주문일) = 5 THEN '토요일'
          ELSE '일요일'
     END AS 한글요일
FROM 주문;


SELECT *
	 , DATEDIFF(발송일, 요청일) AS 지연일수
FROM 주문
WHERE DATEDIFF(발송일, 요청일) >= 7;


