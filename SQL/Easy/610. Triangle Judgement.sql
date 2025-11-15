

         -- Approach 1. Using - CASE...WHEN -- 
SELECT *, 
    CASE 
        WHEN x < y + z 
            AND y < x + z
            AND z < x + y
        THEN 'Yes'
        ELSE 'No'
    END triangle
FROM triangle;




         -- Approach 2. Using - IF (in MySQL) -- 
SELECT 
    *,
    IF(
        z < x + y 
        AND x < y + z 
        AND y < x + z, 
        'Yes', 
        'No'
    ) AS triangle
FROM triangle;
