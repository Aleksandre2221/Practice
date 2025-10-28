

         -- Approach 1. Using - NOT EXISTS condition -- 
SELECT s.seller_name 
FROM seller s
WHERE NOT EXISTS (
  SELECT 1 
  FROM orders o 
  WHERE o.seller_id = s.seller_id 
    AND EXTRACT(YEAR FROM o.sale_date) = 2020
);


