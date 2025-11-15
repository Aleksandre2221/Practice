

         -- Approach 1. Using - AVG with - FILTER(WHERE....) condiotion -- 
SELECT machine_id,
       ROUND(
         	(AVG(timestamp) FILTER (WHERE activity_type = 'end') -
          		AVG(timestamp) FILTER (WHERE activity_type = 'start'))::numeric
         , 3) AS processing_time 
FROM activity
GROUP BY machine_id;




         -- Approach 2. Using - Self-Join with --  
SELECT a1.machine_id, 
	ROUND(AVG(a2.timestamp - a1.timestamp)::numeric, 3) processing_time 
FROM activity a1 
JOIN activity a2 ON a1.machine_id = a2.machine_id
WHERE a1.activity_type = 'start' AND a2.activity_type = 'end'
GROUP BY a1.machine_id;





-- Approach 3. Using two - CTE -- 
WITH  
    avg_start AS (
      SELECT machine_id, AVG(timestamp) start_avg 
      FROM activity 
      WHERE activity_type = 'start'
      GROUP BY machine_id 
    ), 
    avg_end AS (
      SELECT machine_id, AVG(timestamp) end_avg 
      FROM activity 
      WHERE activity_type = 'end'
      GROUP BY machine_id 	
    )
SELECT s.machine_id, 
	ROUND(e.end_avg::numeric - s.start_avg::numeric, 3) processing_time
FROM avg_start s  
JOIN avg_end e ON e.machine_id = s.machine_id;




