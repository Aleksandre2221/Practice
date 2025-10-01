

        -- Approach 1. Using - LEFT JOIN -- 
SELECT e.name, b.bonus 
FROM employee e 
LEFT JOIN bonus b ON b.empid = e.empid
WHERE b.bonus < 1000 OR b.bonus IS NULL
