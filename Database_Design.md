
---

# 4️⃣ Database_Design.md

This describes PostgreSQL database schema


Database: PostgreSQL

---

# Tables Overview

| Table | Description |
|----|----|
| users | Stores user data |
| tasks | Stores tasks |
| comments | Stores task comments |

---

# Users Table

| Column | Type | Description |
|------|------|------|
| id | SERIAL PRIMARY KEY | Unique user ID |
| name | VARCHAR(100) | User name |
| email | VARCHAR(150) | User email |

---

# Tasks Table

| Column | Type | Description |
|------|------|------|
| id | SERIAL PRIMARY KEY |
| title | VARCHAR(255) |
| description | TEXT |
| status | VARCHAR(20) |
| user_id | INTEGER |

Foreign Key
user_id → users(id)


---

# Comments Table

| Column | Type | Description |
|------|------|------|
| id | SERIAL PRIMARY KEY |
| message | TEXT |
| task_id | INTEGER |

Foreign Key
task_id → tasks(id)


---

# Relationships

Users (1) ---- (Many) Tasks

Tasks (1) ---- (Many) Comments


---

# Example SQL

Create Tasks Table

```sql
CREATE TABLE tasks (
 id SERIAL PRIMARY KEY,
 title VARCHAR(255),
 description TEXT,
 status VARCHAR(20),
 user_id INT REFERENCES users(id)
);


