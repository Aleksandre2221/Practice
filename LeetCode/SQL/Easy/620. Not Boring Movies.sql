

         -- Approach 1. Using - WHERE condition with - NOT LIKE -- 
SELECT * 
FROM cinema 
WHERE id % 2 = 1 AND description NOT LIKE '%boring%'
ORDER BY rating DESC;




         -- Approach 2. Using - WHERE condition with - NOT ILIKE (case insensitive) -- 
SELECT * 
FROM cinema 
WHERE id % 2 = 1 AND description NOT ILIKE '%BoriNg%'
ORDER BY rating DESC;
  


  
         -- Approach 2. Using - WHERE condition with - <> operator -- 
SELECT * 
FROM cinema 
WHERE id % 2 = 1 AND description <> '%boring%'
ORDER BY rating DESC;
