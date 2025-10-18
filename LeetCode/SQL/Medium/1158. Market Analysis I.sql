

         -- Approach 1. Using - LEFT JOIN and - GROUP BY -- 
SELECT 
  u.user_id buyer_id, 
  u.join_date,
  COUNT(o.order_id) orders_in_2019
FROM users u
LEFT JOIN orders o ON u.user_id = o.buyer_id 
  AND EXTRACT(YEAR FROM o.order_date) = 2019
GROUP BY u.user_id, u.join_date;



         -- Approach 2. Using - CTE and - LEFT JOIN -- 
WITH valid_buyers AS (
  SELECT o.buyer_id, COUNT(*) orders_in_2019 
  FROM orders o 
  WHERE EXTRACT(YEAR FROM order_date) = 2019
  GROUP BY buyer_id
)
SELECT 
	u.user_id buyer_id,
  u.join_date,
  COALESCE(VB.orders_in_2019, 0) orders_in_2019 
FROM users u 
LEFT JOIN valid_buyers vb ON vb.buyer_id = u.user_id; 




