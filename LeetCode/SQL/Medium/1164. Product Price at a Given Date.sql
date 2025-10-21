

         -- Approach 1. Using two - CTE and two - LEFT JOIN --
WITH 
	filtred_data AS (
      SELECT product_id, MAX(change_date) valid_date
      FROM products 
      WHERE change_date <= '2019-08-16'::date
      GROUP BY product_id
	),
    
    all_products AS (
      SELECT product_id 
      FROM products 
      GROUP BY product_id
     )
     
SELECT COALESCE(fd.product_id, ap.product_id) product_id, COALESCE(p.new_price, 10) price
FROM all_products ap 
LEFT JOIN filtred_data fd ON fd.product_id = ap.product_id
LEFT JOIN products p ON p.product_id = fd.product_id AND p.change_date = fd.valid_date;




          -- Approach 2. Using a - CTE with Window Function - ROW_NUMBER() and - UNION -- 
WITH row_num AS(
    SELECT *, ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY change_date desc) AS rn
FROM products
WHERE change_date<='2019-08-16')

SELECT product_id, new_price AS price
FROM row_num
WHERE rn = 1
UNION
SELECT product_id, 10 AS price
FROM products
WHERE product_id NOT IN (SELECT product_id FROM row_num);
