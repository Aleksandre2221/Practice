

         -- The Best Approach. Using - LEFT JOIN -- 
SELECT 
	SUM(b.apple_count) + SUM(c.apple_count) apple_count, 
  SUM(b.orange_count) + SUM(c.orange_count) orange_count
FROM boxes b 
LEFT JOIN chests c ON b.chest_id = c.chest_id;
