

         -- Approach 1. Using - Subquery with - CROSS JOIN -- 
SELECT pe.platform, pe.experiment_name, COUNT(e.platform) num_experiments 
FROM (
	SELECT * 
    FROM (SELECT DISTINCT platform FROM experiments)
    CROSS JOIN (SELECT DISTINCT experiment_name FROM experiments)
) pe
LEFT JOIN experiments e ON e.platform = pe.platform AND e.experiment_name = pe.experiment_name
GROUP BY pe.platform, pe.experiment_name;



         -- Approach 2. The same solution but more readable -- 
WITH 
	  all_platforms AS (
      SELECT DISTINCT platform 
      FROM experiments
    ),
    all_experiments AS (
      SELECT DISTINCT experiment_name
      FROM experiments
    ),
    platform_experiment AS (
      SELECT * 
      FROM all_platforms, all_experiments
    ),
    cnt AS (
      SELECT platform, experiment_name, COUNT(*) cnt
      from experiments 
      GROUP BY platform, experiment_name
)
SELECT pe.platform, pe.experiment_name, COALESCE(cnt.cnt, 0) num_experiments
FROM platform_experiment pe
LEFT JOIN cnt ON cnt.platform = pe.platform 
	AND cnt.experiment_name = pe.experiment_name
