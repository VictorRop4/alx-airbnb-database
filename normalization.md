# 🧮 Third Normal Form (3NF) Compliance – Airbnb Clone Database

## 📘 Overview

This document outlines the normalization strategy applied in the design of the Airbnb Clone relational database schema. The database conforms to the **Third Normal Form (3NF)** to eliminate redundancy, ensure data integrity, and optimize query performance.

---

## 📚 What is 3NF?

Third Normal Form is achieved when a database satisfies the following:

1. **1NF (First Normal Form)**: All attributes contain only atomic values; no repeating groups.
2. **2NF (Second Normal Form)**: All non-key attributes are fully functionally dependent on the entire primary key.
3. **3NF (Third Normal Form)**: There are no transitive dependencies; non-key attributes are not dependent on other non-key attributes.

---

## ✅ Application of 3NF in This Project

### 1. **First Normal Form (1NF)**

- All tables use atomic fields; no multi-valued or nested attributes.
- Example: `phone_number`, `email`, and `role` in the `users` table are scalar and indivisible.

### 2. **Second Normal Form (2NF)**

- Every table has a single-attribute primary key (`UUID`).
- All non-key attributes are fully dependent on the primary key.
- Example: In the `bookings` table, `total_price` depends on the `booking_id` (not just part of it, as no composite keys exist).

### 3. **Third Normal Form (3NF)**

- There are no transitive dependencies across tables.
- Each non-key attribute depends directly on the primary key.
- Example:
  - In the `properties` table, `location` and `pricepernight` depend only on `property_id`.
  - In the `reviews` table, `comment` and `rating` are dependent solely on `review_id`.

---

## 🔍 Notes on Design Decisions

- **UUIDs** were used as primary keys to ensure global uniqueness and support distributed system scalability.
- **Foreign key constraints** enforce referential integrity while supporting deletion cascades to maintain consistency.
- **Indexes** improve performance on frequently queried fields (`email`, `user_id`, `property_id`, etc.).
- **Check constraints** (e.g., on `role`, `status`, and `rating`) enforce domain rules.

---

## 🔄 Example: Eliminating Transitive Dependency

Suppose we stored a derived field like `number_of_nights` in the `bookings` table, which can be computed from `start_date` and `end_date`. This would violate 3NF due to a transitive dependency. Hence, it is excluded from maintaining normalization.

---

## 📌 Conclusion

This schema adheres strictly to 3NF, ensuring:

- Elimination of update anomalies
- Minimal redundancy
- Improved data consistency
- Logical and maintainable structure for long-term scalability

                                             


