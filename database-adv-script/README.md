# 🏡 Airbnb Clone – SQL Schema and Sample Data

This project provides a relational database schema for an Airbnb-like platform, including core functionality such as user authentication, property management, booking, payments, messaging, and reviews. The SQL scripts are written for PostgreSQL but are largely compatible with other RDBMS (e.g., MySQL, SQLite) with minor adjustments.

---

## 📦 Contents

- `schema.sql` – Contains:
  - Table definitions (`CREATE TABLE`)
  - Indexing strategies
  - Sample data insertions (`INSERT INTO`)
  - Sample queries using SQL joins

---

## 🧱 Database Tables

| Table        | Description |
|--------------|-------------|
| `users`      | Stores guest, host, and admin user information |
| `properties` | Listings created and managed by hosts |
| `bookings`   | Bookings created by guests on listed properties |
| `payments`   | Payment records associated with bookings |
|

