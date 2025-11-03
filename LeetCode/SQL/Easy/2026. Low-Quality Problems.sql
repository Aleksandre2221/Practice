

         -- The Best Approach. Using - WHERE condition --  
SELECT problem_id
FROM problems
WHERE likes * 100.0 / (likes + dislikes) < 60
ORDER BY problem_id;
