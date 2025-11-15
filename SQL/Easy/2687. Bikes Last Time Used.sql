

         -- The Best Approach. Using - GROUP BY with - MAX -- 
SELECT bike_number, MAX(end_time) end_time 
FROM bikes
GROUP BY bike_number
ORDER BY end_time DESC;
