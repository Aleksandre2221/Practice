

         -- Approach 1. Using - GROUP BY and - COUNT() with - FITER(WHERE...) condition (ONLY PostgreSQL-- 
SELECT ad_id,
	CASE  
    	WHEN COUNT(*) FILTER (WHERE action = 'Clicked') = 0 THEN 0 
        ELSE 
        	ROUND(
            	COUNT(*) FILTER (WHERE action = 'Clicked') * 100.0 / 
                	COALESCE(COUNT(*) FILTER (WHERE action = 'Clicked') + COUNT(*) FILTER (WHERE action = 'Viewed'), 0)
              , 2)
    END ctr   
FROM ads_actions
GROUP BY ad_id;




