CREATE TABLE users (
 id SERIAL PRIMARY KEY,
 name VARCHAR(100),
 email VARCHAR(150)
);

CREATE TABLE tasks (
 id SERIAL PRIMARY KEY,
 title VARCHAR(255),
 description TEXT,
 status VARCHAR(20),
 user_id INT REFERENCES users(id)
);

CREATE TABLE comments (
 id SERIAL PRIMARY KEY,
 message TEXT,
 task_id INT REFERENCES tasks(id)
);

# When the container runs:

PostgreSQL starts

Database taskmanager is created

User admin is created

init.sql runs automatically

Tables are created

# How its Works

Docker Build
     ↓
Postgres Image Downloaded
     ↓
Container Starts
     ↓
Database taskmanager Created
     ↓
User admin Created
     ↓
init.sql Executed
     ↓
Tables Created

# Example 

docker build -t taskmanager-db .
docker run -d -p 5432:5432 taskmanager-db


| Command           | Meaning                      |
| ----------------- | ---------------------------- |
| docker build      | builds image from Dockerfile |
| -t taskmanager-db | image name                   |
| docker run        | starts container             |
| -p 5432:5432      | expose postgres port         |
