

         -- Approach 1. Using - GROUP BY with - HAVING condition -- 
SELECT customer_id
FROM customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM product);
