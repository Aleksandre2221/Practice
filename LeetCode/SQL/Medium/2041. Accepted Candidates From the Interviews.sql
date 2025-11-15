

         -- The Best Approach. Using - SUM within - ORDER BY and - LIMIT -- 
SELECT c.candidate_id 
FROM candidates c  
JOIN rounds r ON r.interview_id = c.interview_id
WHERE c.years_of_exp >= 2 
GROUP BY c.candidate_id
ORDER BY SUM(score) DESC 
LIMIT 1; 
