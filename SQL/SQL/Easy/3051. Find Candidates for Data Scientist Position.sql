

         -- Approach 1. Using - WHERE IN / GROUP BY / HAVING -- 
SELECT candidate_id
FROM candidates 
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(*) = 3
ORDER BY candidate_id;



         -- Approach 2. Using - INTERSECT -- 
SELECT candidate_id FROM candidates WHERE skill = 'Python'
INTERSECT
SELECT candidate_id FROM candidates WHERE skill = 'Tableau'
INTERSECT
SELECT candidate_id FROM candidates WHERE skill = 'PostgreSQL';

