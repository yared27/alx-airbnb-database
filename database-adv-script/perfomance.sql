
-- an initial query that retrieves all bookings along with the user details, property details, and payment details.

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

