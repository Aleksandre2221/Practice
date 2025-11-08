

         -- The Best Approach. Using - CASE...WHEN conditions -- 
SELECT 
	CASE  
    	WHEN a = b AND b = c THEN 'Equilateral'
		  WHEN a + b < C or b + c < A OR a + c < b THEN 'Not A Triangle'
      WHEN A <> b AND b <> c THEN 'Scalene'
      ELSE 'Isosceles' 
	END triangle_type
FROM triangles;
