

         -- The Best Approach. Using - COUNT(DISTINCT..) with - WHERE condition -- 
SELECT COUNT(DISTINCT customer_id) rich_count 
FROM store
WHERE amount > 500;
