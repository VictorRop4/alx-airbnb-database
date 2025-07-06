# 🏡 Airbnb Clone – Relational Database Design

## 📘 Project Overview

This project presents a relational database schema for an Airbnb-like property rental platform. It is designed to manage core functionalities such as user registration, property listings, bookings, payments, reviews, and user messaging. The schema is normalized up to the Third Normal Form (3NF) and utilizes PostgreSQL as the target database management system.

---

## 🧱 Technologies Used

- PostgreSQL (Relational Database)
- SQL (DDL & DML)
- UUIDs for Primary Keys
- Indexes for Query Optimization

---

## 🗃️ Database Schema

The schema includes the following normalized tables:

| Table       | Description                                      |
|-------------|--------------------------------------------------|
| `users`     | Stores user information, including roles         |
| `properties`| Contains listings created by hosts               |
| `bookings`  | Records reservation transactions                 |
| `payments`  | Logs payment transactions linked to bookings     |
| `reviews`   | Contains user feedback for properties            |
| `messages`  | Stores direct communication between users        |

All relationships are enforced using `FOREIGN KEY` constraints with `ON DELETE CASCADE` to ensure referential integrity.

---

## 🧪 Sample Data

The schema includes a set of `INSERT` statements simulating real-world data:

- **Users**: Includes hosts and guests with distinct roles
- **Properties**: Two listings in Kenya (Diani Beach and Nairobi)
- **Bookings**: Confirmed and pending reservations
- **Payments**: Linked to confirmed bookings using various methods
- **Reviews**: Realistic feedback with ratings
- **Messages**: Conversations between users (e.g., check-in coordination)

These records are intended for testing, demonstration, and UI development.

---

## ⚙️ How to Use

1. **Create the database** (if not yet created):
   ```bash
   createdb airbnb_clone
