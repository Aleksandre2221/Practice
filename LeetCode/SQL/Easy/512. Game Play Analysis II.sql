

        -- Approach 1. Using - DISTINCT ON -- (ONLY in PostgreSQL)
SELECT DISTINCT ON (player_id) player_id, device_id 
FROM activity 
ORDER BY player_id, event_date

  

        -- Approach 2. Using  Window Function - ROW_NUMBER() -- 
SELECT player_id, device_id
FROM (
  	SELECT *, 
  		ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY event_date) rn
  	FROM activity
) sub 
WHERE rn = 1
