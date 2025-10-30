

         -- The Best Approach. Using - GROUP BY and - SUM -- 
SELECT event_day "day", emp_id, 
    (SUM(out_time) - SUM(in_time)) total_time
FROM employees 
GROUP BY event_day, emp_id;
