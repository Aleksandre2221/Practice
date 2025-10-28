

         -- Approach 1. Using - GROUP BY with - HAVING -- 
SELECT u.name, SUM(t.amount) balance
FROM users u
JOIN transactions t ON t.account = u.account
GROUP BY u.name
HAVING SUM(t.amount) > 10000;



         -- Approach 2. Without - Having using - CTE and - WHERE condition -- 
WITH total AS (
    SELECT account, SUM(amount) balance
    FROM transactions 
    GROUP BY account
)
SELECT u.name, t.balance
FROM total t
JOIN users u ON u.account = t.account
WHERE t.balance > 10000;
