

         -- The Best Approach. Using - JOIN / GROUP BY / SUM -- 
SELECT user_Id, SUM(p.price * S.quantity) spending   
FROM sales s 
JOIN product p ON p.product_id = s.product_id 
GROUP BY s.user_id
ORDER BY spending DESC, user_Id;
