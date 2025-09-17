
    -- VAR 1. Using Window Functions -- 
SELECT score, 
    DENSE_RANK() OVER(ORDER BY score DESC) AS Rank
FROM scores


  -- VAR 2. Without Window Functions -- 
SELECT score, 
  (SELECT COUNT(DISTINCT scores) FROM scores s2 WHERE s2.score >= s1.score) AS Rank
FROM scores s1
ORDER BY 
