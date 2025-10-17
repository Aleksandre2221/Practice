

         -- Approach 1. Using - Subquery with - LEFT JOIN / GROUP BY / COUNT(DISTINCT...) --   
SELECT ROUND(AVG(romove_rate), 2) avg_remove_rate 
FROM (
  SELECT COUNT(DISTINCT r.post_id) * 100.0 / COUNT(DISTINCT a.post_id) romove_rate
  FROM actions a
  LEFT JOIN removals r ON r.post_id = a.post_id
  WHERE a.extra = 'spam'
  GROUP BY a.action_date
) sub; 



         -- Approach 2. Using - CTE -- 
WITH daily_rate AS (
    SELECT a.action_date,
        COUNT(DISTINCT r.post_id) * 100.0 / COUNT(DISTINCT a.post_id) remove_rate
    FROM actions a
    LEFT JOIN removals r ON r.post_id = a.post_id
    WHERE a.extra = 'spam'
    GROUP BY a.action_date
)
SELECT ROUND(AVG(romove_rate), 2) avg_remove_rate 
FROM daily_rate;
