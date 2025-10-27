

         -- Approach 1. Using - REGEX (in PostgreSQL) -- 
SELECT *
FROM users
WHERE mail ~ '^[a-zA-Z]+[a-zA-Z0-9_.-]*@leetcode\.com$';




         -- Approach 2. Using - REGEX (in MySQL) -- 
SELECT *
FROM users
WHERE mail REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode[.]com';
