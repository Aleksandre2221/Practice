

         -- Approach 1. Using - WHERE - condition -- 
SELECT name  
FROM customer
WHERE referee_id <> 2 OR referee_id IS NULL



         -- Approach 2. Using - Self JOIN - with conditions -- 
SELECT DISTINCT c2.name  
FROM customer c1
JOIN customer c2 ON c2.referee_id <> 2 OR c2.referee_id IS NULL
