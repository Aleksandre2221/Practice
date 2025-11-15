

         -- Approach 1. Using - STRING_AGG (Fro PostgreSQL / SQL Server) -- 
SELECT state, 
    STRING_AGG(city, ', ') cities
FROM cities
GROUP BY state
ORDER BY state;


         -- Approach 2. Using - GROUP_CONCAT (For MySQL) -- 
SELECT state, 
    GROUP_CONCAT(city ORDER BY city SEPARATOR ', ') cities
FROM cities
GROUP BY state
ORDER BY state;
