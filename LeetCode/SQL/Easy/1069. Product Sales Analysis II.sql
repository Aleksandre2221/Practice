

         -- The Best Approach. Using - GROUP BY with - SUM -- 
SELECT product_id, SUM(quantity) total_quantity
FROM sales 
GROUP BY product_id;
