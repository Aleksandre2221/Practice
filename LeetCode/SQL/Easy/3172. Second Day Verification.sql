

         -- The Best Approach. Using - JOIN with multiple conditions --  
SELECT e.user_id
FROM emails e 
JOIN texts t ON t.email_id = e.email_id 
	AND t.action_date - e.signup_date <= INTERVAL '1 Day'
  AND t.signup_action = 'Verified';  
  
