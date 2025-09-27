

      -- Approach 1. Using - WHERE IN - condition -- 
SELECT name
FROM employee
WHERE id IN (
    SELECT managerid
    FROM employee
    GROUP BY managerid
    HAVING COUNT(*) >= 5
)









