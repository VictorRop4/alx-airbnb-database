-- database_index.sql

-- Indexes for Users Table
CREATE INDEX idx_users_user_id ON users(user_id);
CREATE INDEX idx_users_email ON users(email);

-- Indexes for Bookings Table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_created_at ON bookings(created_at);
CREATE INDEX idx_bookings_status ON bookings(status);

-- Indexes for Properties Table
CREATE INDEX idx_properties_property_id ON properties(property_id);
CREATE INDEX idx_properties_name ON properties(name);
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_pricepernight ON properties(pricepernight);
CREATE INDEX idx_properties_created_at ON properties(created_at);

-- To assess performance before and after indexing, use EXPLAIN (PostgreSQL) or EXPLAIN ANALYZE (MySQL/PostgreSQL) on queries such as:
-- EXPLAIN SELECT * FROM bookings WHERE user_id = '...';
-- EXPLAIN ANALYZE SELECT * FROM users WHERE email = '...';
