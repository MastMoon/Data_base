-- ==================================================
-- SQL 함수 정리 (추가 문자열 함수)
-- 이 파일은 문자열 함수(CONCAT, CONCAT_WS, CHAR_LENGTH 등)을 포함합니다.
-- 각 섹션별로 SQL 구문을 설명하는 주석이 포함되어 있습니다.
-- ==================================================

-- [CHAR_LENGTH 및 LENGTH 함수]
-- 문자열의 길이를 측정하는 함수입니다.
SELECT 
    CHAR_LENGTH('HELLO~'),
    LENGTH('HELLO~'),
    CHAR_LENGTH('안 녕히~'),
    LENGTH('안 녕히~');

-- [CONCAT 및 CONCAT_WS 함수]
-- 문자열을 연결하는 함수입니다.
SELECT 
    CONCAT('DREAMS', 'COME', 'TRUE'),
    CONCAT_WS('-', '2025', '03', '20');
