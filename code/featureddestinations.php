<?php
require("connect.php");

$airportCode = $_GET['airport_code']; // Get the destination airport code from URL parameter

$sql = "SELECT * FROM flight_info_view WHERE ARRIVAL_AIRPORT_CODE = :airportCode ORDER BY FARE ASC";
$statement = $pdo->prepare($sql);
$statement->bindParam(':airportCode', $airportCode, PDO::PARAM_STR);
$statement->execute();
$flights = $statement->fetchAll(PDO::FETCH_ASSOC);

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Information</title>
    <link rel="stylesheet" href="featureddes.css">
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
    <h1>Flights to :  <?php echo $airportCode; ?></h1>


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