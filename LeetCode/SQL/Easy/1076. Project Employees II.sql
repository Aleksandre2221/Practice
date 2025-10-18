

         -- Approach 1. Using - GROUP BY / ORDER BY / LIMIT -- 
SELECT project_id 
FROM project 
GROUP BY project_id
ORDER BY COUNT(*) DESC 
LIMIT 1;

