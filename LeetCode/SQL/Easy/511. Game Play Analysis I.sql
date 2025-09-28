

        -- Approach 1. Using - Subquery -- 
SELECT *
FROM (
SELECT player_id, MIN(event_date) first_login
FROM activity 
GROUP BY player_id
) sub


        -- Approach 2. Using - CTE -- 
WITH first_logins AS (
    SELECT player_id, MIN(event_date) AS first_login
    FROM activity
    GROUP BY player_id
)
SELECT *
FROM first_logins;









