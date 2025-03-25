SELECT CEILING(123.56)
	 , FLOOR(123.56)
     , ROUND(123.56)
     , ROUND(123.56, 1)
     , TRUNCATE(123.56, 1);
     
SELECT ABS(-120)
	 , ABS(120)
     , SIGN(-120)
     , SIGN(120);
     
SELECT MOD(203, 4);

SELECT POWER(2, 3)
	 , SQRT(16)
     , RAND()
     , RAND(100)
     , ROUND(RAND() * 100);