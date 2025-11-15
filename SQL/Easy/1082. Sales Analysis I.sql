

         -- Approach 1. Using - Subqury with Window Function - RANK -- 
SELECT seller_id 
FROM (
  SELECT seller_id, RANK() OVER(ORDER BY SUM(price) DESC ) rnk  
  FROM sales
  GROUP BY seller_id
)
WHERE rnk = 1;



         -- Approach 2. Using - GROUP BY / HAVING and two - Subqueries -- 
SELECT seller_id 
FROM sales 
GROUP BY seller_id 
HAVING SUM(price) = (
  SELECT MAX(total_sold)
  FROM (SELECT SUM(price) total_sold FROM sales GROUP BY seller_id) sub 
  );
