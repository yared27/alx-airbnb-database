
<!-- a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings. -->

SELECT bookings.*,users.first_name, users.last_name
FROM bookings
INNER JOIN users ON users.user_id = bookings.user_id;


-- a query using a LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews

SELECT 
       p.property_id, 
       p.host_id, 
       p.name, 
       p.description, 
       p.location, 
       p.price_per_night, 
       r.review_id,
       r.rating,
       r.comment
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id;


-- Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.

SELECT 
        u.user_id,
        u.first_name,
        u.last_name,
        u.email,
        u.phone_number,
        u.role,
        b.booking_id,
        b.property_id,
        b.start_date,
        b.end_date,
        b.total_price,
        b.status
FROM users u FULL OUTER JOIN bookings b ON u.user_id = b.user_id;
