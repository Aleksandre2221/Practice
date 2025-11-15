

         -- The Beast Approach. Using Window Function - RANK() with expression in - ORDER BY --
SELECT team_id, team_name,
	wins * 3 + draws points,
  RANK() OVER(ORDER BY wins * 3 + draws DESC) position
FROM teamstats 
GROUP BY team_id, team_name 
ORDER BY points DESC, team_name;
