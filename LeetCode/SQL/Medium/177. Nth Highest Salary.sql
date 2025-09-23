
    -- Approach 1. PostgreSQL: Using Window Function - DENSE_RANK - 
CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (
    SELECT DISTINCT sub.salary
    FROM (SELECT *, DENSE_RANK() OVER(ORDER BY e.salary DESC) rnk FROM employee e) sub
    WHERE sub.rnk = N 
      
  );
END;
$$ LANGUAGE plpgsql;



    -- Approach 2. PostgreSQL: Using - IF - condition
CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
IF N < 1 THEN
  RETURN QUERY (SELECT NULL::INT AS Salary);
ELSE 
  RETURN QUERY (
      SELECT DISTINCT e.salary 
      FROM employee e
      ORDER BY e.salary DESC
      LIMIT 1 OFFSET N - 1
      
  );
END;
$$ LANGUAGE plpgsql;



    -- Approach 3. MySQL: Using - SET -
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
SET N = N-1;
  RETURN (
      SELECT DISTINCT(salary) from Employee order by salary DESC
      LIMIT 1 OFFSET N
      
  );
END

      -- ATTENTION:

-- 1. In MySQL - LIMIT - does NOT recognize expressions but only scalar values. That why we have to do the math before - LIMIT. BUT unlike Postgre, MySQL can handle negative values.   
-- 2. in Postgre - LIMIT - accepts almost any expression that returns a scalar value. BUT if expression returns a negative value, you recieve error.











