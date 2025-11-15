

         -- Approach 1. Using Window Function - MIN() and - WHERE conditon --  
SELECT product_id, fy first_year, quantity, price  
FROM (
  SELECT *, MIN(year) OVER(PARTITION BY product_id ORDER BY year) fy
  FROM sales 
) first_year
WHERE year = fy



         -- Approach 2. Using - Subquery with Window Function - DENSE_RANK() and - WHERE condition -- 
SELECT product_id, year first_year, quantity, price  
FROM (
  SELECT *, DENSE_RANK() OVER(PARTITION BY product_id ORDER BY year) fy
  FROM sales 
) first_year
WHERE fy = 1;



       -- Approach 3. Using - Using - CTE with Window Function - DENSE_RANK() -- 
WITH first_year AS (
  SELECT *, DENSE_RANK() OVER(PARTITION BY product_id ORDER BY year) fy
  FROM sales 
)
SELECT product_id, year first_year, quantity, price  
FROM first_year
WHERE fy = 1;
