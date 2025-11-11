

         -- Approach 1. Using one - CTE with Window Function - LEAD() -- 
WITH date_diffs AS (
    SELECT user_id,
           LEAD(visit_date) OVER(PARTITION BY user_id ORDER BY visit_date) - visit_date AS diff,
           visit_date
    FROM uservisits
)
SELECT user_id,
       MAX(COALESCE(diff, '2021-01-01'::date - visit_date)) AS biggest_window
FROM date_diffs
GROUP BY user_id;




         -- Approach 2. Using multiple - CTE with different Window Functions -- 
WITH 
	ordered_visits AS (
    SELECT user_id, visit_date,
        ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY visit_date) rn,
        COUNT(*) OVER(PARTITION BY user_id) cnt
    FROM uservisits
	),
	date_diffs AS (
    SELECT user_id,
        CASE 
            WHEN rn < cnt THEN LEAD(visit_date) OVER(PARTITION BY user_id ORDER BY visit_date) - visit_date
            ELSE '2021-01-01'::date - visit_date
        END date_window
    FROM ordered_visits
)
SELECT user_id, MAX(date_window) biggest_window
FROM date_diffs
GROUP BY user_id;



