
            -- Warning: You cant substract dates directly in all RDBMS, is some of them you have to use function - DATEDIFF -- 



      -- Appraoch 1. Using - CTE - and Window Functions - LAG() / LEAD() -- (For - PostgreSQL/Oracle)
WITH prev_day_temp AS (
    SELECT *,
        LAG(temperature) OVER(ORDER BY recordDate) prev_temp,
        LAG(recordDate) OVER(ORDER BY recordDate) prev_day
    FROM weather
)
SELECT id
FROM prev_day_temp
WHERE recordDate - prev_day = 1 
    AND temperature > prev_temp


      
      -- Approach 2. Using - CTE - and Window Functions - LAG() / LEAD() -- (For - MySQL/SQL Server)
WITH prev_day_temp AS (
    SELECT *,
        LAG(temperature) OVER(ORDER BY recordDate) prev_temp,
        LAG(recordDate) OVER(ORDER BY recordDate) prev_day
    FROM weather
)
SELECT id
FROM prev_day_temp
WHERE DATEDIFF(recordDate, prev_day) = 1 
    AND temperature > prev_temp

      

      -- Approach 3. Using - CASE...WHEN - and Window Functions - LAG() / LEAD() -- (For - PostgreSQL/Oracle)
SELECT id
FROM (
    SELECT id,
           CASE 
               WHEN recordDate - LAG(recordDate) OVER (ORDER BY recordDate) = 1
                AND temperature > LAG(temperature) OVER (ORDER BY recordDate)
               THEN 1 
               ELSE 0
           END AS is_increasing
    FROM weather
) AS check_temp
WHERE is_increasing = 1;



      -- Approach 4. Using - Self-Join -- 
SELECT w2.id
FROM weather w1
JOIN weather w2
    ON w2.recordDate = DATE_ADD(w1.recordDate, INTERVAL '1 DAY')
        AND w2.temperature > w1.temperature

      
            
                  






