

         -- The Best Approach. Using - TO_CHAR / COUNT / FILTER / SUM / COALESCE / GROUP BY -- 
SELECT 
    TO_CHAR(trans_date, 'YYYY-MM') "month", 
    country,
    COUNT(*) trans_count, 
    COUNT(*) FILTER (WHERE state = 'approved') approved_count,
    SUM(amount) trans_total_amount,
    COALESCE(SUM(amount) FILTER (WHERE state = 'approved'), 0) approved_total_amount
FROM transactions
GROUP BY country, TO_CHAR(trans_date, 'YYYY-MM');
