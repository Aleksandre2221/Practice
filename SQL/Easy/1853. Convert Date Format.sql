

         -- Approach 1. Using - TO_CHAR (For Postgre/Oracle) -- 
SELECT TO_CHAR("day", 'Day, Month DD, YYYY') "DAY"
FROM days


         -- Approach 2. Using - DATE_FORMAT (For MySQL) -- 
SELECT DATE_FORMAT(`day`, '%W, %M %d, %Y') DAY
FROM days;
