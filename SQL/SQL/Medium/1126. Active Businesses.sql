

         -- Approach 1. Using - Subquery with Window Function - AVG -- 
SELECT business_id
FROM (
  SELECT *, 
  	AVG(occurences) OVER(PARTITION BY event_type) avg_occurences 
  FROM businessevents
) sub 
WHERE occurences > avg_occurences
GROUP BY business_id
HAVING COUNT(*) > 1;




         -- Approach 2. Using - CTE with - GROUP BY and - AVG -- 
WITH avg_occur AS (
  SELECT event_type, AVG(occurences) avg_occurences 
  FROM businessevents
  GROUP BY event_type
)
SELECT business_id 
FROM businessevents b
JOIN avg_occur ON avg_occur.event_type = b.event_type
WHERE  b.occurences > avg_occur.avg_occurences
GROUP BY business_id
HAVING COUNT(*) > 1; 





