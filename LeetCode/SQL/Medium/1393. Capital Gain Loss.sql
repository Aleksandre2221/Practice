

         -- Approach 1. Using - SUM with - FILTER(WHERE...) condition (Only PostgreSQL) -- 
SELECT stock_name, 
    SUM(price) FILTER (WHERE operation = 'Sell') 
        - SUM(price) FILTER (WHERE operation = 'Buy') capital_gain_loss 
FROM stocks 
GROUP BY stock_name;



        -- Approach 2. Using - SUM with - CASE...WHEN condition (SQL Standard) -- 
SELECT stock_name, 
    SUM(
        CASE 
            WHEN operation = 'Buy' THEN -price 
            ELSE price
        END
    ) capital_gain_loss
FROM stocks 
GROUP BY stock_name;
