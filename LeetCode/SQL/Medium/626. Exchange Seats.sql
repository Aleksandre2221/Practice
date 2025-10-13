

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


  

          -- Approach 3. Using only - CASE....WHEN condition without - COALESCE -- 
SELECT
	CASE
		WHEN id % 2 = 1 AND id + 1 <= (SELECT MAX(id) FROM seat) THEN id + 1 
		WHEN id % 2 = 0 THEN id - 1
		ELSE id
	END AS id,
	student
FROM seat
ORDER BY id









