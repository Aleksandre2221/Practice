

         -- The Best Approach. Using two - LEFT JOIN and - CASE...WHEN conditions -- 
SELECT m.member_id, m.name,
    CASE
        WHEN COUNT(v.visit_id) = 0 THEN 'Bronze'
        WHEN 100 * COUNT(p.visit_id) / COUNT(v.visit_id) >= 80 THEN 'Diamond'
        WHEN 100 * COUNT(p.visit_id) / COUNT(v.visit_id) >= 50 THEN 'Gold'
        ELSE 'Silver'
    END category
FROM members m
LEFT JOIN visits v ON m.member_id = v.member_id
LEFT JOIN purchases p ON v.visit_id = p.visit_id
GROUP BY m.member_id;
