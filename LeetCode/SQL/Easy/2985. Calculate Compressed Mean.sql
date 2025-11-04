

         -- The Best Approach. Using - SUM and - ROUND -- 
SELECT 
	ROUND(
          SUM(item_count * order_occurrences)::numeric / SUM(order_occurrences) 
      , 2) average_items_per_order 
FROM orders;
