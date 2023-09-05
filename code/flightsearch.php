<?php
require("connect.php");
try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbName", $user, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Error: " . $e->getMessage());
}

// Get user's selections from the form
$fromAirport = $_GET['from'];
$toAirport = $_GET['to'];
$departureDate = $_GET['departure'];
$returnDate = $_GET['return'];
$travelClass = $_GET['class'];
$passengers = $_GET['passengers'];


// Query the database to retrieve flight data
$sql = "SELECT * FROM flight WHERE DEPARTURE_AIRPORT_CODE = :fromAirport AND ARRIVAL_AIRPORT_CODE = :toAirport";
$stmt = $pdo->prepare($sql);
$stmt->bindParam(':fromAirport', $fromAirport, PDO::PARAM_STR);
$stmt->bindParam(':toAirport', $toAirport, PDO::PARAM_STR);
$stmt->execute();
$flights = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Display the flight search results
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AirLusso| Flight Search Results</title>
    <link rel="stylesheet" href="flightsearch.css">
    <link rel="icon" type="image/png" href="Images/logo.png">

</head>

<body>
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
    <div class="info-container">
        <h1>Flight Search Results:</h1>
        <h2>From:
            <?php echo $fromAirport; ?> To:
            <?php echo $toAirport; ?>
        </h2>
        <h3>Departure Date:
            <?php echo $departureDate; ?> Return Date:
            <?php echo $returnDate; ?>
        </h3>
        <h3>Travel Class:
            <?php echo $travelClass; ?> Passengers:
            <?php echo $passengers; ?>
        </h3>
    </div>
    <table>
        <tr>
            <th>Departure Airport</th>
            <th>Departure Time</th>
            <th>Arrival Airport</th>
            <th>Arrival Time</th>
            <th>Price</th>
            <th>Action</th>
        </tr>
        <?php
        foreach ($flights as $row) {
            echo "<tr>";
            echo "<td>" . $row['DEPARTURE_AIRPORT_CODE'] . "</td>";
            echo "<td>" . $row['DEPARTURE_TIME'] . "</td>";
            echo "<td>" . $row['ARRIVAL_AIRPORT_CODE'] . "</td>";
            echo "<td>" . $row['ARRIVAL_TIME'] . "</td>";
            echo "<td>" . $row['FARE'] . "</td>";
            echo "<td><a href='passengerdetails.php?flight_id=" . $row['FLIGHT_ID'] . "'>Select</a></td>";
            echo "</tr>";
        }
        ?>
    </table>
</body>

</html>