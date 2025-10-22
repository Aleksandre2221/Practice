

         -- Approach 1. Using - CTE with - GROUP BY, - JOIN -- 
WITH first_order AS (
    SELECT customer_id, MIN(order_date) first_order 
    FROM delivery 
    GROUP BY customer_id
)
SELECT 
    ROUND(
            COUNT(*) FILTER(WHERE first_order = customer_pref_delivery_date) * 100.0 / COUNT(*)
        , 2) immediate_percentage 
FROM delivery d 
JOIN first_order fo ON d.customer_id = fo.customer_id AND d.order_date = fo.first_order;




         -- Approach 2. Using - CTE with Window Function - ROW_NUMBER(), and - WHERE condition insted of - JOIN -- 
WITH ranking AS(
  SELECT *, ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) rnk
  FROM delivery
)
SELECT
	ROUND(
			COUNT(*) FILTER(WHERE order_date_rnk = 1 AND order_date = customer_pref_delivery_date) * 100.00 / COUNT(*)
		 , 2) AS immediate_percentage
FROM ranking
WHERE rnk = 1;




