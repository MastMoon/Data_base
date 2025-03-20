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