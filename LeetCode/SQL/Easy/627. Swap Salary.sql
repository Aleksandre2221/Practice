

         -- Approach 1. Using - CASE...WHEN --
UPDATE salary
SET sex = CASE 
    WHEN sex = 'f' THEN 'm' 
    ELSE 'f' 
END;




         -- Approach 2. Using - CASE with two - WHEN - conditions (handles cases with null values) -- 
UPDATE salary
SET sex = CASE 
    WHEN sex = 'f' THEN 'm'
    WHEN sex = 'm' THEN 'f'
    ELSE sex 
END;
