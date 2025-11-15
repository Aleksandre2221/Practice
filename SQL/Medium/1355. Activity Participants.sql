

         -- Approach 1. Using - CTE and - WHERE condtions -- 
WITH counts AS (
  SELECT activity, COUNT(*) cnt 
  FROM friends
  GROUP BY activity
)
SELECT activity 
FROM counts
WHERE cnt <> (SELECT MIN(cnt) FROM counts)
	AND cnt <> (SELECT MAX(cnt) FROM counts)




         -- Approach 2. Using - GROUP BU with - HVING and - NOT IN condition --   
SELECT activity 
FROM friends
GROUP BY activity
HAVING COUNT(*) NOT IN (
	(SELECT COUNT(*) FROM friends GROUP BY activity ORDER BY COUNT(*) LIMIT 1),
	(SELECT COUNT(*) FROM friends GROUP BY activity ORDER BY COUNT(*) DESC LIMIT 1)
);
