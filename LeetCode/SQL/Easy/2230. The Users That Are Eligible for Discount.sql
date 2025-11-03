

         -- The Best Approach. Using multiple - WHERE conditionss -- 
SELECT DISTINCT user_id
FROM Purchases
WHERE time_stamp >= startDate AND time_stamp < endDate + INTERVAL '1 day'
  AND amount >= minAmount
ORDER BY user_id;
