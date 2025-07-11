-- Performance measurement before adding indexes
-- Save this output to compare with post-index results

-- Query 1: User bookings lookup
EXPLAIN ANALYZE
SELECT * FROM Bookings WHERE user_id = '44444444-4444-4444-4444-444444444444';

-- Query 2: Property location search
EXPLAIN ANALYZE
SELECT * FROM properties WHERE location LIKE 'New York%';

-- Query 3: Booking status report
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE status = 'confirmed';

-----------------------------------------
-- CREATE INDEX STATEMENTS
-----------------------------------------

-- 1. User Table Indexes
CREATE INDEX idx_user_email ON users(email);
CREATE INDEX idx_user_role ON users(role);
CREATE INDEX idx_user_name ON users(first_name, last_name);

-- 2. Property Table Indexes
CREATE INDEX idx_property_host ON properties(host_id);
CREATE INDEX idx_property_location ON properties(location);
CREATE INDEX idx_property_price ON properties(pricepernight);
CREATE INDEX idx_property_dates ON properties(created_at, updated_at);

-- 3. Booking Table Indexes
CREATE INDEX idx_booking_user ON bookings(user_id);
CREATE INDEX idx_booking_property ON bookings(property_id);
CREATE INDEX idx_booking_dates ON bookings(start_date, end_date);
CREATE INDEX idx_booking_status ON bookings(status);
CREATE INDEX idx_booking_user_property ON bookings(user_id, property_id);

-- 4. Composite index
CREATE INDEX idx_booking_property_user_dates ON bookings(property_id, user_id, start_date, end_date);

-- 5. Review Table Indexes
CREATE INDEX idx_review_property ON reviewseview(property_id);
CREATE INDEX idx_review_user ON reviewseview(user_id);
CREATE INDEX idx_review_rating ON reviewseview(rating);

-- 6. Payment Table Index
CREATE INDEX idx_payment_booking ON payments(booking_id);

-----------------------------------------
-- Performance measurement after adding indexes
-----------------------------------------

-- Query 1: User bookings lookup (with index)
EXPLAIN ANALYZE
SELECT * FROM booking WHERE user_id = '44444444-4444-4444-4444-444444444444';

-- Query 2: Property location search (with index)
EXPLAIN ANALYZE
SELECT * FROM properties WHERE location LIKE 'New York%';

-- Query 3: Booking status report (with index)
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE status = 'confirmed';