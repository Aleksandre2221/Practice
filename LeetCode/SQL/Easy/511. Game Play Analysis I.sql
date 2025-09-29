

        -- Approach 1. Using - Subquery -- 
SELECT *
FROM (
SELECT player_id, MIN(event_date) first_login
FROM activity 
GROUP BY player_id
) sub


        -- Approach 2. Using - CTE - 
WITH first_logins AS (
    SELECT player_id, MIN(event_date) AS first_login
    FROM activity
    GROUP BY player_id
)
SELECT *
FROM first_logins;


         -- Approach 3. Using Window Function - MIN -- 
SELECT DISTINCT player_id,
       MIN(event_date) OVER (PARTITION BY player_id) AS first_login
FROM activity;


         -- Approach 4. Using - DISTINCT ON - Only in PostgreSQL! -- 
SELECT DISTINCT ON (player_id) player_id, event_date AS first_login
FROM activity
ORDER BY player_id, event_date;








