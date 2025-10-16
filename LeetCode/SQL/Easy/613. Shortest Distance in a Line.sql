

         -- Approach 1. Using - Self-Join - MIN - ABS -- 
SELECT MIN(ABS(p1.x - p2.x)) AS shortest
FROM point p1
JOIN point p2 ON p1.x <> p2.x;



         -- Approach 2. Without using - MIN --
SELECT distance shortest
FROM (
  SELECT *, ABS(p1.x - p2.x) distance
  FROM point p1 
  JOIN point p2 ON p1.x <> p2.x
  ORDER BY distance 
  LIMIT 1
);
