

         -- Approach 1. Using - GROUP BY and - FILTER -- 
SELECT question_id, 
    COUNT(*) FILTER(WHERE answer_id IS NOT NULL)
      / COUNT(*) AS answer_rate
FROM survey_log
GROUP BY question_id
ORDER BY answer_rate DESC
LIMIT 1;



         -- Approach 2. Using - GROUP BY with - HAVING -- 
SELECT question_id, 
    COUNT(*) FILTER(WHERE answer_id IS NOT NULL)
      / COUNT(*) AS answer_rate
FROM survey_log
GROUP BY question_id
ORDER BY answer_rate DESC
LIMIT 1;
