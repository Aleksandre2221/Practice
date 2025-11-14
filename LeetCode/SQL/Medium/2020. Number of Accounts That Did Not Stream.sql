

         -- Approach 1. Using - LEFT JOIN with multiple conditions -- 
SELECT COUNT(*) 
FROM subscriptions sub
LEFT JOIN streams str ON str.account_id = sub.account_id 
	AND str.stream_date NOT BETWEEN sub.start_date AND sub.end_date
WHERE EXTRACT(YEAR FROM sub.start_date) = 2021; 

