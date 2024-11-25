document.addEventListener("DOMContentLoaded", function () {
    const ctaButton = document.querySelector('.cta-button');

    ctaButton.addEventListener('click', function () {
        alert('Welcome to the Hostel Management System!');
    });
});

// rooms.html
document.addEventListener("DOMContentLoaded", function () {
    const bookButtons = document.querySelectorAll('.book-btn');

    bookButtons.forEach(button => {
        button.addEventListener('click', function () {
            alert('Room booked successfully!');
        });
    });
});


// facilities.html
document.addEventListener("DOMContentLoaded", function () {
  
});


// about.html
document.addEventListener("DOMContentLoaded", function () {
   
});



// contact.html

document.addEventListener("DOMContentLoaded", function () {
    const contactForm = document.getElementById('contactForm');

    contactForm.addEventListener('submit', function (event) {
        event.preventDefault();

        alert('Your message has been sent successfully!');
     
        contactForm.reset();
    });
});

