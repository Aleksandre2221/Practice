

         -- Approach 1. Using - CTE with a Window Function - LEAD() -- 
WITH flagged AS (
    SELECT account_id,
        TO_CHAR(day, 'YYYY-MM') "month",
        SUM(amount) total_amount,
        LEAD(SUM(amount)) OVER(PARTITION BY account_id ORDER BY TO_CHAR(day, 'YYYY-MM')) next_month
    FROM transactions 
    GROUP BY account_id, TO_CHAR(day, 'YYYY-MM')
)
SELECT DISTINCT f.account_id
FROM flagged f
JOIN accounts a ON a.account_id = f.account_id
WHERE f.total_amount > a.max_income
  AND f.next_month > a.max_income;
