

         -- The Best Approach. Using - LEFT JOIN -- 
SELECT q.id, q.year, COALESCE(npv, 0) 
FROM queries q
LEFT JOIN npv ON q.id = npv.id AND q.year = npv.year;
