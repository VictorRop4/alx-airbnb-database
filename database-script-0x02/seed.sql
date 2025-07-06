-- Sample Data Inserts

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
