

         -- Approach 1. Using - GROUP BY and - HAVING with multiple conditions -- 
SELECT c.customer_id, c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING 
    SUM(CASE WHEN o.product_name = 'A' THEN 1 ELSE 0 END) > 0 AND
    SUM(CASE WHEN o.product_name = 'B' THEN 1 ELSE 0 END) > 0 AND
    SUM(CASE WHEN o.product_name = 'C' THEN 1 ELSE 0 END) = 0;



         -- Approach 2. Using - WHERE with multiple - IN / NOT IN conditions -- 
SELECT customer_id, customer_name
FROM customers
WHERE  
	customer_id IN (SELECT customer_id FROM orders WHERE product_name = 'A') AND 
	customer_id IN (SELECT customer_id FROM orders WHERE product_name = 'B') AND 
  customer_id NOT IN (SELECT customer_id FROM orders WHERE product_name = 'C')
