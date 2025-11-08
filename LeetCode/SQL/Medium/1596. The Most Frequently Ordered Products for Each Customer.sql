

         -- Approach 1. Using - Sunquery with Window Function - RANK() -- 
SELECT customer_id, sub.product_id, product_name 
FROM (
    SELECT customer_id, product_id, 
  		RANK() OVER(PARTITION BY customer_id ORDER BY COUNT(*) DESC) rn
    FROM orders 
  	GROUP BY customer_id, product_id
) sub  
JOIN products p ON p.product_id = sub.product_id
WHERE rn = 1;




         -- Approach 2. Using two - CTE --  
WITH 
	product_cnt AS (
       	SELECT o.customer_id, p.product_id, p.product_name, COUNT(*) cnt 
  		  FROM orders o 
        JOIN products p ON p.product_id = o.product_id
        GROUP BY o.customer_id, p.product_id, p.product_name
	), 
    max_product_cnt AS (
      	SELECT *, MAX(cnt) OVER(PARTITION BY customer_id) max_cnt 
      	FROM product_cnt 
) 
SELECT customer_id, product_id, product_name 
FROM max_product_cnt
WHERE cnt = max_cnt;




