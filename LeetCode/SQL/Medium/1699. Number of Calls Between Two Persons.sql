

         -- Approach 1. Using - GROUP BY and - CASE...WHEN conditions -- 
SELECT
    CASE WHEN from_id > to_id THEN to_id ELSE from_id END person1,
    CASE WHEN to_id < from_id THEN from_id ELSE to_id END person2,
    COUNT(*) call_count,
    SUM(duration) total_duration
FROM calls
GROUP BY person1, person2;
