

         -- Approach 1. My first solution using - CTE / CASE...WHEN / LEFT JOIN -- 
WITH child_cnt AS (
  SELECT p_id, COUNT(*) 
  FROM tree
  WHERE p_id IS NOT NULL 
  GROUP BY p_id)
  
SELECT tree.id, 
	CASE  
    	WHEN tree.p_id IS NULL THEN 'Root'
        WHEN child_cnt.p_id IS NULL THEN 'Leaf'
        ELSE 'Inner'
    END type 
FROM tree  
LEFT JOIN child_cnt ON tree.id = child_cnt.p_id;
