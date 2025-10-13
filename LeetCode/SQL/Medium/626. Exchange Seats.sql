

          -- Approach 1. Using - Subquery with - CASE...WHEN - condition -- 
SELECT id, COALESCE(swapped, student) student
FROM (
  SELECT id, student, 
      CASE
          WHEN id % 2 = 0 THEN LAG(student) OVER(ORDER BY id)
          WHEN id % 2 = 1 THEN LEAD(student) OVER(ORDER BY id)  
      END swapped
  FROM seat)

  


          -- Approach 2. Using - Subquery and - CASE...WHEN condition within - COALESCE --  
SELECT id, 
	COALESCE(
      	(CASE WHEN id % 2 = 0 THEN LAG(student) OVER(ORDER BY id) ELSE LEAD(student) OVER(ORDER BY id) END),
      	(SELECT student FROM seat ORDER BY id DESC LIMIT 1) 
    ) student 
FROM seat 









