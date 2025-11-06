

         -- Approach 1. Using - Subquery and - WHERE condition -- 
SELECT city 
FROM (
  SELECT DISTINCT city,
      AVG(price) OVER(PARTITION BY city) city_avg, 
      AVG(price) OVER() national_avg
  FROM listings
)
WHERE city_avg > national_avg
ORDER BY city;
