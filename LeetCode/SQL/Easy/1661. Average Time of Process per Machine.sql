

         -- Approach 1. Using - AVG with - FILTER(WHERE....) condiotion -- 
SELECT machine_id,
       ROUND(
         	(AVG(timestamp) FILTER (WHERE activity_type = 'end') -
          		AVG(timestamp) FILTER (WHERE activity_type = 'start'))::numeric
         , 3) AS avg_processing_time
FROM activity
GROUP BY machine_id;




