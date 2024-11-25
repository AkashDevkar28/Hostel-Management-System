// Initial room availability data
const roomAvailability = {
    singleBed: {
        type: "Single Bed Room",
        available: 5,
        price: 3000
    },
    twoSharing: {
        type: "Two Sharing Room",
        available: 3,
        price: 2000
    },
    dormRoom: {
        type: "Dorm Room",
        available: 10,
        price: 1000
    }
};

// Function to display room availability on the page
function displayRoomAvailability() {
    document.getElementById("single-bed-availability").textContent = roomAvailability.singleBed.available;
    document.getElementById("two-sharing-availability").textContent = roomAvailability.twoSharing.available;
    document.getElementById("dorm-availability").textContent = roomAvailability.dormRoom.available;
}

// Function to handle room booking
function bookRoom(roomType) {
    const room = roomAvailability[roomType];
    
    // Check if the room is available
    if (room.available > 0) {
        room.available -= 1; // Reduce availability by 1
        alert(`Booking successful for ${room.type}!`);
    } else {
        alert(`Sorry, ${room.type} is fully booked.`);
    }

    // Update the availability display
    displayRoomAvailability();
}

// Initial call to display availability when the page loads
displayRoomAvailability();
