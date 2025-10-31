

         -- Approach 1. Using two - UNION ALL with - WHERE conditions -- 
SELECT product_id, 'store1' store, store1 price FROM products WHERE store1 IS NOT NULL
UNION ALL 
SELECT product_id, 'store2' store, store2 price FROM products WHERE store2 IS NOT NULL
UNION ALL 
SELECT product_id, 'store3' store, store3 price FROM products WHERE store3 IS NOT NULL;



         -- Approach 2. Using - UNNES(ARRAY(....)) -- (Only in PostgreSQL)
SELECT *
FROM (
  SELECT product_id, 
    UNNEST(ARRAY['store1', 'store2', 'store3']) AS store,
    UNNEST(ARRAY[store1, store2, store3]) AS price
  FROM Products
) unpivot
WHERE price IS NOT NULL;
