

         -- Approach 1. Using - GROUP BY and - FILTER  clause -- 
SELECT question_id, 
    COUNT(*) FILTER(WHERE answer_id IS NULL)::numeric 
      / NULLIF(COUNT(*) FILTER(WHERE answer_id IS NOT NULL),0) AS answer_rate
FROM survey_log
GROUP BY question_id
ORDER BY answer_rate
LIMIT 1;



         -- Approach 2. 
