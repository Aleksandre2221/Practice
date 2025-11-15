

         -- Approach 1. Using - SUM with - FILTER(WHERE...) condition -- (Only PostgreSQL) 
SELECT TO_CHAR(sale_date, 'YYYY-MM-DD') sale_date,
	SUM(sold_num) FILTER (WHERE fruit = 'apples') - SUM(sold_num) FILTER(WHERE fruit = 'oranges') diff
FROM sales 
GROUP BY sale_date;



         -- Approach 2.. Using - SUM with - CASE..WHEN condition -- (SQL Standard) 
SELECT TO_CHAR(sale_date, 'YYYY-MM-DD') sale_date,
	SUM(CASE WHEN fruit = 'apples' THEN sold_num ELSE -sold_num END) diff
FROM sales 
GROUP BY sale_date 
