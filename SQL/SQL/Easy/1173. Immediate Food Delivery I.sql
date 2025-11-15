

         -- Approach 1. Using - COUNT with - FILTER -- 
SELECT ROUND
          (COUNT(*) FILTER(WHERE order_date = customer_pref_delivery_date)::numeric / COUNT(*) 
      , 2) AS immediate_percentage
FROM Delivery;



         -- Approach 2. Using two - Subqueries -- 
SELECT ROUND(
  	(SELECT COUNT(*) immediate_cnt FROM delivery WHERE order_date = customer_pref_delivery_date)::numeric / 
  		(SELECT COUNT(*) total_cnt FROM delivery)
  , 2) immediate_percentage;

