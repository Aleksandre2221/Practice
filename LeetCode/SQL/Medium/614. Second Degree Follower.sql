

        -- Approach 1. Using - JOIN and - GROUP BY --
SELECT f1.followee name, COUNT(*) num 
FROM follow f1
JOIN follow f2 ON f1.followee = f2.follower
GROUP BY f1.followee
ORDER BY name;
