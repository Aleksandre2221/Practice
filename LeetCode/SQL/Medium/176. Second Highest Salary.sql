

    -- Approach 1. Using Window Function - DDENSE_RANK() -- 
SELECT MAX(Salary) AS SecondHighestSalary 
FROM
    (SELECT *, 
        DENSE_RANK() OVER(ORDER BY salary DESC) rnk 
     FROM employee) ranking
WHERE rnk = 2


    -- Approach 2. Scalar Subquery -- 
SELECT (
    SELECT DISTINCT salary
    FROM employee 
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
) AS SecondHighestSalary 


    -- Approach 3. Using - WHERE - condition -- 
SELECT MAX(salary) AS SecondHighestSalary 
FROM employee
WHERE salary < (SELECT MAX(salary) FROM employee)








