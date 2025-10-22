

        -- The Best Approach. Using - GROUP BY / AVG / COUNT() FILTER -- 
SELECT query_name, 
    ROUND( AVG(rating::numeric / position) , 2) quality, 
    ROUND( COUNT(*) FILTER(WHERE rating < 3) * 100.0 / COUNT(*) , 2) poor_query_percentage 
FROM queries 
GROUP BY query_name;
