
    -- Approach 1. Using Subquery --
SELECT d.name Department, e.name Employee, e.salary Salary
FROM employee e
JOIN department d ON d.id = e.departmentid
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM employee e2
    WHERE e2.departmentid = e.departmentid
)


   -- Approach 2. Using Window Function - RANK() - and - CTE - 
WITH ranked AS (
    SELECT d.name AS Department, 
           e.name AS Employee, 
           e.salary AS Salary,
           RANK() OVER (PARTITION BY d.id ORDER BY e.salary DESC) AS rnk
    FROM employee e
    JOIN department d ON d.id = e.departmentid
)
SELECT Department, Employee, Salary
FROM ranked
WHERE rnk = 1;
