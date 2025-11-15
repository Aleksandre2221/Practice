

         -- Approach 1. Using - CROSS JOIN / LEFT JOIN / GROUP BY -- 
SELECT st.student_id, st.student_name, sub.subject_name, 
    COUNT(ex.student_id) AS attended_exams
FROM students st
CROSS JOIN subjects sub
LEFT JOIN examinations ex 
	ON ex.student_id = st.student_id AND ex.subject_name = sub.subject_name
GROUP BY st.student_id, st.student_name, sub.subject_name
ORDER BY st.student_id, sub.subject_name;




         -- Apprpach 2. Using - CROSS JOIN and - Subquery within - LEFT JOIN without - GROUP BY -- 
SELECT st.student_id, st.student_name, sub.subject_name, 
	COALESCE(sub_cnt.cnt, 0) attended_exams 
FROM students st
CROSS JOIN subjects sub
LEFT JOIN (
  SELECT student_id, subject_name, COUNT(*) cnt
  FROM examinations 
  GROUP BY student_id, subject_name
) sub_cnt ON sub_cnt.subject_name = sub.subject_name AND sub_cnt.student_id = st.student_id
ORDER BY st.student_id, sub.subject_name;  




         -- Approach 3. Using - two - CTE and - LEFT JOIN --
WITH 
	students_subjects AS 
		(SELECT *
		 FROM students, subjects
		 ORDER BY student_id, subject_name),

	attendances AS 
		(SELECT student_id, subject_name, COUNT(*) attendances_cnt
		 FROM examinations 
		 GROUP BY student_id, subject_name
		 ORDER BY student_id, subject_name)

SELECT ss.student_id, ss.student_name, ss.subject_name, 
    COALESCE(a.attendances_cnt, 0) AS attended_exams
FROM students_subjects ss
LEFT JOIN attendances a 
  ON a.student_id = ss.student_id AND a.subject_name = ss.subject_name
