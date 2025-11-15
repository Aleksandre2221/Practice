

         -- Approach 1. Using - WHERE NOT EXISTS condition -- 
SELECT *
FROM orders o
WHERE 
  NOT EXISTS (
    SELECT 1
    FROM Orders o2
    WHERE o2.customer_id = o.customer_id AND o2.order_type = 0
  )
  OR o.order_type = 0;



         -- Approach 2. Using - CTE -- 
WITH type_o AS (
  SELECT DISTINCT customer_id, 
      CASE  
          WHEN customer_id IN (SELECT DISTINCT customer_id FROM orders WHERE order_type = 0) THEN 0 
          ELSE 1 
      END order_type
   FROM orders
)
SELECT o.order_id, o.customer_id, t.order_type
FROM type_o t  
JOIN orders o ON o.customer_id = t.customer_id AND o.order_type = t.order_type;

