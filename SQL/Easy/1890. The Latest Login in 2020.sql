

         -- Approach 1. Using - GROUP BY -- 
SELECT user_id, 
    MAX(time_stamp) last_stamp
FROM logins 
WHERE EXTRACT(YEAR FROM time_stamp) = '2020'
GROUP BY user_id;



         -- Approach 2. Without - GROUP BY, using - DISTINCT ON -- (Only PostgreSQL) 
SELECT DISTINCT ON (user_id)
    user_id,
    time_stamp last_stamp
FROM logins
WHERE time_stamp >= '2020-01-01' AND time_stamp < '2021-01-01'
ORDER BY user_id, time_stamp DESC;
