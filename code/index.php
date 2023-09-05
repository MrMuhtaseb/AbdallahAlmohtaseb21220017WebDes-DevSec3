<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AirLusso | Where Luxury Meets Convenience</title>
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" href="modals.css"> <!-- Link to the CSS file for modals -->
    <link rel="icon" type="image/png" href="Images/logo.png">
</head>

<body>
    <header>
        <nav class="navbar">
            <div class="logo">
                <img src="Images/logo.png" alt="Logo">
            </div>
            <ul class="menu">
                <li><a href="index.php">Home</a></li>
                <li><a href="luggage.html">luggage</a></li>
                <li><a href="offices.html">Offices</a></li>
                <li><a href="www.booking.com">Hotels</a></li>
            </ul>
            <div class="auth">
                <button class="auth-button" id="signupButton">Sign Up</button>
                <button class="auth-button" id="signinButton">Sign In</button>
            </div>

        </nav>
        <img src="Images/header.jpg" alt="Header Image" class="header-image">
    </header>

    <main class="main-content">

        <aside class="aside aside1">
            <h2 style="color: red; text-align: center;">About AirLusso</h2>
            <p>"Welcome to Airlusso, where your journey is our passion. We go beyond being just an airline; we are your
                gateway to unforgettable travel experiences. With Airlusso, you're not just a passenger; you're a
                cherished guest. From our modern terminals to your destination, expect world-class service, comfort, and
                safety. Choose Airlusso for redefined air travel, boasting cutting-edge technology for efficient flights
                and a warm, attentive crew. Whether you prefer First Class, Business Class, or Economy Class, we cater
                to your needs. Our commitment to sustainability lets you fly guilt-free. Join Airlusso for your next
                adventure and experience travel reimagined."</p>
        </aside>

        <form method="GET" action="flightsearch.php">
            <div class="booking-form">
                <form>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="from">From:</label>
                            <select id="from" name="from" required>
                                <option value="AMM">Amman, AMM</option>
                                <option value="RUH">Riyadh, RUH</option>
                                <option value="JED">Jeddah, JED</option>
                                <option value="CAI">Cairo, CAI</option>
                                <option value="CMN">Casablanca, CMN</option>
                                <option value="DOH">Doha, DOH</option>
                                <option value="DXB">DUBAI, DXB</option>
                                <option value="ATH">Athens, ATH</option>
                                <option value="FCO">Rome, FCO</option>
                                <option value="LHR">London, LHR</option>
                                <option value="MAD">Madrid, MAD</option>
                                <option value="VIE">Vienna, VIE</option>
                                <option value="BRU">Brussels, BRU</option>
                                <option value="CDG">Paris, CDG</option>
                                <option value="JFK">New York, JFK</option>
                                <option value="LAX">Los Angeles, LAX</option>
                                <option value="BOS">Boston, BOS</option>
                                <option value="IAH">Houston, IAH</option>
                                <option value="YVR">Vancouver, YVR</option>
                                <option value="YYZ">Toronto, YYZ</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="to">To:</label>
                            <select id="to" name="to" required>
                                <option value="AMM">Amman, AMM</option>
                                <option value="RUH">Riyadh, RUH</option>
                                <option value="JED">Jeddah, JED</option>
                                <option value="CAI">Cairo, CAI</option>
                                <option value="CMN">Casablanca, CMN</option>
                                <option value="DOH">Doha, DOH</option>
                                <option value="DXB">DUBAI, DXB</option>
                                <option value="ATH">Athens, ATH</option>
                                <option value="FCO">Rome, FCO</option>
                                <option value="LHR">London, LHR</option>
                                <option value="MAD">Madrid, MAD</option>
                                <option value="VIE">Vienna, VIE</option>
                                <option value="BRU">Brussels, BRU</option>
                                <option value="CDG">Paris, CDG</option>
                                <option value="JFK">New York, JFK</option>
                                <option value="LAX">Los Angeles, LAX</option>
                                <option value="BOS">Boston, BOS</option>
                                <option value="IAH">Houston, IAH</option>
                                <option value="YVR">Vancouver, YVR</option>
                                <option value="YYZ">Toronto, YYZ</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="departure">Departure Date:</label>
                            <input type="date" id="departure" name="departure" required>
                        </div>
                        <div class="form-group">
                            <label for="return">Return Date:</label>
                            <input type="date" id="return" name="return">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="class">Class:</label>
                            <select id="class" name="class">
                                <option value="economy">Economy</option>
                                <option value="business">Business</option>
                                <option value="first">First Class</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="passengers">Number of Passengers:</label>
                            <input type="number" id="passengers" name="passengers" min="1" required>
                        </div>
                    </div>
                    <button type="submit">Search Flights</button>
                </form>
            </div>


            <aside class="aside aside1">
                <h2>Quick Links</h2>
                <ul>
                    <li><a href="#" style="color: red; font-size: 20px; text-decoration: none;">Flight Status</a></li>
                    <li><a href="#" style="color: red; font-size: 20px; text-decoration: none;">Check-In</a></li>
                    <li><a href="#" style="color: red; font-size: 20px; text-decoration: none;">Baggage Information</a>
                    </li>
                    <li><a href="#" style="color: red; font-size: 20px; text-decoration: none;">Travel Tips</a></li>
                </ul>
            </aside>
    </main>
    <h2 class="centered-text">Explore The World With Our Most Visited Destinations!</h2>
    <section class="featured-destinations">
        <div class="destination" onclick="window.location.href='featureddestinations.php?airport_code=AMM'">
            <img src="Images/amman.jpg" alt="AMMAN">
            <h2 class="destination-title">Amman, Jordan</h2>

        </div>
        <div class="destination" onclick="window.location.href='featureddestinations.php?airport_code=DXB'">
            <img src="Images/dubai.jpg" alt="DUBAI">
            <h2 class="destination-title">Dubai, UAE</h2>

        </div>
        <div class="destination" onclick="window.location.href='featureddestinations.php?airport_code=FCO'">
            <img src="Images/rome.jpg" alt="ROME">
            <h2 class="destination-title">Rome, Italy</h2>

        </div>
        <div class="destination" onclick="window.location.href='featureddestinations.php?airport_code=ATH'">
            <img src="Images/athens.jpg" alt="ATHENS">
            <h2 class="destination-title">Athens, Greece</h2>

        </div>
        <div class="destination" onclick="window.location.href='featureddestinations.php?airport_code=LAX'">
            <img src="Images/LA.jpg" alt="LOS ANGELES">
            <h2 class="destination-title">Los Angeles, US</h2>

        </div>
        <div class="destination" onclick="window.location.href='featureddestinations.php?airport_code=MAD'">
            <img src="Images/madrid.jpg" alt="MADRID">
            <h2 class="destination-title">Madrid, Spain</h2>

        </div>
    </section>

    <footer class="footer">
        Copy rights are reserved &copy;
    </footer>

    <?php
    if (isset($_SESSION['success_message'])) {
        echo '<p>' . $_SESSION['success_message'] . '</p>';
        unset($_SESSION['success_message']); // Clear the message
    }
    ?>

    <!-- Sign Up Modal -->
    <div id="signupModal" class="modal">
        <div class="modal-content">
            <span class="modal-close" onclick="closeModal()">&times;</span>
            <?php include 'signup.php'; ?>
        </div>
    </div>

    <!-- Sign In Modal -->
    <div id="signinModal" class="modal">
        <div class="modal-content">
            <span class="modal-close" onclick="closeModal()">&times;</span>
            <?php include 'login.php'; ?>
        </div>
    </div>

    <script src="modals.js"></script> <!-- Link to the JavaScript file for modals -->
</body>

</html>