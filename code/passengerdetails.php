<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AirLusso| Passenger Details</title>
    <link rel="stylesheet" href="passengerdetails.css">
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
        </nav>
    </header>
    <h2>Enter Passenger Details</h2>
    <form action="insertpassengerdetails.php" method="POST">
        <label for="passport">Passport Number:</label>
        <input type="text" id="passport" name="passport" required><br>

        <label for="firstName">First Name:</label>
        <input type="text" id="firstName" name="firstName" required><br>

        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" name="lastName" required><br>

        <label for="age">Age:</label>
        <input type="number" id="age" name="age" required><br>

        <label for="gender">Gender:</label>
        <select id="gender" name="gender">
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
        </select><br>

        <label for="phoneNumber">Phone Number:</label>
        <input type="text" id="phoneNumber" name="phoneNumber"><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email"><br>

        <input type="submit" value="Submit">
    </form>
</body>

</html>