

         -- The Best Approach Using - WHERE BETWEEN condition with - GROUP BY -- 
SELECT activity_date as "day", COUNT(DISTINCT user_id) active_users
FROM activity
WHERE activity_date BETWEEN '2019-07-27'::date - INTERVAL '29 DAYS' AND '2019-07-27'::date
GROUP BY activity_date;
