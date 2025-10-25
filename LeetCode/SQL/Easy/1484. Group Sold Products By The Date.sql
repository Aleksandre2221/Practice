

         -- Approach 1. Using - STRING_AGG (ONLY PostgreSQL) -- 
SELECT sell_date, 
    COUNT(DISTINCT product) num_sold, 
    STRING_AGG(DISTINCT product, ',') products 
FROM activities
GROUP BY sell_date
ORDER BY sell_date;



         -- Approach 2. Using - GROUP_CONCAT (for other RDBMS) --
SELECT sell_date, 
    COUNT(DISTINCT product) num_sold, 
    GROUP_CONCAT(DISTINCT product) products 
FROM activities
GROUP BY sell_date
ORDER BY sell_date;
