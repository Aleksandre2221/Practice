

         -- Approach 1. Using - GROUP BY with - LOWER(TRIM(...)) and - TO_CHAR -- 
SELECT 
  LOWER(TRIM(product_name)) AS product_name,
  TO_CHAR(sale_date, 'YYYY-MM') AS sale_date,
  COUNT(*) AS total
FROM sales
GROUP BY LOWER(TRIM(product_name)), TO_CHAR(sale_date, 'YYYY-MM')
ORDER BY product_name, sale_date;



         -- Approach 2. Using - Subquery -- 
SELECT product_name, sale_date, COUNT(*) total 
FROM (
  SELECT 
  	LOWER(TRIM(product_name)) product_name, 
  	TO_CHAR(sale_date, 'YYYY-MM') sale_date 
  FROM sales
) sub 
GROUP BY product_name, sale_date 
ORDER BY product_name, sale_date; 




         -- Approach 3. Using - CTE -- 
WITH formatting AS (
  SELECT 
  	LOWER(TRIM(product_name)) product_name, 
  	TO_CHAR(sale_date, 'YYYY-MM') sale_date 
  FROM sales
)
SELECT product_name, sale_date, COUNT(*) total 
FROM formatting
GROUP BY product_name, sale_date 
ORDER BY product_name, sale_date; 






