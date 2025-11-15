

         -- Approach 1. Using - CASE...WHEN condition -- 
SELECT employee_id, 
    CASE 
        WHEN LEFT(name, 1) <> 'M' AND employee_id % 2 = 1 THEN salary
        ELSE 0
    END bonus
FROM employees
ORDER BY employee_id; 



         -- Approach 2, Without using - CASE...WHEN condition -- 
SELECT employee_id,
  salary * ( 
        (LEFT(name, 1) <> 'M')::int * (empsloyee_id % 2 = 1)::int 
    ) bonus
FROM employees
ORDER BY employee_id;
