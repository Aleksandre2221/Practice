

         -- The Best Approach. Using - JOIN with conditions --  
SELECT e1.symbol metal, e2.symbol nonmetal 
FROM elements e1
JOIN elements e2 ON e1.type = 'Metal' AND e2.type = 'Nonmetal';
