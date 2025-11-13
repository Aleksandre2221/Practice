

         -- Approach 1. Using - COUNT with - CASE..WHEN condition --
SELECT s.user_id, 
	ROUND(
      		COUNT(CASE WHEN action = 'confirmed' THEN 1 END)::numeric / COUNT(*)
      , 2) confirmation_rate
FROM signups s  
LEFT JOIN confirmations c ON s.user_id = c.user_id 
GROUP BY s.user_id;



         -- Approach 2. Using - AVG with boolean flag --
SELECT s.user_id,
       ROUND(
         	  COALESCE(AVG((c.action = 'confirmed')::int), 0)
        , 2) confirmation_rate
FROM signups s
LEFT JOIN confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id;
