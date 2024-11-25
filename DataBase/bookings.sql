CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY, 
    room_id INT NOT NULL,                       
    full_name VARCHAR(100) NOT NULL,           
    email VARCHAR(100) NOT NULL,              
    phone VARCHAR(15) NOT NULL,                
    college_name VARCHAR(150) NOT NULL,         
    stay_duration INT NOT NULL,                 
    preferences TEXT,                           
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)  
);

select * from bookings;