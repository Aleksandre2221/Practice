

      -- Approach 1. Using - WHERE IN - condition -- 
SELECT name
FROM employee
WHERE id IN (
    SELECT managerid
    FROM employee
    GROUP BY managerid
    HAVING COUNT(*) >= 5
)


        -- Appraoch 2. Using - Self-Join -- 
SELECT e1.name
FROM Employee e1
JOIN employee e2 ON e1.id = e2.managerid
GROUP BY e1.id, e1.name
HAVING COUNT(*) >= 5


  
        -- Approach 3. Using - WHERE EXISTS - condition -- 
SELECT e1.name
FROM employee e1
WHERE EXISTS (
  SELECT 1
  FROM employee e2
  WHERE e2.managerid = e1.id
  GROUP BY e2.managerid 
  HAVING COUNT(*) >=5
)







