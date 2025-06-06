-- ==================================================
-- SQL 함수 정리 (추가 문자열 함수)
-- 이 파일은 문자열 함수(CONCAT, CONCAT_WS, CHAR_LENGTH 등)을 포함합니다.
-- 각 섹션별로 SQL 구문을 설명하는 주석이 포함되어 있습니다.
-- ==================================================

-- [CHAR_LENGTH 및 LENGTH 함수]
-- 문자열의 길이를 측정하는 함수입니다.
SELECT 
    CHAR_LENGTH('HELLO~'),  -- 반환값: 6
    LENGTH('HELLO~'),       -- 반환값: 6 (ASCII 문자는 바이트와 동일)
    CHAR_LENGTH('안 녕히~'), -- 반환값: 5 (문자: '안', ' ', '녕', '히', '~')
    LENGTH('안 녕히~');      -- 반환값: 11 (UTF-8 기준: 안=3, 공백=1, 녕=3, 히=3, ~=1)
    
-- 예상 출력 결과:
-- +----------------------------+------------------------+-------------------------+------------------------+
-- | CHAR_LENGTH('HELLO~')      | LENGTH('HELLO~')       | CHAR_LENGTH('안 녕히~')    | LENGTH('안 녕히~')       |
-- +----------------------------+------------------------+-------------------------+------------------------+
-- | 6                          | 6                      | 5                       | 11                     |
-- +----------------------------+------------------------+-------------------------+------------------------+


-- [CONCAT 및 CONCAT_WS 함수]
-- 문자열을 연결하는 함수입니다.
SELECT 
    CONCAT('DREAMS', 'COME', 'TRUE'),       -- 반환값: 'DREAMSCOMETRUE'
    CONCAT_WS('-', '2025', '03', '20');       -- 반환값: '2025-03-20'

-- 예상 출력 결과:
-- +-----------------------------+-------------------------------+
-- | CONCAT('DREAMS','COME','TRUE')  | CONCAT_WS('-', '2025', '03', '20') |
-- +-----------------------------+-------------------------------+
-- | DREAMSCOMETRUE              | 2025-03-20                    |
-- +-----------------------------+-------------------------------+
