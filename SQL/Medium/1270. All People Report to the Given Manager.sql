

         -- Approach 1. Using multiple - JOIN and - WHERE condition -- 
SELECT e1.employee_id 
FROM employee e1 
JOIN employee e2 ON e1.manager_id = e2.employee_id
JOIN employee e3 ON e2.manager_id = e3.employee_id
WHERE e3.manager_id = 1 and e1.employee_id <> 1;

