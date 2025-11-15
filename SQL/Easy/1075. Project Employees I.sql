

         -- Approach 1. Using - JOIN / GROUP BY / AVG -- 
SELECT p.project_id, 
    ROUND(AVG(e.experience_years), 2)  average_years
FROM project p 
JOIN employee e ON e.employee_id = p.employee_id 
GROUP BY p.project_id;



         -- Approach 2. Withou using - AVG -- 
SELECT p.project_id, 
    ROUND(
        SUM(e.experience_years)::numeric / COUNT(*)
      , 2)  average_years
FROM project p 
JOIN employee e ON e.employee_id = p.employee_id 
GROUP BY p.project_id;



