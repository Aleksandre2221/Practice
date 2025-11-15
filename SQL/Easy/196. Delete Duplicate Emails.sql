

      -- Approach 1. The shortest solution for MySQL --   
DELETE p FROM Person p
JOIN Person p2 
ON p.Email = p2.Email AND p.Id > p2.Id;



      -- Approach 2. With Subquery for MySQL -- 
DELETE FROM person
WHERE id NOT IN (
    SELECT min_id
    FROM (
        SELECT MIN(id) min_id
        FROM person
        GROUP BY email
    ) sub
)

        -- WARNING: If you try to delete direcrly without subquery, in MySQL you will receive error: “You can’t specify target table for update in FROM clause”.
  

  
      -- Approach 3. The Shortest Solution for PostgreSQL -- 
DELETE FROM person
WHERE id NOT IN (
    SELECT MIN(id)
    FROM person
    GROUP BY email
)
  


      -- Approach 4. Using - CTE - and Window Function - ROW_NUMBER() -- 
WITH row_num AS (SELECT *, ROW_NUMBER() OVER(PARTITION BY email ORDER BY id) rn FROM person) 
DELETE FROM person
WHERE id IN (
  SELECT id
  FROM row_num > 1
)

      

      -- Approach 5. Using - EXISTS -- 
DELETE FROM person p1
WHERE EXISTS (
    SELECT 1
    FROM person p2
    WHERE p1.email = p2.email 
        AND p1.id > p2.id
)

  

      -- Approach 6. Using - Self-Join -- 
DELETE FROM person p1
WHERE id IN (
    SELECT p1.id
    FROM person p1
    JOIN person p2 
        ON p1.email = p2.email AND p1.id > p2.id
)







  
