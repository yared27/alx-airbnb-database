
-- a query to find all properties where the average rating is greater than 4.0 using a subquery
SELECT 
       P.property_id,
       p.host_id,
       P.name,
       p.description,
       p.price_per_night,
FROM properties P
WHERE p.property_id IN (SELECT r.property_id
     FROM reviews r
     GROUP BY r.property_id
     HAVING AVG(rating) > 4.0
    );

-- a correlated subquery to find users who have made more than 3 bookings

SELECT 
        u.user_id,
        u.first_name,
        u.last_name,
        u.email,
        u.phone_number,
        u.role
FROM users u 
WHERE  (
        SELECT COUNT(*)
        FROM bookings b 
        WHERE b.user_id = u.user_id
)>3


