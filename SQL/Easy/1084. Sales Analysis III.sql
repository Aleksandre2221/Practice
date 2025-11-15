

         -- Approach 1. Using - NOT IN condition --
SELECT DISTINCT p.product_id, p.product_name
FROM sales s1 
JOIN product p ON p.product_id = s1.product_id 
WHERE p.product_id NOT IN (
  SELECT product_id 
  FROM sales 
  WHERE sale_date NOT BETWEEN '2019-01-01'::date AND '2019-03-31'::date);




         -- Approach 2. Using - NOT EXISTS nodition -- 
SELECT DISTINCT p.product_id, p.product_name
FROM sales s1 
JOIN product p ON p.product_id = s1.product_id 
WHERE p.product_id NOT IN (
  SELECT product_id 
  FROM sales 
  WHERE sale_date NOT BETWEEN '2019-01-01'::date AND '2019-03-31'::date);
