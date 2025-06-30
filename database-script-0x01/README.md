# 📘 Database Schema Design (DDL) – Airbnb Clone

This folder contains the SQL Data Definition Language (DDL) script for designing a normalized relational database schema for the Airbnb Clone project.

---

## 🎯 Objective

To define all tables, relationships, constraints, and indexes using PostgreSQL SQL syntax, based on the provided database specification.

---

## 📄 Files

- `schema.sql`: The main SQL file containing all `CREATE TABLE` statements, `ENUM` definitions, and `INDEX` creations.

---

## ✅ Features of the Schema

- Fully normalized to **Third Normal Form (3NF)**
- Uses **UUID** as primary keys for all tables
- Defines **foreign key constraints** to enforce relationships
- Includes **ENUM types** for `booking_status` and `payment_methods`
- Adds **indexes** for performance on key lookup columns
- Covers essential entities:
  - `users`
  - `properties`
  - `bookings`
  - `payments`
  - `reviews`
  - `messages`

---

## 📦 How to Use

1. Make sure PostgreSQL is installed and running.
2. Create a new database (if not done already):
   ```bash
   createdb airbnb_clone
