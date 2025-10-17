

         -- The Simplest Approach. Using - GROUP BY with - HAVING -- 
SELECT actor_id, director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(*) >= 3;



         -- Approach 2. Using - CTE -- 
WITH collab_cnt AS (
    SELECT actor_id, director_id, COUNT(*) AS cnt
    FROM ActorDirector
    GROUP BY actor_id, director_id
)
SELECT actor_id, director_id
FROM collab_cnt
WHERE cnt >= 3;
