

         -- Approach 1. Using - REGEX (For PostgreSQL) -- 
SELECT user_id, email
FROM Users
WHERE email ~ '^[A-Za-z0-9_]+@[A-Za-z]+\.com$'
ORDER BY user_id;



         -- Approach 2. Using - REGEX (For MySQL) -- 
SELECT user_id, email
FROM Users
WHERE email REGEXP '^[A-Za-z0-9_]+@[A-Za-z]+\\.com$'
ORDER BY user_id;
