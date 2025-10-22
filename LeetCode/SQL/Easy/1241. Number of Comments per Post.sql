

         -- The Best Approach. Using - CTE and - LEFT JOIN -- 
WITH posts AS (
    SELECT DISTINCT sub_id AS post_id
    FROM submissions
    WHERE parent_id IS NULL
)
SELECT p.post_id, 
	COUNT(DISTINCT s.sub_id) number_of_comments 
FROM posts p
LEFT JOIN submissions s ON p.post_id = s.parent_id
GROUP BY p.post_id
ORDER BY p.post_id;
