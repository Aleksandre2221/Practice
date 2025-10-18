

         -- Approach 1. Using - GROUP BY / HAVING / Subquery / -- 
SELECT project_id 
FROM project 
GROUP BY project_id
HAVING COUNT(*) = (
    SELECT MAX(cnt) 
    FROM (SELECT COUNT(*) cnt FROM project GROUP BY project_id)
  );

