

         -- Approach 1. Using - UNION ALL -- 
SELECT id, COUNT(*) num  
FROM (
  	SELECT accepter_id id FROM requestaccepted
  	UNION ALL  
  	SELECT requester_id id FROM requestaccepted
)
GROUP BY id  
ORDER BY num DESC  
LIMIT 1
