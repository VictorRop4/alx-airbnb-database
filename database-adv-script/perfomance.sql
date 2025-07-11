-- perfomance.sql

-- 🔍 Initial Complex Query: Retrieve all bookings with user, property, and payment details
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    p.pricepernight,
    pay.payment_id,
    pay.amount,
    pay.payment_method
FROM 
    bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed' AND b.start_date >= CURRENT_DATE;

-- 🧪 Performance Analysis Tip:
-- Run: EXPLAIN ANALYZE <above query> to inspect scan types and costs

-- ✅ Refactored Query: Only fetch essential columns and use indexing
-- (Assumes indexes on user_id, property_id, and booking_id are already created)
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    CONCAT(u.first_name, ' ', u.last_name) AS user_fullname,
    u.email,
    p.name AS property_name,
    pay.amount
FROM 
    bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed' AND b.start_date >= CURRENT_DATE
ORDER BY b.start_date DESC;

-- 🔎 Notes:
-- - Adds WHERE and AND clauses to filter active bookings
-- - Improves relevance and performance of data retrieval
-- - Suitable for reporting, dashboards, and pagination
