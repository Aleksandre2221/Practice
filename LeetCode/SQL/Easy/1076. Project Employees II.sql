

         -- Approach 1. Using - GROUP BY / ORDER BY / LIMIT -- 
SELECT p.project_id 
FROM employee e  
JOIN project p ON p.employee_id = e.employee_id
GROUP BY p.project_id
ORDER BY COUNT(*) DESC 
LIMIT 1;
