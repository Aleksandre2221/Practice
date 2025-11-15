

         -- Approach 1. Using - GROUP BY / HAVING / Subquery / -- 
SELECT project_id 
FROM project 
GROUP BY project_id
HAVING COUNT(*) = (
    SELECT MAX(cnt) 
    FROM (SELECT COUNT(*) cnt FROM project GROUP BY project_id) sub
  );



         -- Appraoch 2. Using - Subquery with Window Function - RANK() -- 
SELECT project_id 
FROM (
  SELECT project_id, RANK() OVER(ORDER BY COUNT(*) DESC) rnk
  FROM project
  GROUP BY project_id
) sub
WHERE rnk = 1;


