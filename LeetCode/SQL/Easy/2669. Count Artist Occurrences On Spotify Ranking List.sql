

         -- The Best Approach. Using - GROUP BY with - COUTN(*) -- 
SELECT artist, COUNT(*) occurences 
FROM spotify
GROUP BY artist 
ORDER BY occurences DESC, artist;
