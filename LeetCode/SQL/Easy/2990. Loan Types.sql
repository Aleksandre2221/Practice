

         -- Approach 1. Using - GROUP BY with - HAVING conditions -- 
SELECT user_id
FROM loans
GROUP BY user_id
HAVING SUM(CASE WHEN loan_type = 'Refinance' THEN 1 END) > 0 
    AND SUM(CASE WHEN loan_type = 'Mortgage' THEN 1 END) > 0
ORDER BY user_id;




         -- Approach 2. Using - Self-Join with - WHERE conditions --
SELECT DISTINCT a.user_id
FROM Loans a
JOIN Loans b ON a.user_id = b.user_id
WHERE a.loan_type = 'Refinance' AND b.loan_type = 'Mortgage'
ORDER BY a.user_id;




         -- Approach 3. Using - INTERSECT -- 
SELECT user_id
FROM Loans
WHERE loan_type = 'Refinance'

INTERSECT

SELECT user_id
FROM Loans
WHERE loan_type = 'Mortgage'

ORDER BY user_id;
