# Query Optimization Report

## Objective

Improve the performance of a query that retrieves bookings with user, property, and payment information.

---

## Initial Query

The original query joined the `Booking`, `User`, `Property`, and `Payment` tables and selected a wide range of columns, including some unused fields.

### Performance Analysis

Using `EXPLAIN ANALYZE`, the query showed:

- **Sequential scans** on large tables
- **High execution cost**
- **Multiple joins with wide column selection**

---

## Optimizations Made

- **Reduced the number of selected columns** to only those needed
- **Used LEFT JOIN** only where necessary (on Payment)
- **Ensured indexes exist** on:
  - `Booking(user_id)`
  - `Booking(property_id)`
  - `Payment(booking_id)`
  - `User(id)`
  - `Property(id)`

---

## Refactored Query Results

After optimization:

- **Execution time dropped**
- **Sequential scans reduced** to index scans
- **Query plan simplified**, reducing join complexity and memory use

---

## Conclusion

By minimizing selected columns, reviewing join types, and indexing foreign keys, we reduced query execution time significantly and made the query more scalable.
