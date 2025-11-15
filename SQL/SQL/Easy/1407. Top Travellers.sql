

         -- The Best Approach. Using - LEFT JOIN --  
SELECT u.name, SUM(COALESCE(r.distance, 0)) travelled_distance
FROM users u 
LEFT JOIN rides r ON r.user_id = u.id
GROUP BY u.id, u.name
ORDER BY travelled_distance DESC, u.name;
