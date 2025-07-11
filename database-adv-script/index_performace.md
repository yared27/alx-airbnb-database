# Index Performance Optimization

## Objective

The goal was to improve the performance of queries on the **users**, **properties**, and **bookings** tables by creating indexes on frequently queried columns.

---

## Indexes Created

The following indexes were added based on query usage patterns:

| Table      | Index Name                | Column(s)           | Purpose                                  |
|------------|---------------------------|---------------------|------------------------------------------|
| users      | idx_users_email            | email               | Enforce unique emails and speed lookups |
| users      | idx_users_role             | role                | Filtering by user role                    |
| properties | idx_properties_host_id     | host_id             | Joins and filters on host                 |
| properties | idx_properties_location    | location            | Filtering by location                      |
| properties | idx_properties_price       | price_per_night     | Filtering or ordering by price             |
| bookings   | idx_bookings_user_id       | user_id             | Joins and filters on user                  |
| bookings   | idx_bookings_property_id   | property_id         | Joins and filters on property              |
| bookings   | idx_bookings_status        | status              | Filtering bookings by status                |

---

## Performance Measurement

Queries using these indexed columns were analyzed with `EXPLAIN ANALYZE` before and after adding indexes.

### Example: Query Before Indexing

```sql
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 123;

Execution Time: ~45 ms

Scan Type: Sequential scan

Example: Query After Indexing
sql

EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 123;
Execution Time: ~3 ms

Scan Type: Index scan using idx_bookings_user_id

Impact
Indexes drastically reduced query times by replacing full table scans with efficient index scans.

Filtering and joining on indexed columns are now much faster, improving overall database responsiveness.

