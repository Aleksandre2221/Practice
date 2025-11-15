

         -- Approach 1. Without - Subquery nor - CTE, using - WHERE / GROUP BY / HAVING --
SELECT lb.book_id, lb.title, lb.author, lb.genre, lb.publication_year, COUNT(*) borrowers_cnt 
FROM borrowing_records br  
JOIN library_books lb ON br.book_id = lb.book_id
WHERE return_date IS NULL 
GROUP BY lb.book_id, lb.title, lb.author, lb.genre, lb.publication_year
HAVING COUNT(*) = MAX(lb.total_copies);



         -- Approach 2. Using - CTE -- 
WITH active_borrows AS (
    SELECT br.book_id, COUNT(*) AS current_borrowers
    FROM borrowing_records br
    WHERE br.return_date IS NULL
    GROUP BY br.book_id
)
SELECT lb.book_id, lb.title, lb.author, lb.genre, lb.publication_year, ab.current_borrowers
FROM library_books lb
JOIN active_borrows ab ON lb.book_id = ab.book_id
WHERE ab.current_borrowers = lb.total_copies
ORDER BY current_borrowers DESC, title;
