-- ================================================================
-- SEED.SQL – SAMPLE DATA FOR AIRBNB-STYLE DATABASE
-- This script populates all core tables with realistic dummy data
-- Useful for development, testing, and demonstration purposes
-- ================================================================

-- REQUIREMENT: Ensure pgcrypto extension is enabled for UUID generation
-- Run: CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ========================
-- USERS TABLE SAMPLE DATA
-- ========================
-- Inserts 3 users: a host, a guest, and an admin

INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
    (gen_random_uuid(), 'John', 'Doe', 'john.doe@example.com', 'hashed_password_1', '123-456-7890', 'host', NOW()),
    (gen_random_uuid(), 'Jane', 'Doe', 'jane.doe@example.com', 'hashed_password_2', '098-765-4321', 'guest', NOW()),
    (gen_random_uuid(), 'Yared', 'Alex', 'admin@example.com', 'hashed_password_3', '555-555-5555', 'admin', NOW());

-- ===========================
-- PROPERTIES TABLE SAMPLE DATA
-- ===========================
-- Each property is owned by one of the users above

INSERT INTO properties (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
VALUES
    (gen_random_uuid(), (SELECT user_id FROM users WHERE email = 'john.doe@example.com'), 'Cozy Cottage', 'A lovely cottage in the countryside.', 'Countryside', 100.00, NOW(), NOW()),
    (gen_random_uuid(), (SELECT user_id FROM users WHERE email = 'jane.doe@example.com'), 'Modern Apartment', 'A stylish apartment in the city center.', 'City Center', 150.00, NOW(), NOW()),
    (gen_random_uuid(), (SELECT user_id FROM users WHERE email = 'admin@example.com'), 'Luxury Villa', 'A luxurious villa with a sea view.', 'Beachfront', 300.00, NOW(), NOW());

-- ==========================
-- BOOKINGS TABLE SAMPLE DATA
-- ==========================
-- Links guests to properties over specified dates

INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
    (gen_random_uuid(), (SELECT property_id FROM properties WHERE name = 'Cozy Cottage'), (SELECT user_id FROM users WHERE email = 'john.doe@example.com'), '2023-10-01', '2023-10-05', 400.00, 'confirmed', NOW()),
    (gen_random_uuid(), (SELECT property_id FROM properties WHERE name = 'Modern Apartment'), (SELECT user_id FROM users WHERE email = 'jane.doe@example.com'), '2023-10-10', '2023-10-15', 750.00, 'pending', NOW()),
    (gen_random_uuid(), (SELECT property_id FROM properties WHERE name = 'Luxury Villa'), (SELECT user_id FROM users WHERE email = 'admin@example.com'), '2023-10-20', '2023-10-25', 1500.00, 'cancelled', NOW());

-- ==========================
-- PAYMENTS TABLE SAMPLE DATA
-- ==========================
-- Associates payments with existing bookings

INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
    (gen_random_uuid(), (SELECT booking_id FROM bookings WHERE user_id = (SELECT user_id FROM users WHERE email = 'john.doe@example.com')), 400.00, 'credit_card'),
    (gen_random_uuid(), (SELECT booking_id FROM bookings WHERE user_id = (SELECT user_id FROM users WHERE email = 'jane.doe@example.com')), 750.00, 'paypal'),
    (gen_random_uuid(), (SELECT booking_id FROM bookings WHERE user_id = (SELECT user_id FROM users WHERE email = 'admin@example.com')), 1500.00, 'stripe');

-- ==========================
-- REVIEWS TABLE SAMPLE DATA
-- ==========================
-- Users provide feedback on the properties they've booked

INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
    (gen_random_uuid(), (SELECT property_id FROM properties WHERE name = 'Cozy Cottage'), (SELECT user_id FROM users WHERE email = 'john.doe@example.com'), 5, 'Great place!'),
    (gen_random_uuid(), (SELECT property_id FROM properties WHERE name = 'Modern Apartment'), (SELECT user_id FROM users WHERE email = 'jane.doe@example.com'), 4, 'Very nice apartment.'),
    (gen_random_uuid(), (SELECT property_id FROM properties WHERE name = 'Luxury Villa'), (SELECT user_id FROM users WHERE email = 'admin@example.com'), 3, 'Okay, but had some issues.');

-- ===========================
-- MESSAGES TABLE SAMPLE DATA
-- ===========================
-- Simulates communication between users (guest ↔ host)

INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
    (gen_random_uuid(), (SELECT user_id FROM users WHERE email = 'john.doe@example.com'), (SELECT user_id FROM users WHERE email = 'jane.doe@example.com'), 'Looking forward to my stay!'),
    (gen_random_uuid(), (SELECT user_id FROM users WHERE email = 'jane.doe@example.com'), (SELECT user_id FROM users WHERE email = 'john.doe@example.com'), 'Hope you enjoy the place!'),
    (gen_random_uuid(), (SELECT user_id FROM users WHERE email = 'admin@example.com'), (SELECT user_id FROM users WHERE email = 'john.doe@example.com'), 'Let me know if you need anything!');
