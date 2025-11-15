

         -- Approach 1. Using - LEFT JOIN -- 
SELECT u.user_id, u.name, 
    COALESCE(SUM(distance), 0) travelled_distance 
FROM users u 
LEFT JOIN rides r ON u.user_id = r.user_id  
GROUP BY u.user_id, u.name;




         -- Approach 2. Without - JOIN, using Correlated Subquery -- 
SELECT u.user_id, u.name,
    COALESCE(
            (SELECT SUM(distance) 
             FROM rides r 
             WHERE r.user_id = u.user_id)
        , 0) travelled_distance
FROM users u;
