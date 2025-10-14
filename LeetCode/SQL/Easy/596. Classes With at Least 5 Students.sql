

         -- Approach 1. Using - GROUP BY wuth - HAVING -- 
SELECT class 
FROM courses
GROUP BY class
HAVING COUNT(*) >= 5
