

         -- Approach 1. Using - CTE with a Window Function - RANK() -- 
WITH ranking AS (
  SELECT r1.user_id user1_id, r2.user_id user2_id, 
  	RANK() OVER(ORDER BY COUNT(*) DESC) rnk
  FROM relations r1 
  JOIN relations r2 ON r1.follower_id = r2.follower_id AND r1.user_id < r2.user_id
  GROUP BY r1.user_id, r2.user_id
)
SELECT user1_id, user2_id 
FROM ranking  
WHERE rnk = 1;
