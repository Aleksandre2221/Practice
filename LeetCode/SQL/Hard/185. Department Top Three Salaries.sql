

      -- Appraoch 1. With CTE and Window Function - DENSE_RANK -- 
WITH salary_ranking AS (
  SELECT d.name department, e.name employee, e.salary, 
      DENSE_RANK() OVER(PARTITION BY d.name ORDER BY salary DESC) rn
  FROM Employee e 
  JOIN Department d ON d.id = e.departmentId
 )
 SELECT  department, employee, salary
 FROM salary_ranking
 WHERE rn <= 3
 ORDER BY department, salary DESC





