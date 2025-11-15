

         -- Approach 1. Using - Subquery -- 
SELECT MAX(salary) - MIN(salary) salary_difference
FROM (
  SELECT department, MAX(salary) salary
  FROM salaries 
  GROUP BY department 
);



         -- Approach 2. Substracting one Subquery from another -- 
SELECT  
	  (SELECT MAX(salary) ms FROM salaries GROUP BY department ORDER BY ms DESC LIMIT 1) 
      	 - (SELECT MAX(salary) ms FROM salaries GROUP BY department ORDER BY ms DESC LIMIT 2 OFFSET 1)
salary_difference;
