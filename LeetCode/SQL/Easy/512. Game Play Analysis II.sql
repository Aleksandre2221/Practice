

        -- Approach 1. Using - DISTINCT ON -- (ONLY in PostgreSQL)
SELECT DISTINCT ON (player_id) player_id, device_id 
FROM activity 
ORDER BY player_id, event_date

  

        -- Approach 2. Using  Subquery and Window Function - ROW_NUMBER() -- 
SELECT player_id, device_id
FROM (
  	SELECT *, ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY event_date) rn
  	FROM activity
) sub 
WHERE rn = 1

        

        -- Approach 3. Using - CTE and Window Function - ROW_NUMBER() -- 
WITH row_num AS (
  SELECT *, ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY event_date) rn
  FROM activity
)
SELECT player_id, device_id
FROM row_num 
WHERE rn = 1



        -- Approach 4. Using - WHERE IN - condition -- 
SELECT player_id, device_id
FROM activity 
WHERE (player_id, event_date) IN (
  SELECT player_id, MIN(event_date) event_date
  FROM activity 
  GROUP BY player_id)






