

         -- The Best Approach. Using two - JOIN and - SUM with - CASE..WHEN condition --
SELECT i.invoice_id, c.customer_name, i.price,
    COUNT(co.contact_email) AS contacts_cnt,
    SUM(CASE WHEN co.contact_email IN (SELECT email FROM customers) THEN 1 ELSE 0 END) trusted_contacts_cnt
FROM invoices i
JOIN customers c ON i.user_id = c.customer_id
LEFT JOIN contacts co ON co.user_id = c.customer_id
GROUP BY i.invoice_id, c.customer_name, i.price
ORDER BY i.invoice_id;

