# 📊 Index Performance Analysis – Airbnb Clone Backend

## 🎯 Objective
This document explains the rationale behind index creation in the Airbnb Clone backend database and how to analyze query performance improvements using these indexes.

---

## ⚙️ Indexed Tables and Columns

### 1. **Users Table**
| Column         | Reason for Indexing         |
|----------------|-----------------------------|
| `user_id`      | Frequently used in joins     |
| `email`        | Used for authentication lookup (`WHERE` clause) |

### 2. **Bookings Table**
| Column           | Reason for Indexing         |
|------------------|-----------------------------|
| `user_id`        | Join/filter by user bookings |
| `property_id`    | Join/filter by property      |
| `created_at`     | Time-based filtering         |
| `status`         | Used in filters for booking states |

### 3. **Properties Table**
| Column           | Reason for Indexing         |
|------------------|-----------------------------|
| `property_id`    | Join and aggregation         |
| `name`           | Potential search/filter use  |
| `location`       | Filtering and user search    |
| `pricepernight`  | Sorting/filtering            |
| `created_at`     | Time-based sorting           |

---

## 🧪 Performance Measurement

### ✅ Recommended Tools
- **PostgreSQL**: `EXPLAIN`, `EXPLAIN ANALYZE`
- **MySQL**: `EXPLAIN`

### 🧾 Example Usage
```sql
-- Before and after adding indexes
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = '2222...';

EXPLAIN ANALYZE
SELECT * FROM users WHERE email = 'example@host.com';
```

### 🔍 What to Look For
- **Seq Scan** → replaced with **Index Scan** or **Bitmap Index Scan**
- Reduced execution time (e.g., from milliseconds to microseconds)
- Fewer rows examined

---

## 🚀 Summary
Adding indexes improves lookup and join performance significantly on high-frequency access columns. Use `EXPLAIN` or `ANALYZE` to confirm index effectiveness and adjust as needed based on real query patterns and system load.

---

## 📁 Related Files
- `database_index.sql` – Contains all `CREATE INDEX` commands for optimized performance
- `schema.sql` – Table structures and constraints
- `aggregations_windows.sql` – Queries that benefit from added indexes
