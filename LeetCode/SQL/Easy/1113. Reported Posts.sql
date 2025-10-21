

         -- Approach 1. Using multiple - WHERE conditions with - GROUP BY and - COUNT(DISTINCT..) --  
SELECT extra, COUNT(DISTINCT post_id) report_count
FROM actions
WHERE 
	action_date = '2019-07-04'::date 
	AND extra IS NOT NULL 
GROUP BY extra;
