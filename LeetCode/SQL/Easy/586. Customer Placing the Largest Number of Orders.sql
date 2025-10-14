

         -- Approach 1. Using - COUNT(*) within - ORDER BY clause --   
SELECT customer_number
FROM orders 
GROUP BY customer_number
ORDER BY COUNT(*) DESC 
LIMIT 1;



         -- Approach 2. Using - TOP - (only fro - SQL Server / T-SQL) -- 
SELECT TOP 1
FROM orders 
GROUP BY customer_number
ORDER BY COUNT(*) DESC;



         -- Approach 3. Using - Subquery with - Window Function - RANK() -- 
SELECT customer_number
FROM (
  SELECT customer_number,
    ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) rn
  FROM orders
  GROUP BY customer_number
) ranked
WHERE rn = 1;
