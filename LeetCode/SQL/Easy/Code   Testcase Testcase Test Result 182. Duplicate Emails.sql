

    -- VAR 1. Using - GROUP BY -- 
SELECT DISTINCT email
FROM person
GROUP BY email
HAVING COUNT(*) > 1


    -- VAR 2. Using - WHERE IN - condition -- 
SELECT DISTINCT email
FROM person 
WHERE email IN (
    SELECT email
    FROM person
    GROUP BY email
    HAVING COUNT(*) > 1
)











