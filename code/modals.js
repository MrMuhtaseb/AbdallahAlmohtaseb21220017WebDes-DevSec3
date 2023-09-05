// modals.js
// Function to open the sign-up modal
function openSignupModal() {
    var modal = document.getElementById("signupModal");
    modal.style.display = "block";
}

// Function to open the sign-in modal
function openSigninModal() {
    var modal = document.getElementById("signinModal");
    modal.style.display = "block";
}

// Function to close the modals
function closeModal() {
    var modals = document.querySelectorAll(".modal");
    modals.forEach(function (modal) {
        modal.style.display = "none";
    });
}

// Event listeners for the buttons
var signupButton = document.getElementById("signupButton");
var signinButton = document.getElementById("signinButton");

signupButton.addEventListener("click", openSignupModal);
signinButton.addEventListener("click", openSigninModal);


// Close the modal when the user clicks outside of it
window.addEventListener("click", function (event) {
    var modals = document.querySelectorAll(".modal");
    modals.forEach(function (modal) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    });
});
