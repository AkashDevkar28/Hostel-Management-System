USE Hostel;

CREATE TABLE contact_us (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    message TEXT,
    contact_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

select * from contact_us;