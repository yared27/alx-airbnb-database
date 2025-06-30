# Database Normalization - ALX Airbnb Database

This document explains the normalization process applied to the Airbnb database schema to ensure it complies with the Third Normal Form (3NF).

---

## ✅ First Normal Form (1NF)

### Rule:
- All table attributes must have **atomic values** (no multivalued fields or repeating groups).
  
### Application:
- All fields in the schema contain atomic values. For example:
  - `first_name`, `last_name` are single fields.
  - `phone_number` is not stored as a list.
  - `ENUM` types such as `role`, `status`, and `payment_method` store single, atomic values.

✅ **All tables comply with 1NF.**

---

## ✅ Second Normal Form (2NF)

### Rule:
- Must be in 1NF.
- All **non-key attributes must be fully functionally dependent** on the entire primary key.

### Application:
- All tables use a single-column primary key (e.g., `user_id`, `property_id`, `booking_id`), so there are **no partial dependencies**.
- Composite foreign keys like in `Booking` or `Review` are not primary keys, so they do not violate 2NF.

✅ **All tables comply with 2NF.**

---

## ✅ Third Normal Form (3NF)

### Rule:
- Must be in 2NF.
- **No transitive dependencies** (non-key attributes must not depend on other non-key attributes).

### Review:
- No attributes derive values from other non-key attributes.
  - Example: `total_price` in `Booking` is calculated but not dependent on another field in the same table.
  - `email` is unique, but not functionally dependent on `first_name` or `last_name`.
- No derived fields like `full_name`, `age`, or other calculated values stored directly.

✅ **All tables are in 3NF.**

---

## 🔍 Summary

| Table      | 1NF | 2NF | 3NF |
|------------|-----|-----|-----|
| User       | ✅  | ✅  | ✅  |
| Property   | ✅  | ✅  | ✅  |
| Booking    | ✅  | ✅  | ✅  |
| Payment    | ✅  | ✅  | ✅  |
| Review     | ✅  | ✅  | ✅  |
| Message    | ✅  | ✅  | ✅  |

---

## ✅ Conclusion

No redundancies or transitive dependencies were found. The current Airbnb database schema is **fully normalized up to 3NF**, ensuring data integrity, reducing redundancy, and optimizing relational design.
