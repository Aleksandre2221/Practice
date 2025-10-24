

         -- Approach 1. Using two - CTE and - LEFT JOIN --  
WITH 
	chargebacks_monthly  AS (
      SELECT 
          t.country,
          DATE_TRUNC('month', c.charge_date)::date "month",
          SUM(t.amount) chargeback_amount, 
          COUNT(*) chargeback_count
      FROM transactions t
      JOIN chargebacks C ON t.id = c.trans_id
      GROUP BY DATE_TRUNC('month', c.charge_date)::date, t.country
    ),
  
	approved_monthly  AS (
      SELECT 
          DATE_TRUNC('month', trans_date)::DATE "month",
          country,
          COUNT(*) FILTER (WHERE state = 'approved') approved_count,
          SUM(amount) FILTER (WHERE state = 'approved') approved_amount
      FROM transactions
      GROUP BY DATE_TRUNC('month', trans_date), country
)
  
SELECT cm.month, cm.country, 
    COALESCE(am.approved_count, 0) approved_count,
    COALESCE(cm.chargeback_count, 0) chargeback_count,
    COALESCE(cm.chargeback_amount, 0) chargeback_amount
FROM chargebacks_monthly cm 
LEFT JOIN approved_monthly am ON cm.country = am.country AND cm.month = am.month
ORDER BY cm.month;
