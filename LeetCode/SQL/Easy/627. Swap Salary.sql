

         -- Approach 1. Using - CASE...WHEN --
UPDATE salary
SET sex = CASE 
    WHEN sex = 'f' THEN 'm' 
    ELSE 'f' 
END;
