

         -- Approach 1. Using - COUNT (skip NULL values automatically) --
SELECT d.dept_name, 
       COUNT(s.student_id) AS student_number
FROM department d
LEFT JOIN student s ON s.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY student_number DESC, d.dept_name;




         -- Approach 2. Using - SUM with - CASE...WHEN -- 
SELECT d.dept_name, 
    SUM(CASE WHEN student_id IS NULL THEN 0 ELSE 1 END) student_number 
FROM department d
LEFT JOIN student s ON s.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY student_number DESC, d.dept_name
