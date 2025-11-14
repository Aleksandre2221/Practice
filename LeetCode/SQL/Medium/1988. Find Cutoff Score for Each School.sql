

         -- The Best Approach. Using - LEFT JOIN -- 
SELECT s.school_id, COALESCE(MIN(e.score), -1) score 
FROM schools s
LEFT JOIN exam e ON s.capacity >= e.student_count 
GROUP BY s.school_id;
