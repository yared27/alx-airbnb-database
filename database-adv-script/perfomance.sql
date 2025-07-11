
-- an initial query that retrieves all bookings along with the user details, property details, and payment details.


-- Unoptimized query retrieving all bookings with related details (no JOINs)

EXPLAIN ANALYZE
SELECT 
    bookings.booking_id,
    bookings.start_date,
    bookings.end_date,
    bookings.total_price,
    bookings.booking_status,
    bookings.created_at AS booking_created_at,
    bookings.user_id,
    bookings.property_id,
    bookings.payment_id,

    users.first_name,
    users.last_name,
    users.email,
    users.password_hash,
    users.phone_number,
    users.role,

    properties.host_id,
    properties.name,
    properties.description,
    properties.location,
    properties.price_per_night,

    payments.amount,
    payments.payment_date,
    payments.payment_method
FROM 
    bookings,
    users,
    properties,
    payments
WHERE
    bookings.user_id = users.user_id
    AND bookings.property_id = properties.property_id
    AND bookings.payment_id = payments.payment_id;


-- optimized query retrieving all bookings with related details 
EXPLAIN ANALYZE
SELECT b.booking_id,
       b.start_date,
       b.end_date,
       b.total_price,
       b.booking_status,
       b.created_at AS booking_created_at,

       u.first_name,
       u.last_name,
       u.email,
       u.password_hash,
       u.phone_number,
       u.role,

       p.host_id,
       p.name,
       p.description,
       p.location,
       p.price_per_night,

       pay.amount,
       pay.payment_date,
       pay.payment_method
from bookings b 
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id 
LEFT JOIN payments pay ON b.payment_id = pay.payment_id

