

      -- Approach 1. Using Window Function - SUM -- 
SELECT player_id, event_date, 
	SUM(games_played) OVER(PARTITION BY player_id ORDER BY event_date) games_played_so_far
FROM playeractivity


      -- Approach 2. Using - Self-Join -- 
SELECT pa1.player_id, pa1.event_date, SUM(pa2.games_played) games_played_so_far
FROM playeractivity pa1
JOIN playeractivity pa2 
	ON pa1.player_id = pa2.player_id AND pa1.event_date >= pa2.event_date
GROUP BY pa1.player_id, pa1.event_date
