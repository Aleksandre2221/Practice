
  -- Approach 1. Left Join with ON condition - (Best Practice) 
SELECT p.firstname, p.lastname, a.city, a.state
FROM person p 
LEFT JOIN address a ON p.personId = a.personId


  -- Approach 2. Left Join with - USING -- 
SELECT p.firstname, p.lastname, a.city, a.state
FROM person p
LEFT JOIN address a USING(personid)


  -- Approach 3. Natural Left Join - (Not Reccomended)
SELECT firstname, lastname, city, state
FROM person
NATURAL LEFT JOIN address;
