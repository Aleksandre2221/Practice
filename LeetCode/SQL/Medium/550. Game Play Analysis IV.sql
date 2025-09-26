

        -- Approach 1. Using - CTE - with Window Functions - ROW_NUMBER / LEAD
WITH t1 AS (
  SELECT *, ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY event_date) AS rn,
	LEAD(event_date) OVER(PARTITION BY player_id) - event_date AS date_diff
	FROM activity
)
SELECT 
	ROUND(
			COUNT(*) FILTER(WHERE rn = 1 AND date_diff = 1)::numeric / COUNT(DISTINCT player_id)
		, 2) AS fraction 
FROM t1 

  
        -- Approach 2. Using only - CTE - without Window Functions -- 
WITH 
	min_date AS (
      SELECT player_id, MIN(event_date) min_date
      FROM activity 
      GROUP BY player_id),
      
    cons_cnt AS (
        SELECT COUNT(*) as cnt
        FROM activity act
        JOIN min_date md ON md.player_id = act.player_id AND act.event_date = md.min_date + 1)
  
 SELECT ROUND(
   		cons_cnt.cnt::numeric / (SELECT COUNT(DISTINCT player_id) FROM activity)
   		, 2) fraction
 FROM cons_cnt





