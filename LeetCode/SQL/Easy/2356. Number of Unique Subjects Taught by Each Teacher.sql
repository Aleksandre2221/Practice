

         -- The Best Approach. Using - GROUP BY with - COUNT(DISTINCT..) --  
SELECT teacher_id, COUNT(DISTINCT subject_id) cnt 
FROM teacher
GROUP BY teacher_id;
