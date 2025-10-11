

         -- Approach 1. Using - LEFT JOIN -- 
SELECT ROUND(
  		MIN(SQRT(POWER((p1.x - p2.x)::numeric, 2) + POWER((p1.y - p2.y)::numeric, 2)))
  	 , 2) 
FROM point_2d p1
LEFT JOIN point_2d p2 ON (p1.x, p1.y) <> (p2.x, p2.y); 
