

         -- The Best approach. Using - LENGTH --  
SELECT tweet_id 
FROM tweets 
WHERE LENGTH(content) > 15; 
