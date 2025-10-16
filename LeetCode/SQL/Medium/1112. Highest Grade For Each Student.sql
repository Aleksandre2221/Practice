

         -- Approach 1. Using - Subquery with Window Function - ROW_NUMBER() --  
SELECT student_id, course_id, grade 
FROM (
  SELECT *, ROW_NUMBER() OVER(PARTITION BY student_id ORDER BY grade DESC, course_id) rn
  FROM grades
)
WHERE rn = 1;




         -- Appraoch 2. Without Using Window Functions -- 
WITH max_grades AS (
  SELECT student_id, MAX(grade) grade  
  FROM grades  
  GROUP BY student_id
)
SELECT 
    mg.student_id,
    MIN(g.course_id) course_id,
    mg.grade
FROM grades g
JOIN max_grades mg ON (g.student_id, g.grade) = (mg.student_id, mg.grade)
GROUP BY mg.student_id, mg.grade;




         -- Approach 3. Using - DISTINCT ON condition (ONLY PostgreSQL) -- 
SELECT DISTINCT ON (student_id) student_id, course_id, grade
FROM grades
ORDER BY student_id, grade DESC, course_id ASC;




