# 📄 `seed.sql` – Sample Data for Airbnb-style Database

This SQL script populates the PostgreSQL database with realistic sample data for users, properties, bookings, payments, reviews, and messages. It is useful for testing, development, and demonstration of the Airbnb-like application.

---

## ✅ Prerequisites

Before running this script:

- Make sure the database schema is already created (tables, types, constraints).
- Ensure `pgcrypto` extension is enabled to support `gen_random_uuid()`:

```sql
CREATE EXTENSION IF NOT EXISTS "pgcrypto";
