

        -- Approach 1. Using - JOIN and - GROUP BY --
SELECT f1.followee name, COUNT(*) num 
FROM follow f1
JOIN follow f2 ON f1.followee = f2.follower
GROUP BY f1.followee
ORDER BY name;




         -- Approach 2. using - CTE with Window Functions -- 
WITH counts AS (
  SELECT 
    followee, COUNT(*) OVER(PARTITION BY followee) followee_cnt,
    follower, COUNT(*) OVER(PARTITION BY follower) follower_cnt
  FROM follow
)
SELECT DISTINCT c1.followee AS "name", c1.followee_cnt AS num
FROM counts c1
JOIN counts c2 ON c1.followee = c2.follower
ORDER BY name;
