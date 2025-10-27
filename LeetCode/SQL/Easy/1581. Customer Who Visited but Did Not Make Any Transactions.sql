

         -- Approach 1. Using - LEFT JOIN and - WHERE condition -- 
SELECT v.customer_id, COUNT(*) count_no_trans   
FROM visits v 
LEFT JOIN transactions t ON t.visit_id = v.visit_id 
WHERE t.transaction_id IS NULL 
GROUP BY v.customer_id;




         -- Approach 2. Using - NOT EXISTS condition -- 
SELECT v.customer_id, COUNT(v.customer_id) count_no_trans
FROM visits v
WHERE NOT EXISTS (
    SELECT t.visit_id
    FROM transactions t
    WHERE t.visit_id = v.visit_id
)
GROUP BY  v.customer_id;






