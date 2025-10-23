

         -- Approach 1. Using - Subquery with Window Funcion SUM() -- 
SELECT person_name
FROM (
  SELECT *, SUM(weight) OVER(ORDER BY turn) total_weight
  FROM queue
) sub 
WHERE total_weight <= 1000
ORDER BY total_weight DESC 
LIMIT 1;



         -- Approach 2. Using two subqueries in - WHERE clause, without using - ORDER BY and - LIMIT -- 
SELECT person_name
FROM queue
WHERE turn = (
    SELECT MAX(turn)
    FROM (
        SELECT turn, SUM(weight) OVER(ORDER BY turn) AS total_weight
        FROM queue
    ) sub
    WHERE total_weight <= 1000
);
