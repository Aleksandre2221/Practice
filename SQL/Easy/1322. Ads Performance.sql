

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




           -- Approach 2. Using - CTE and - COUNT with (CASE....WHEN) condionts -- 
WITH ad_stats AS (
    SELECT ad_id,
        COUNT(CASE WHEN action = 'Clicked' THEN 1 END) total_clicked,
        COUNT(CASE WHEN action = 'Viewed'  THEN 1 END) total_viewed
    FROM ads_actions
    GROUP BY ad_id
)
SELECT ad_id,
    CASE 
        WHEN total_clicked = 0 THEN 0
        ELSE ROUND(total_clicked * 100.0 / (total_clicked + total_viewed), 2)
    END AS ctr
FROM ad_stats;




