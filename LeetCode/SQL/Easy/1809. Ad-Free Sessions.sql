

         -- Approach 1. Using - LEFT JOIN with multiple conditions and - WHERE condition -- 
SELECT p.session_id
FROM playback p  
LEFT JOIN ads a 
	ON a.customer_id = p.customer_id 
  AND a.timestamp BETWEEN p.start_time AND p.end_time
WHERE a.ad_id IS NULL;



         -- Approach 2. Using - NOT EXISTS condition -- 
SELECT p.session_id
FROM playback p
WHERE NOT EXISTS (
    SELECT 1
    FROM ads a
    WHERE a.customer_id = p.customer_id
      AND a.timestamp BETWEEN p.start_time AND p.end_time
);
