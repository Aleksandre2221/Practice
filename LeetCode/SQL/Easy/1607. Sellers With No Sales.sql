

         -- Approach 1. Using - NOT EXISTS condition -- 
SELECT s.seller_name 
FROM seller s
WHERE NOT EXISTS (
  SELECT 1 
  FROM orders o 
  WHERE o.seller_id = s.seller_id 
    AND EXTRACT(YEAR FROM o.sale_date) = 2020
);



         -- Approach 2. Using - NOT IN condition -- 
SELECT s.seller_name 
FROM seller s
WHERE s.seller_id NOT IN (
  SELECT seller_id  
  FROM orders 
  WHERE EXTRACT(YEAR FROM sale_date) = 2020
);


