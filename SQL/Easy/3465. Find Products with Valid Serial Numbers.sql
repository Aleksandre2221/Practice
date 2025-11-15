

          -- Approach 1. Using - REGEX (For PostgreSQL) -- 
SELECT *
FROM products
WHERE description ~ '\mSN[0-9]{4}-[0-9]{4}\M'
ORDER BY product_id;



         -- Approach 2. Using - REGEX (For MySQL) -- 
SELECT *
FROM products
WHERE description REGEXP '(?-i)\\bSN[0-9]{4}-[0-9]{4}\\b'
ORDER BY product_id;
