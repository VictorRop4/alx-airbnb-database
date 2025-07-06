 Entity Relationship Definitions
1. User ↔ Property
Relationship: One-to-Many

Description: A user with the role of host can create multiple properties.

Implementation:

Property.host_id → User.user_id

Foreign key constraint ensures referential integrity.

Cardinality:

One user (host) → many properties

One property → one host

2. User ↔ Booking
Relationship: One-to-Many

Description: A user with the role of guest can make multiple bookings.

Implementation:

Booking.user_id → User.user_id

Cardinality:

One user (guest) → many bookings

One booking → one guest

3. Property ↔ Booking
Relationship: One-to-Many

Description: A single property can be booked multiple times by different users.

Implementation:

Booking.property_id → Property.property_id

Cardinality:

One property → many bookings

One booking → one property

4. Booking ↔ Payment
Relationship: One-to-One

Description: Each booking can have at most one associated payment.

Implementation:

Payment.booking_id → Booking.booking_id

Cardinality:

One booking → one payment

One payment → one booking

(Can enforce uniqueness constraint on Payment.booking_id to preserve 1:1)

5. Property ↔ Review
Relationship: One-to-Many

Description: A property can receive multiple reviews from different users.

Implementation:

Review.property_id → Property.property_id

Cardinality:

One property → many reviews

One review → one property

6. User ↔ Review
Relationship: One-to-Many

Description: A user can post multiple reviews.

Implementation:

Review.user_id → User.user_id

Cardinality:

One user → many reviews

One review → one user

7. User ↔ Message (Sender–Recipient)
Relationship: Many-to-Many (via self-referencing one-to-many in both directions)

Description: Users can send and receive messages from other users.

Implementation:

Message.sender_id → User.user_id

Message.recipient_id → User.user_id

Cardinality:

One user → many sent messages

One user → many received messages

Each message → one sender and one recipient
