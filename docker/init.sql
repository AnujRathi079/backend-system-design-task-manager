-- Users Table
CREATE TABLE users (
id SERIAL PRIMARY KEY,
name VARCHAR(100),
email VARCHAR(100) UNIQUE,
password_hash TEXT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tasks Table
CREATE TABLE tasks (
id SERIAL PRIMARY KEY,
title VARCHAR(255),
description TEXT,
status VARCHAR(50),
priority VARCHAR(50),
created_by INT,
assigned_to INT,
due_date DATE,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (created_by) REFERENCES users(id),
FOREIGN KEY (assigned_to) REFERENCES users(id)
);

-- Task Comments
CREATE TABLE task_comments (
id SERIAL PRIMARY KEY,
task_id INT REFERENCES tasks(id),
user_id INT REFERENCES users(id),
comment TEXT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tags
CREATE TABLE tags (
id SERIAL PRIMARY KEY,
name VARCHAR(50)
);

-- Task Tags
CREATE TABLE task_tags (
task_id INT REFERENCES tasks(id),
tag_id INT REFERENCES tags(id),
PRIMARY KEY (task_id, tag_id)
);

-- Seed Data
INSERT INTO users (name,email,password_hash)
VALUES
('Anuj','anuj@gmail.com','hashed123'),
('Rahul','rahul@gmail.com','hashed456');

INSERT INTO tags (name)
VALUES
('bug'),
('feature'),
('urgent');