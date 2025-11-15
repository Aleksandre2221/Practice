

         -- The Best Approach. Using - GROUP BY with - HAVING condition --  
SELECT order_id 
FROM ordersdetails 
GROUP BY order_id 
HAVING MAX(quantity) > (SELECT avg(quantity) FROM ordersdetails);
