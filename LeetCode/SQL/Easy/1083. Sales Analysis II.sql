

         -- Approach 1. Using - NOT IN condition --
SELECT buyer_id, product_name 
FROM sales s 
JOIN product p ON p.product_id = s.product_id
WHERE product_name = 'S8' 
	AND buyer_id NOT IN (
      SELECT buyer_id 
      FROM product p 
      JOIN sales s ON s.product_id = p.product_id 
      WHERE p.product_name = 'iPhone'
    );




         -- Approach 2. Using - NOT EXISTS condition -- 
SELECT DISTINCT s1.buyer_id, p1.product_name
FROM sales s1
JOIN product p1 ON p1.product_id = s1.product_id
WHERE p1.product_name = 'S8'
  AND NOT EXISTS (
    SELECT 1
    FROM sales s2
    JOIN product p2 ON p2.product_id = s2.product_id
    WHERE p2.product_name = 'iPhone'
      AND s2.buyer_id = s1.buyer_id
  );




         -- Approach 3. Using - CTE -- 
WITH s8_buyers AS (
  SELECT DISTINCT buyer_id
  FROM sales s
  JOIN product p ON p.product_id = s.product_id
  WHERE p.product_name = 'S8'
),
iphone_buyers AS (
  SELECT DISTINCT buyer_id
  FROM sales s
  JOIN product p ON p.product_id = s.product_id
  WHERE p.product_name = 'iPhone'
)
SELECT s8.buyer_id, 'S8' AS product_name
FROM s8_buyers s8
WHERE s8.buyer_id NOT IN (SELECT buyer_id FROM iphone_buyers);





