

         -- Approach 1. Using - GROUP BY with - HAVING conditions -- 
SELECT user_id
FROM loans
GROUP BY user_id
HAVING SUM(CASE WHEN loan_type = 'Refinance' THEN 1 END) > 0 
    AND SUM(CASE WHEN loan_type = 'Mortgage' THEN 1 END) > 0
ORDER BY user_id;
