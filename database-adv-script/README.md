
## 🏠 Airbnb Database – SQL Join Queries

### 📌 Project Context
This is part of the **Airbnb Clone Project**. The goal is to query and analyze relationships between users, bookings, properties, and reviews using SQL JOIN operations.

---

### 📚 Objectives
- Retrieve relational data across normalized tables.
- Apply `INNER JOIN`, `LEFT JOIN`, and `FULL OUTER JOIN` in real-world Airbnb scenarios.
- Handle cases where data may or may not exist on both sides of a relationship.

---

### 🗃️ Tables
- **`users`**: Stores user info (guests, hosts).
- **`bookings`**: Tracks reservations linked to users and properties.
- **`properties`**: Lists all available properties.
- **`reviews`**: Captures user feedback on properties.

---

### 🧩 SQL Queries

#### 1. 🔄 `INNER JOIN` – Get all bookings with user details
```sql
SELECT 
    bookings.*, 
    users.first_name, 
    users.last_name
FROM bookings
INNER JOIN users ON bookings.user_id = users.user_id;
```
✔️ Returns only bookings with a matching user.

---

#### 2. 📌 `LEFT JOIN` – All properties, even without reviews
```sql
SELECT 
    properties.*, 
    reviews.rating, 
    reviews.comment
FROM properties
LEFT JOIN reviews ON properties.property_id = reviews.property_id;
```
✔️ Useful for showing unrated properties.

---

#### 3. 🌐 `FULL OUTER JOIN` – All users and all bookings (matched or not)
```sql
SELECT 
    u.user_id, u.first_name, u.last_name, u.email, u.phone_number, u.role,
    b.booking_id, b.property_id, b.start_date, b.end_date, b.total_price, b.status
FROM users u
FULL OUTER JOIN bookings b ON u.user_id = b.user_id;
```
✔️ Reveals users with no bookings and bookings with no valid user.

> 🛠️ MySQL does not support `FULL OUTER JOIN` natively — use `UNION` of `LEFT JOIN` and `RIGHT JOIN` instead.

---

### 🧠 Key Learnings
- Joins help combine data from normalized tables to reflect real-world relationships.
- Using `LEFT JOIN` and `FULL OUTER JOIN` helps identify missing links and improve data integrity.
- SQL joins are essential in building reliable APIs and dashboards in full-stack Airbnb apps.

---


