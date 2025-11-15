

         -- The Best Approach. Using - Subquery with - WHERE BETWEEN condition and - GROUP BY / COUNT(DISTINCT..) --  
SELECT NULLIF(ROUND(AVG(cnt), 2), 0) AS average_sessions_per_user
FROM (
  SELECT COUNT(DISTINCT session_id) cnt 
  FROM activities 
  WHERE activity_date BETWEEN '2019-06-27'::date AND '2019-07-27'::date
  GROUP BY user_id
) sub;
