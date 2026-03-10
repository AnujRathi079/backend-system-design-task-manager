# Database Design (PostgreSQL)

## Overview

This document describes the PostgreSQL database schema for the Interior Designer Booking System.

The system allows users to:

* Browse designers
* Book interior design services
* Leave reviews
* View designer projects

---

# Entities

The system contains the following entities:

Users
Designers
Reviews
Booking
Projects

---

# ERD Diagram

![ERD](../images/erd.png)

---

# Table Definitions

## Users Table

Stores application users who can book designers and write reviews.

| Column     | Type               | Description            |
| ---------- | ------------------ | ---------------------- |
| user_id    | SERIAL PRIMARY KEY | Unique user identifier |
| name       | VARCHAR(100)       | User name              |
| email      | VARCHAR(150)       | User email             |
| password   | TEXT               | Encrypted password     |
| phone      | VARCHAR(20)        | Contact number         |
| created_at | TIMESTAMP          | Account creation time  |

---

## Designers Table

Stores information about interior designers.

| Column      | Type               | Description                |
| ----------- | ------------------ | -------------------------- |
| designer_id | SERIAL PRIMARY KEY | Unique designer identifier |
| name        | VARCHAR(100)       | Designer name              |
| email       | VARCHAR(150)       | Designer email             |
| phone       | VARCHAR(20)        | Contact number             |
| city        | VARCHAR(100)       | City location              |
| experience  | INTEGER            | Years of experience        |
| created_at  | TIMESTAMP          | Profile creation time      |

---

## Reviews Table

Stores reviews written by users for designers.

| Column      | Type               | Description           |
| ----------- | ------------------ | --------------------- |
| review_id   | SERIAL PRIMARY KEY | Review identifier     |
| user_id     | INTEGER            | Reference to user     |
| designer_id | INTEGER            | Reference to designer |
| rating      | INTEGER            | Rating score          |
| comment     | TEXT               | Review comment        |
| created_at  | TIMESTAMP          | Review creation time  |

---

## Booking Table

Stores booking records when a user books a designer.

| Column       | Type               | Description           |
| ------------ | ------------------ | --------------------- |
| booking_id   | SERIAL PRIMARY KEY | Booking identifier    |
| user_id      | INTEGER            | Reference to user     |
| designer_id  | INTEGER            | Reference to designer |
| booking_date | DATE               | Date of booking       |
| status       | VARCHAR(50)        | Booking status        |
| created_at   | TIMESTAMP          | Booking creation time |

---

## Projects Table

Stores projects completed by designers.

| Column      | Type               | Description           |
| ----------- | ------------------ | --------------------- |
| project_id  | SERIAL PRIMARY KEY | Project identifier    |
| designer_id | INTEGER            | Reference to designer |
| title       | VARCHAR(200)       | Project title         |
| description | TEXT               | Project details       |
| image_url   | TEXT               | Project image         |
| budget      | DECIMAL            | Project budget        |
| created_at  | TIMESTAMP          | Project creation time |

---

# Relationships

Users (1) → (N) Reviews

Designers (1) → (N) Reviews

Users (1) → (N) Bookings

Designers (1) → (N) Bookings

Designers (1) → (N) Projects

---

# Foreign Keys

Reviews.user_id → Users.user_id

Reviews.designer_id → Designers.designer_id

Booking.user_id → Users.user_id

Booking.designer_id → Designers.designer_id

Projects.designer_id → Designers.designer_id

---

# Indexing Strategy

Indexes improve search performance.

```sql
CREATE INDEX idx_reviews_user_id ON Reviews(user_id);

CREATE INDEX idx_reviews_designer_id ON Reviews(designer_id);

CREATE INDEX idx_booking_user_id ON Booking(user_id);

CREATE INDEX idx_booking_designer_id ON Booking(designer_id);
```
