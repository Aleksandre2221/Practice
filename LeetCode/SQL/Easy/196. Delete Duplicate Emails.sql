


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
