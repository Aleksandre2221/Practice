

    -- VAR 1. Using Window Function - LEAD() - and condutuion in WHERE --  
SELECT DISTINCT num AS ConsecutiveNums
FROM logs
WHERE num IN (
  SELECT 
    CASE
      WHEN num = LEAD(num, 1) OVER(ORDER BY id) 
      AND num = LEAD(num, 2) OVER(ORDER BY id) THEN num
  END
 FROM logs) 

  

    -- VAR 2. Using Window Function - LEAD() - and CTE --
WITH cte AS (
    SELECT num,
        LEAD(num, 1) OVER() num1,
        LEAD(num, 2) OVER() num2
    FROM logs
)
SELECT DISTINCT num ConsecutiveNums 
FROM cte 
WHERE num = num1 AND num = num2


  
    -- VAR 3. Using Window Functions - LEAD() and LAG() --
SELECT DISTINCT num AS ConsecutiveNums
FROM logs
WHERE num IN (
SELECT
    CASE 
        WHEN num = LAG(num) OVER() 
        AND num = LEAD(num) OVER() THEN num
    END ConsecutiveNums 
FROM logs) 


  
    -- VAR 4. Without Window Functions --
SELECT DISTINCT num ConsecutiveNums
FROM logs
WHERE (id + 1, num) IN (SELECT * FROM logs) 
    AND (id + 2, num) IN (SELECT * FROM logs)






