

         -- Approach 1. Using - WHERE and - COALESCE --
SELECT name
FROM customer
WHERE COALESCE(referee_id, 0) <> 2;




         -- Approach 2. Using - WHERE - with multiple conditions -- 
SELECT name  
FROM customer
WHERE referee_id <> 2 OR referee_id IS NULL;


         

         -- Approach 3. Using - WHERE with - NOT IN condition -- 
SELECT name  
FROM customer 
WHERE id NOT IN (
  SELECT id  
  FROM customer 
  WHERE referee_id= 2); 




         -- Approach 4. Using condition - IS DISTINCT FROM - (only in PostgreSQL for null-safe inequality) -- 
SELECT name
FROM customer
WHERE referee_id IS DISTINCT FROM 2;




         -- Approach 5. Using condition - NOT <=> - (only in MySQL for null-safe inequality) -- 
SELECT name
FROM customer
WHERE NOT referee_id <=> 2;










