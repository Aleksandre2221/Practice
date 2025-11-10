

         -- Approach 1. Using - REGEX (For PostgreSQL) -- 
SELECT *
FROM Products
WHERE name ~ '[0-9]{3}';




         -- Approach 2. Using - REGEXP (For MySQL) -- 
SELECT *
FROM Products
WHERE name REGEXP '[0-9]{3}';
