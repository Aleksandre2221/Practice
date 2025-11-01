

         -- Approach 1. Using two - CTE and Window Function - LEAD() -- 
WITH 
	cleaned AS (
      SELECT DISTINCT id, login_date
      FROM logins
    ),
 	flagged AS (
      SELECT *,
        CASE 
          	WHEN LEAD(login_date) OVER (PARTITION BY id ORDER BY login_date) - login_date <= 1 THEN 1 
          	ELSE 0 
        END flag
      FROM cleaned
)
SELECT a.id, a.name
FROM flagged f
JOIN accounts a ON a.id = f.id
GROUP BY a.id, a.name
HAVING SUM(flag) >= 5;



         -- Approach 2. Using two - JOIN -- 
SELECT DISTINCT a.id, a.name
FROM logins l1
JOIN logins l2 ON l1.id = l2.id AND (l1.login_date - l2.login_date) BETWEEN 1 AND 4 
JOIN accounts a ON a.id = l1.id
GROUP BY a.id, l1.login_date 
HAVING COUNT(DISTINCT l2.login_date) = 4;





