

         -- Approach 1. Using - UNION with - WHERE NOT IN conditions -- 
SELECT employee_id 
FROM employees 
WHERE employee_id NOT IN (SELECT employee_id FROM salaries)
UNION 
SELECT employee_id 
FROM salaries 
WHERE employee_id NOT IN (SELECT employee_id FROM employees)
ORDER BY employee_id;



         -- Approach 2. Using - FULL JOIN with - WHERE IS NULL condions -- 
SELECT COALESCE(e.employee_id, s.employee_id) employee_id
FROM employees e
FULL JOIN salaries s ON e.employee_id = s.employee_id
WHERE e.employee_id IS NULL OR s.employee_id IS NULL
ORDER BY employee_id;
