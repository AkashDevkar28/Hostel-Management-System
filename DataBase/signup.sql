-- Create the database (if it doesn’t already exist)
CREATE DATABASE IF NOT EXISTS Hostel;

-- Use the created database
USE Hostel;

-- Create the 'users' table to store user information
CREATE TABLE IF NOT EXISTS signup (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique ID for each user
    username VARCHAR(50) NOT NULL,      -- Username chosen by the user
    email VARCHAR(100) NOT NULL UNIQUE, -- User's email, set as unique
    password VARCHAR(255) NOT NULL,     -- Password (hashed for security in real applications)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp for when the user was created
);

select * from signup;
