

         -- The Best Approach. Using - WHERE condition -- 
SELECT DISTINCT author_id id
FROM views
WHERE author_id = viewer_id
ORDER BY id; 
