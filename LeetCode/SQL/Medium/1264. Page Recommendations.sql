

         -- Approach 1. Using - Subquery with - CASE...WHEN and - WHERE conditons -- 
SELECT DISTINCT l.page_id recommended_page 
FROM (
  SELECT 
      CASE 
          WHEN user2_id = 1 THEN user1_id 
          ELSE user2_id 
      END friends_of_user1
  FROM friendship
  WHERE user2_id = 1 OR user1_id = 1
) sub 
JOIN likes l ON l.user_id = sub.friends_of_user1 
WHERE l.page_id NOT IN (SELECT page_id FROM likes WHERE user_id = 1)
order by recommended_page;




         -- Approach 2. Using - CTE -- 
WITH user1_friends AS (
    SELECT 
        CASE 
            WHEN user2_id = 1 THEN user1_id
            ELSE user2_id
        END friend_id
    FROM friendship
    WHERE user1_id = 1 OR user2_id = 1
)
SELECT DISTINCT l.page_id recommended_page
FROM user1_friends f
JOIN likes l ON l.user_id = f.friend_id
WHERE l.page_id NOT IN (SELECT page_id FROM likes WHERE user_id = 1)
ORDER BY recommended_page;




         -- Approach 3. Using - UNION within - CTE -- 
WITH user1_friends AS (
  SELECT user1_id user_id FROM Friendship WHERE user2_id = 1
  UNION
  SELECT user2_id user_id FROM Friendship WHERE user1_id = 1
)
SELECT DISTINCT l.page_id recommended_page
FROM user1_friends f
JOIN likes l ON l.user_id = f.user_id
WHERE l.page_id NOT IN (SELECT page_id FROM likes WHERE user_id = 1)
ORDER BY recommended_page;









