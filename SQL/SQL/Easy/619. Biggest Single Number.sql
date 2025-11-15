

         -- Approach 1. Using - Subquery with - GRORUP BY and - HAVING --
SELECT MAX(num) num
FROM (
    SELECT num 
    FROM MyNumbers
    GROUP BY num 
    HAVING COUNT(*) = 1
) sub;




         -- Approach 2. Using - CTE with - GRORUP BY and - HAVING --
WITH valid_nums AS (
    SELECT num 
    FROM MyNumbers
    GROUP BY num 
    HAVING COUNT(*) = 1
)
SELECT MAX(num) num
FROM valid_nums;




         -- Approach 2. Using - WHERE condition and - Subquery with Window Function - COUNT() --
SELECT MAX(num) num
FROM (
    SELECT *, COUNT(*) OVER(PARTITION BY num) cnt
    FROM MyNumbers
) sub
WHERE cnt = 1;



         -- Approach 3. Using - WHERE IN condition -- 
SELECT MAX(num) AS num
FROM MyNumbers
WHERE num IN (
  SELECT num 
  FROM MyNumbers 
  GROUP BY num 
  HAVING COUNT(*) = 1
);









