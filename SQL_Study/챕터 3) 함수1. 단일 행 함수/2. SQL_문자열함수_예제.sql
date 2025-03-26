-- ==================================================
-- SQL 함수 정리
-- 이 파일은 문자열 함수(LEFT, RIGHT, SUBSTR, SUBSTRING_INDEX 등)를 포함합니다.
-- 각 섹션별로 SQL 구문을 설명하는 주석이 포함되어 있습니다.
-- ==================================================

-- [문자열 추출 함수]
-- LEFT, RIGHT, SUBSTR 함수를 사용하여 문자열의 일부를 추출합니다.
SELECT 
    LEFT('SQL', 3),
    RIGHT('SQL 완전정복', 4),
    SUBSTR('SQL 완전정복', 2, 5),
    SUBSTR('SQL 완전정복', 2);

-- [문자열 분리 함수]
-- SUBSTRING_INDEX 함수를 사용하여 구분자를 기준으로 문자열을 분리합니다.
SELECT 
    SUBSTRING_INDEX('서울시 동작구 흑석로', ' ', 2),
    SUBSTRING_INDEX('서울시 동작구 흑석로', ' ', -2);

-- [문자열 채우기 함수]
-- LPAD와 RPAD 함수를 사용하여 문자열의 왼쪽 또는 오른쪽을 특정 문자로 채웁니다.
SELECT 
    LPAD('SQL', 10, '0'),
    RPAD('SQL', 5, '&');

-- [공백 제거 및 길이 측정 함수]
-- LTRIM, RTRIM, TRIM 함수를 이용해 문자열의 좌우 공백을 제거한 후, LENGTH 함수로 길이를 측정합니다.
SELECT 
    LENGTH(LTRIM(' SQL ')),
    LENGTH(RTRIM(' SQL ')),
    LENGTH(TRIM(' SQL '));

-- [특정 문자 제거 함수]
-- TRIM 함수를 사용하여 문자열의 양쪽 또는 한쪽에서 특정 문자를 제거합니다.
SELECT 
    TRIM(BOTH 'abc' FROM 'abcXXXXXXabc'),
    TRIM(LEADING 'abc' FROM 'abcXXXXXXabc'),
    TRIM(TRAILING 'abc' FROM 'abcXXXXXXabc');

-- [문자열 검색 및 위치 확인 함수]
-- FIELD, FIND_IN_SET, INSTR, LOCATE 함수를 사용하여 문자열 내의 위치나 순서를 확인합니다.
SELECT 
    FIELD('JAVA', 'SQL', 'JAVA', 'C'),
    FIND_IN_SET('JAVA', 'SQL,JAVA,C'),
    INSTR('네 인생을 살아라', '인생'),
    LOCATE('인생', '네 인생을 살아라');

-- [인덱스 기반 선택 함수]
-- ELT 함수는 인덱스에 해당하는 값을 반환합니다.
SELECT 
    ELT(2, 'SQL', 'JAVA', 'C');

-- [기타 문자열 처리 함수]
-- REPEAT, REPLACE, REVERSE 함수를 사용하여 문자열을 반복, 치환, 역순으로 변환합니다.
SELECT 
    REPEAT('*', 5);
SELECT 
    REPLACE('010.1234.1234', '.', '-');
SELECT 
    REVERSE('OLLEH');
