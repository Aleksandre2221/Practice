

         -- Approach 1. Using - CTE with Window Function - ROW_NUMBER() -- 
WITH rn AS (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date DESC) row_num 
    FROM orders
)
SELECT c.name, c.customer_id, rn.order_id, rn.order_date
FROM rn 
JOIN customers c ON c.customer_id = rn.customer_id
WHERE row_num <= 3
ORDER BY name, customer_id, order_date DESC;




         -- Approach 2. Using - Subquery -- 
SELECT c.name, c.customer_id, o.order_id, o.order_date
FROM (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date DESC) rn
    FROM orders
) o
JOIN customers c ON c.customer_id = o.customer_id
WHERE o.rn <= 3
ORDER BY c.name, c.customer_id, o.order_date DESC;




         -- Approach 3. Using - Correlated Subquery -- 
SELECT c.name, c.customer_id, o.order_id, o.order_date
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
WHERE (
    SELECT COUNT(*)
    FROM orders o2
    WHERE o2.customer_id = o.customer_id AND o2.order_date > o.order_date
) < 3
ORDER BY c.name, o.customer_id, o.order_date DESC;
