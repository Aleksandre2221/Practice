

         -- Approach 1. Using - CTW with a Window Function - ROW_NUMBER() -- 
WITH gr AS (
  SELECT salary, 
  	ROW_NUMBER() OVER(ORDER BY salary) team_id
  FROM employees 
  GROUP BY salary 
  HAVING COUNT(*) > 1
)
SELECT e.*, gr.team_id
FROM employees e 
JOIN gr ON gr.salary = e.salary
ORDER BY team_id, employee_id;



         -- Approach 2. Using - WHERE IN condition --
SELECT e.*, 
    ROW_NUMBER() OVER (ORDER BY e.salary) team_id
FROM employees e
WHERE e.salary IN (
    SELECT salary
    FROM employees
    GROUP BY salary
    HAVING COUNT(*) > 1
)
ORDER BY team_id, employee_id;
