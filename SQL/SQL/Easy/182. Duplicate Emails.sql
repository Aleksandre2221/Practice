

    -- Approach 1. Using - GROUP BY -- 
SELECT DISTINCT email
FROM person
GROUP BY email
HAVING COUNT(*) > 1


    -- Approach 2. Using - WHERE IN - condition -- 
SELECT DISTINCT email
FROM person 
WHERE email IN (
    SELECT email
    FROM person
    GROUP BY email
    HAVING COUNT(*) > 1
)


    -- Approach 3. Using - JOIN -- 
SELECT DISTINCT p1.email
FROM person p1
JOIN person p2 
    ON p1.email = p2.email AND p1.id <> p2.id 


    -- Approach 4. Using window function - ROW_NUMBER() - 
SELECT DISTINCT email
FROM (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY email) rn
    FROM person 
) sub
WHERE rn > 1










