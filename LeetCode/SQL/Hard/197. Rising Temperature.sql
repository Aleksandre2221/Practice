

      -- Appraoch 1. Using - CTE - and Window Functions - LAG() / LEAD() -- 
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

  

      -- Approach 2. Using - CASE...WHEN - and Window Functions - LAG() / LEAD() -- 
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
