 SELECT 고객번호,
	    고객회사명,
		담당자명,
        마일리지
FROM 고객
WHERE 마일리지 = (SELECT MAX(마일리지) 
				FROM 고객
                );
                
SELECT 고객회사명,	
       담당자명
FROM 고객
WHERE 고객번호 = (SELECT 고객번호
				FROM 주문
                WHERE 주문번호 = 'H0250'
				);
                
SELECT 담당자명,
	   고객회사명,
       마일리지
FROM 고객
WHERE 마일리지 > (SELECT MIN(마일리지)
				FROM 고객
                WHERE 도시 = '부산광역시');