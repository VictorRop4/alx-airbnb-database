# 🔗 Entity Relationships – Airbnb Clone Database

## 📘 Overview

This document outlines the logical relationships between the entities in the Airbnb Clone relational database schema. These relationships enforce business rules and ensure referential integrity across the platform's core functionalities such as user management, property hosting, booking, and communication.

---

## 🔄 Entity Relationships

### 1. **User ↔ Property**
- **Relationship**: One-to-Many
- **Details**: A user (host) can list multiple properties.
- **Implementation**: `properties.host_id` is a foreign key referencing `users.user_id`.

### 2. **User ↔ Booking**
- **Relationship**: One-to-Many
- **Details**: A user (guest) can make multiple bookings.
- **Implementation**: `bookings.user_id` is a foreign key referencing `users.user_id`.

### 3. **Property ↔ Booking**
- **Relationship**: One-to-Many
- **Details**: A property can be booked multiple times by different users.
- **Implementation**: `bookings.property_id` is a foreign key referencing `properties.property_id`.

### 4. **Booking ↔ Payment**
- **Relationship**: One-to-One (or One-to-Zero-or-One, depending on platform policy)
- **Details**: Each booking can have at most one associated payment record.
- **Implementation**: `payments.booking_id` is a foreign key referencing `bookings.booking_id`.

### 5. **User ↔ Review**
- **Relationship**: One-to-Many
- **Details**: A guest may leave multiple reviews, each for a different property.
- **Implementation**: `reviews.user_id` is a foreign key referencing `users.user_id`.

### 6. **Property ↔ Review**
- **Relationship**: One-to-Many
- **Details**: A property can receive multiple reviews from different users.
- **Implementation**: `reviews.property_id` is a foreign key referencing `properties.property_id`.

### 7. **User ↔ Message (Sender and Recipient)**
- **Relationship**: Many-to-Many (self-referencing)
- **Details**: Users can send and receive multiple messages to/from other users.
- **Implementation**: `messages.sender_id` and `messages.recipient_id` both reference `users.user_id`.

---

## 🧭 Summary Table

| From Entity | To Entity   | Cardinality     | Description                                 |
|-------------|-------------|-----------------|---------------------------------------------|
| `users`     | `properties`| 1 → many        | A host can list multiple properties         |
| `users`     | `bookings`  | 1 → many        | A guest can make multiple bookings          |
| `properties`| `bookings`  | 1 → many        | A property can have many bookings           |
| `bookings`  | `payments`  | 1 → 1 (or 0..1)  | A booking may have one payment              |
| `users`     | `reviews`   | 1 → many        | A guest can leave multiple reviews          |
| `properties`| `reviews`   | 1 → many        | A property can receive many reviews         |
| `users`     | `messages`  | many ↔ many      | Users can message one another               |

---

## 🎯 ERD Design Considerations

- **Cascading Deletes**: Enforced to remove dependent records (e.g., if a user is deleted, their properties, bookings, and messages are also deleted).
- **UUID Primary Keys**: Used across all tables to ensure unique and scalable identification of records.
- **Indexing**: Applied on all foreign keys to optimize join performance.

---

## 📌 Note

This documentation represents logical relationships and may be used to generate an ER diagram (ERD) using tools like dbdiagram.io, drawSQL, or pgModeler.

