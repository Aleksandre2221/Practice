

         -- Approach 1. Using Window Function - SUM() -- 
SELECT gender, day, 
	SUM(score_points) OVER(PARTITION BY gender ORDER BY day) total 
FROM score;  


         -- Approach 2. Withou using Window Functions -- 
SELECT s1.gender, s1.day, 
	(
      SELECT SUM(s2.score_points) 
      FROM score s2 
      WHERE s1.gender = s2.gender AND s2.day <= s1.day
  ) total 
FROM score s1 
GROUP BY s1.gender, s1.day 
ORDER BY gender, day;
