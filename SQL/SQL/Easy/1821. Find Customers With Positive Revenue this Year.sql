

         -- The Best Approach. Using - WHERE / GROUP BY / HAVING -- 
SELECT customer_id 
FROM customers
WHERE year = 2021
GROUP BY customer_id
HAVING SUM(revenue) > 0;
