

         -- Approach 1. Using - GROUP BY wuth - HAVING -- 
SELECT class 
FROM courses
GROUP BY class
HAVING COUNT(*) >= 5


         -- Approach 2. Using - Subquery and - WHERE - condition -- 
SELECT class
FROM (
  SELECT class, COUNT(*) AS total
  FROM courses
  GROUP BY class
) AS sub
WHERE total >= 5;

