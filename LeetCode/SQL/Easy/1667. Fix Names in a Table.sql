

         -- Approach 1. Using - UPPER / LEFT / LOWER / SUBSTRING -- (For PosrgreSQL)   
SELECT user_id, 
    UPPER(LEFT(name, 1)) || LOWER(SUBSTRING(name, 2)) name 
FROM users
ORDER BY user_id;



         -- Approach 2. Using - CONCAT / UPPER / LEFT/ LOWER / SUBSTRING -- (For MySQL)
SELECT user_id, 
    CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2))) AS name
FROM users
ORDER BY user_id;
