

         -- Approach 1. Using two - CTE -- 
WITH 
    row_num AS (
      SELECT *, 
	  	  ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) rn 
	    FROM transactions 
	),
    valid_users AS (
      SELECT user_id 
      FROM row_num 
      GROUP BY user_id 
      HAVING SUM(CASE WHEN rn = 1 thEN spend END) + SUM(CASE WHEN rn = 2 thEN spend END) < SUM(CASE WHEN rn = 3 thEN spend END) 
) 
SELECT rn.user_id, rn.spend, rn.transaction_date 
FROM row_num rn
JOIN valid_users vd ON vd.user_id = rn.user_id
WHERE rn.rn = 3;



         -- Approach 2. Using one - CTE and two - Self Join -- 
WITH row_num AS (
  SELECT *,
    ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) AS rn
  FROM transactions
)
SELECT rn.user_id, rn.spend, rn.transaction_date
FROM row_num rn
JOIN row_num rn1 ON rn1.user_id = rn.user_id AND rn1.rn = 1
JOIN row_num rn2 ON rn2.user_id = rn.user_id AND rn2.rn = 2
WHERE rn.rn = 3 AND (rn1.spend + rn2.spend) < rn.spend;
