CREATE TABLE rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,  
    room_type VARCHAR(50) NOT NULL,        
    total_rooms INT NOT NULL,               
    available_rooms INT NOT NULL,           
    price_per_month DECIMAL(10, 2) NOT NULL 
);
select * from rooms;