

         -- Approach 1. Using two - JOIN - with - AND condition -- 
SELECT t.request_at AS "Day",
       ROUND(
           SUM(CASE WHEN t.status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1 ELSE 0 END)::numeric
           / COUNT(*),
           2
       ) AS "Cancellation Rate"
FROM trips t
JOIN users c ON t.client_id = c.users_id AND c.banned <> 'Yes'
JOIN users d ON t.driver_id = d.users_id AND d.banned <> 'Yes'
WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY t.request_at
ORDER BY t.request_at;




         -- Approach 2. Using one - JOIN but multiple - WHERE / AND - conditions (less elegant solution, but it still works)
SELECT t.request_at "Day",
	ROUND(	
	        SUM(CASE WHEN t.status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1 ELSE 0 END)::numeric 
                  / COUNT(*)
             , 2) "Cancellation Rate"
FROM users u 
JOIN trips t ON (t.client_id = u.users_id OR t.driver_id = u.users_id)
WHERE 
    u.banned <> 'Yes'
    AND t.client_id NOT IN (SELECT users_id FROM users WHERE banned = 'Yes')
    AND t.driver_id NOT IN (SELECT users_id FROM users WHERE banned = 'Yes')
    AND t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY t.request_at
ORDER BY t.request_at;
