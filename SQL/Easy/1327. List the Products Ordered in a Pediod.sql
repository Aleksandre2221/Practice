

         -- Approach 1. Using - JOIN / WHERE / GROUP BY / HAVING -- 
SELECT p.product_name, SUM(o.unit) unit
FROM products p 
JOIN orders o ON o.product_id = p.product_id
WHERE TO_CHAR(o.order_date, 'YYYY-MM') = '2020-02'
GROUP BY p.product_name 
HAVING SUM(o.unit) >= 100;



         -- Approach 2. Without using - TO_CHAR() -- 
SELECT p.product_name, SUM(o.unit) unit
FROM products p
JOIN orders o ON o.product_id = p.product_id
WHERE o.order_date >= '2020-02-01'::date 
  AND o.order_date <  '2020-03-01'::date
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;
