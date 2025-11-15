

         -- Approach 1. Using - CTE with a Window Function - RANK() -- 
WITH ranks AS (
  SELECT *, RANK() OVER(PARTITION BY TO_CHAR(day, 'YYYY-MM-DD') ORDER BY amount DESC) rnk
  FROM transactions 
)
SELECT transaction_id 
FROM ranks  
WHERE rnk = 1
ORDER BY transaction_id;
