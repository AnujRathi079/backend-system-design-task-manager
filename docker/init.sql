CREATE TABLE Users (
 id SERIAL PRIMARY KEY,
 name VARCHAR(100),
 email VARCHAR(150),
 password_hash TEXT,
 created_at TIMESTAMP
);