CREATE TABLE Users (
 user_id SERIAL PRIMARY KEY,
 name VARCHAR(100),
 email VARCHAR(150),
 password TEXT,
 phone VARCHAR(20),
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Designers (
 designer_id SERIAL PRIMARY KEY,
 name VARCHAR(100),
 email VARCHAR(150),
 phone VARCHAR(20),
 city VARCHAR(100),
 experience INT,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Reviews (
 review_id SERIAL PRIMARY KEY,
 user_id INT REFERENCES Users(user_id),
 designer_id INT REFERENCES Designers(designer_id),
 rating INT,
 comment TEXT,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Booking (
 booking_id SERIAL PRIMARY KEY,
 user_id INT REFERENCES Users(user_id),
 designer_id INT REFERENCES Designers(designer_id),
 booking_date DATE,
 status VARCHAR(50),
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Projects (
 project_id SERIAL PRIMARY KEY,
 designer_id INT REFERENCES Designers(designer_id),
 title VARCHAR(200),
 description TEXT,
 image_url TEXT,
 budget DECIMAL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);