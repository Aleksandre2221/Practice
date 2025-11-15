

         -- Approach 1. Using - NOT IN - condition with multiple - LEFT JOIN -- 
SELECT name  
FROM salesperson 
WHERE sales_id NOT IN (
  SELECT s.sales_id
  FROM salesperson s 
  LEFT JOIN orders o ON o.sales_id = s.sales_id
  LEFT JOIN company c ON c.com_id = o.com_id
  WHERE c.name = 'RED');



         -- Approach 2. Using - NOT IN - condition with one - INNER JOIN -- 
SELECT s.name
FROM salesperson s
WHERE s.sales_id NOT IN (
    SELECT o.sales_id
    FROM orders o
    JOIN company c ON o.com_id = c.com_id
    WHERE c.name = 'RED'
);



         -- Approach 3. Without Subquery, using - JOIN - RIGHT JOIN and - WHERE - condition -- 
SELECT s.name
FROM orders o
JOIN company c ON (c.com_id = o.com_id AND c.name = 'RED')
RIGHT JOIN salesperson s ON s.sales_id = o.sales_id 
WHERE o.sales_id IS NULL;



          -- Approach 4. Using - NOT EXISTS conditon -- 
SELECT  s.name 
FROM salesperson s 
WHERE NOT EXISTS (
  SELECT 1 
  FROM orders o 
  JOIN company c ON c.com_id = o.com_id
  WHERE o.sales_id = s.sales_id AND c.name = 'RED');













