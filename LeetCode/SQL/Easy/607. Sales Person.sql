

         -- Approach 1. Using - NOT IN - condition with multiple - LEFT JOIN -- 
SELECT name  
FROM salesperson 
WHERE name NOT IN (
  SELECT s.name
  FROM salesperson s 
  LEFT JOIN orders o ON o.sales_id = s.sales_id
  LEFT JOIN company c ON c.com_id = o.com_id
  WHERE c.name = 'RED');
