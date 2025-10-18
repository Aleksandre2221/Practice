

         -- Approach 1. Using - CTE -- 
WITH groupped AS (
  SELECT article_id, viewer_id, view_date
  FROM articleview 
  GROUP BY article_id, viewer_id, view_date 
)
SELECT viewer_id 
FROM groupped  
GROUP BY viewer_id, view_date
HAVING COUNT(*) > 1;




       -- Approach 2. Using - DISTINCT ON condition (ONLY PostgreSQL) -- 
SELECT viewer_id 
FROM (SELECT DISTINCT ON (viewer_id, article_id) * FROM articleview) sub 
GROUP BY viewer_id, view_date
HAVING COUNT(*) > 1;
