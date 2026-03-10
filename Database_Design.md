# Database Design (PostgreSQL)

## Overview

This document describes the PostgreSQL database schema for the Task Management System.

The system allows users to create tasks, assign tasks, comment on tasks, and organize tasks using tags.

---

# Entities

Users
Tasks
Task_Comments
Tags
Task_Tags

---

# ERD Diagram

![ERD](../images/erd.png)

# User Table 
| Column        | Type               | Description        |
| ------------- | ------------------ | ------------------ |
| id            | SERIAL PRIMARY KEY | user id            |
| name          | VARCHAR(100)       | user name          |
| email         | VARCHAR(150)       | email              |
| password_hash | TEXT               | encrypted password |
| created_at    | TIMESTAMP          | creation time      |


# Tasks Table 
| Column      | Type               | Description |
| ----------- | ------------------ | ----------- |
| id          | SERIAL PRIMARY KEY |             |
| title       | VARCHAR(200)       |             |
| description | TEXT               |             |
| status      | VARCHAR(50)        |             |
| priority    | VARCHAR(20)        |             |
| created_by  | INTEGER            |             |
| assigned_to | INTEGER            |             |
| due_date    | DATE               |             |
| created_at  | TIMESTAMP          |             |

# Task_Comments
| Column     | Type               |
| ---------- | ------------------ |
| id         | SERIAL PRIMARY KEY |
| task_id    | INTEGER            |
| user_id    | INTEGER            |
| comment    | TEXT               |
| created_at | TIMESTAMP          |

# Tags

| Column | Type               |
| ------ | ------------------ |
| id     | SERIAL PRIMARY KEY |
| name   | VARCHAR(100)       |

# Task_Tags
| Column  | Type    |
| ------- | ------- |
| task_id | INTEGER |
| tag_id  | INTEGER |

# Primaary Key 
(task_id, tag_id)

# Relationship
Users (1) → (N) Tasks
Users (1) → (N) Task_Comments
Tasks (1) → (N) Task_Comments
Tasks (N) ↔ (N) Tags

# Indexing Strategy

CREATE INDEX idx_tasks_created_by ON Tasks(created_by);
CREATE INDEX idx_tasks_assigned_to ON Tasks(assigned_to);
CREATE INDEX idx_comments_task_id ON Task_Comments(task_id);
