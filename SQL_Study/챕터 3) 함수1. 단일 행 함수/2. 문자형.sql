SELECT LEFT('SQL', 3)
	, RIGHT('SQL 완전정복', 4)
    , SUBSTR('SQL 완전정복', 2, 5)
    , SUBSTR('SQL 완전정복', 2);
    
SELECT SUBSTRING_INDEX('서울시 동작구 흑석로', ' ', 2)
	 , SUBSTRING_INDEX('서울시 동작구 흑석로', ' ', -2);
     
SELECT LPAD('SQL', 10, '0'), RPAD('SQL', 5, '&');

SELECT LENGTH(LTRIM(' SQL '))
	 , LENGTH(RTRIM(' SQL '))
     , LENGTH(TRIM(' SQL '));
     
SELECT TRIM(BOTH 'abc' FROM 'abcXXXXXXabc')
	 , TRIM(LEADING 'abc' FROM 'abcXXXXXXabc')
     , TRIM(TRAILING 'abc' FROM 'abcXXXXXXabc');
     
SELECT FIELD('JAVA', 'SQL', 'JAVA', 'C')
	, FIND_IN_SET('JAVA', 'SQL,JAVA,C')
	, INSTR('네 인생을 살아라', '인생')
    , LOCATE('인생', '네 인생을 살아라');
    
SELECT ELT(2, 'SQL', 'JAVA', 'C');

SELECT REPEAT('*', 5);
SELECT REPLACE('010.1234.1234', '.', '-');
SELECT REVERSE('OLLEH')

