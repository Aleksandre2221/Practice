
    ⚽ Football Points Calculation ⚽

Problem:
  Given two tables — teams and matches — calculate the total points each team earned based on match results.
  Scoring rules:
    - Win → 3 points
    - Draw → 1 point
    - Loss → 0 points
                                                                            
Goal:
  Return a ranking of all teams with their names and total points (num_points), ordered by points (descending) and team_id (ascending).
                                                                            
Schemas:
   teams(team_id INT PK, team_name VARCHAR(50))
   matches(match_id INT PK, host_team INT, guest_team INT, host_goals INT, guest_goals INT)
                                                                         

       Sample Input Data:                                                                     
                                                                            
| team_id | team_name |
| ------- | --------- |
| 10      | Give      |
| 20      | Never     |
| 30      | You       |
| 40      | Up        |
| 50      | Gonna     |

                                                                            
| match_id | host_team | guest_team | host_goals | guest_goals |
| -------- | --------- | ---------- | ---------- | ----------- |
| 1        | 30        | 20         | 1          | 0           |
| 2        | 10        | 20         | 1          | 2           |
| 3        | 20        | 50         | 2          | 2           |
| 4        | 10        | 30         | 1          | 0           |
| 5        | 30        | 50         | 0          | 1           |


                                                                            
       Exprected Output:
                                                                            
| team_id | team_name | num_points |
| ------- | --------- | ---------- |
| 20      | Never     | 4          |
| 50      | Gonna     | 4          |
| 10      | Give      | 3          |
| 30      | You       | 3          |
| 40      | Up        | 0          |



                                                                            

        -- Approach 1. Using - CTE / FULL JOIN / RIGHT JOIN / COALESCE --                                                                  
WITH 
	pts AS (
      SELECT *,
          CASE WHEN host_goals > guest_goals THEN 3 
              WHEN host_goals < guest_goals THEN 0
              ELSE 1 END host_pts,
          CASE WHEN host_goals < guest_goals THEN 3 
              WHEN host_goals > guest_goals THEN 0
              ELSE 1 END guest_pts 
      FROM matches),
      
      host_pts AS (
        SELECT host_team, SUM(host_pts) host_pts
        FROM pts 
        GROUP BY host_team),
        
	  guest_pts AS (
        SELECT guest_team, SUM(guest_pts) guest_pts
        FROM pts 
        GROUP BY guest_team)
        
SELECT 
	COALESCE(host_team, guest_team, teams.team_id) team_id, teams.team_name,
    COALESCE(host_pts, 0)  + COALESCE(guest_pts, 0) total_pts
FROM host_pts hp 
FULL JOIN guest_pts gp ON hp.host_team = gp.guest_team
RIGHT JOIN teams ON teams.team_id = COALESCE(hp.host_team, gp.guest_team)
ORDER BY total_pts DESC, team_id





    -- Approach 2. Using - CTE / COALESCE / LEFT JOIN / COALESCE --                                                                             
WITH all_points AS (
    SELECT host_team AS team_id,
           CASE 
               WHEN host_goals > guest_goals THEN 3 
               WHEN host_goals = guest_goals THEN 1 
               ELSE 0 
           END AS pts
    FROM matches
    UNION ALL
    SELECT guest_team AS team_id,
           CASE 
               WHEN guest_goals > host_goals THEN 3 
               WHEN guest_goals = host_goals THEN 1 
               ELSE 0 
           END AS pts
    FROM matches
)
SELECT 
    t.team_id,
    t.team_name,
    COALESCE(SUM(a.pts), 0) AS total_pts
FROM teams t
LEFT JOIN all_points a ON t.team_id = a.team_id
GROUP BY t.team_id, t.team_name
ORDER BY total_pts DESC, t.team_id;






