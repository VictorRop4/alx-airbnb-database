# 🛠️ Query Optimization Report – Airbnb Clone Backend

## 🎯 Objective
This report documents the optimization process for a complex SQL query retrieving bookings along with associated user, property, and payment details. It outlines performance issues, index usage, and query refactoring.

---

## 🧾 Initial Query Summary
**Joins Used**: `bookings` ⨝ `users` ⨝ `properties` ⟕ `payments`

```sql
SELECT 
    b.booking_id, b.start_date, b.end_date, b.status,
    u.user_id, u.first_name, u.last_name, u.email,
    p.property_id, p.name AS property_name, p.location, p.pricepernight,
    pay.payment_id, pay.amount, pay.payment_method
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;
```

### 🔍 Performance Issues
- Retrieves unnecessary fields
- No `ORDER BY`, inefficient for paginated results
- Joins on unindexed columns increase scan cost

---

## 🔧 Optimization Strategy

### ✅ Indexes Applied
- `bookings(user_id)`
- `bookings(property_id)`
- `bookings(start_date)`
- `payments(booking_id)`

### ✅ Refactored Query
```sql
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    CONCAT(u.first_name, ' ', u.last_name) AS user_fullname,
    u.email,
    p.name AS property_name,
    pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
ORDER BY b.start_date DESC;
```

### 🧠 Improvements
- Fewer fields reduce memory usage
- Uses indexed columns for `JOIN` and `ORDER BY`
- Maintains LEFT JOIN for nullable payment data

---

## 📈 Performance Validation
Use the following to validate improvements:
```sql
EXPLAIN ANALYZE <query_here>
```
**Metrics to compare**:
- Planning/Execution Time
- Join method (e.g., Seq Scan vs Index Scan)
- Number of rows examined

---

## 🧾 Summary
Proper indexing and query simplification significantly enhance query execution performance. The refactored query improves maintainability, speeds up response time, and aligns with backend API response requirements.
