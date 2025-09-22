

      -- VAR 1. WIth explicit Join
SELECT e1.name Employee 
FROM employee e1
JOIN employee e2 ON e1.managerid = e2.id
WHERE e1.salary > e2.salary
  

  
    -- VAR 2. With implicit Join
SELECT e1.name Employee
FROM employee e1, employee e2
WHERE e1.managerid = e2.id AND e1.salary > e2.salary


  
    -- VAR 3. With condition - WHERE IN 
SELECT e1.name Employee 
FROM employee e1
WHERE managerid IN (
  SELECT id
  FROM employee e2
  WHERE e1.salary > e2.salary
)

  

    -- VAR 4. Using - EXISTS
SELECT e1.name Employee 
FROM employee e1
WHERE EXISTS (
  SELECT 1
  FROM employee e2
  WHERE e1.id = e2.manager_id AND e1.salary > e2.salary
)












