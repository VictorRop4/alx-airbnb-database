
-- schema.sql

-- 1. Users Table
CREATE TABLE users (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role VARCHAR(10) CHECK (role IN ('guest', 'host', 'admin')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_users_email ON users(email);

-- 2. Properties Table
CREATE TABLE properties (
    property_id UUID PRIMARY KEY,
    host_id UUID NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    pricepernight DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (host_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE INDEX idx_properties_host ON properties(host_id);
CREATE INDEX idx_properties_location ON properties(location);

-- 3. Bookings Table
CREATE TABLE bookings (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(10) CHECK (status IN ('pending', 'confirmed', 'canceled')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (property_id) REFERENCES properties(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE INDEX idx_bookings_property ON bookings(property_id);
CREATE INDEX idx_bookings_user ON bookings(user_id);
CREATE INDEX idx_bookings_status ON bookings(status);

-- 4. Payments Table
CREATE TABLE payments (
    payment_id UUID PRIMARY KEY,
    booking_id UUID NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(20) CHECK (payment_method IN ('credit_card', 'paypal', 'stripe')) NOT NULL,

    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) ON DELETE CASCADE
);

CREATE INDEX idx_payments_booking ON payments(booking_id);

-- 5. Reviews Table
CREATE TABLE reviews (
    review_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    rating INTEGER NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (property_id) REFERENCES properties(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE INDEX idx_reviews_property ON reviews(property_id);
CREATE INDEX idx_reviews_user ON reviews(user_id);

-- 6. Messages Table
CREATE TABLE messages (
    message_id UUID PRIMARY KEY,
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (sender_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (recipient_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE INDEX idx_messages_sender ON messages(sender_id);
CREATE INDEX idx_messages_recipient ON messages(recipient_id);

-- 7. Sample Data Inserts

-- Users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('11111111-1111-1111-1111-111111111111', 'Sophia', 'Lopez', 'sophia.lopez@homestay.com', 'hashedpassword1', '555-0101', 'host'),
('22222222-2222-2222-2222-222222222222', 'Liam', 'Ngugi', 'liam.ngugi@travelnow.org', 'hashedpassword2', '555-0202', 'guest'),
('33333333-3333-3333-3333-333333333333', 'Amina', 'Wanjiru', 'amina.wanjiru@globetrotters.io', 'hashedpassword3', '555-0303', 'guest');

-- Properties
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES
('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 'Beachside Bungalow', 'Enjoy ocean breezes and a sunset view in this charming coastal retreat.', 'Diani Beach, KE', 150.00),
('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 'Garden Apartment', 'Modern and quiet 2-bedroom flat with garden access.', 'Nairobi, KE', 75.00);

-- Bookings
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('b1111111-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', '2025-12-15', '2025-12-20', 750.00, 'confirmed'),
('b2222222-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '33333333-3333-3333-3333-333333333333', '2025-09-01', '2025-09-03', 150.00, 'pending');

-- Payments
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
('p1111111-pppp-pppp-pppp-pppppppppppp', 'b1111111-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 750.00, 'paypal');

-- Reviews
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
('r1111111-rrrr-rrrr-rrrr-rrrrrrrrrrrr', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 5, 'Breathtaking view and very clean. Host was friendly and helpful.'),
('r2222222-rrrr-rrrr-rrrr-rrrrrrrrrrrr', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '33333333-3333-3333-3333-333333333333', 4, 'Comfortable and well-furnished. Great for a weekend stay.');

-- Messages
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
('m1111111-mmmm-mmmm-mmmm-mmmmmmmmmmmm', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hi Sophia, can I check in earlier than 3 PM?'),
('m2222222-mmmm-mmmm-mmmm-mmmmmmmmmmmm', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Sure, early check-in is fine. I will prepare the house by noon.');

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
    users ON bookings.user_id = users.user_id;

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
    reviews ON properties.property_id = reviews.property_id;

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
    bookings ON users.user_id = bookings.user_id;
