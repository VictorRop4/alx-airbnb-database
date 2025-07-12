-- schema.sql

-- ... (previous schema and inserts remain unchanged) ...

-- 8. SQL Join Queries

-- a. INNER JOIN: All bookings with corresponding users
SELECT 
    bookings.booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date,
    bookings.total_price,
    bookings.status,
    users.user_id,
    users.first_name,
    users.last_name,
    users.email
FROM 
    bookings
INNER JOIN 
    users ON bookings.user_id = users.user_id
ORDER BY 
    bookings.created_at DESC;

-- b. LEFT JOIN: All properties with their reviews (include properties with no reviews)
SELECT 
    properties.property_id,
    properties.name,
    properties.location,
    properties.pricepernight,
    reviews.review_id,
    reviews.rating,
    reviews.comment
FROM 
    properties
LEFT JOIN 
    reviews ON properties.property_id = reviews.property_id
ORDER BY 
    properties.created_at DESC;

-- c. FULL OUTER JOIN: All users and all bookings (include users without bookings and bookings without users)
-- Note: FULL OUTER JOIN not supported in MySQL. Use UNION of LEFT and RIGHT JOINs
SELECT 
    users.user_id,
    users.first_name,
    users.last_name,
    bookings.booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date,
    bookings.status
FROM 
    users
LEFT JOIN 
    bookings ON users.user_id = bookings.user_id

UNION

SELECT 
    users.user_id,
    users.first_name,
    users.last_name,
    bookings.booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date,
    bookings.status
FROM 
    users
RIGHT JOIN 
    bookings ON users.user_id = bookings.user_id
ORDER BY 
    user_id, booking_id;
