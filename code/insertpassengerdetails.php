<?php
session_start();
require("connect.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get data from the form
    $passport = $_POST['passport'];
    $firstName = $_POST['firstName'];
    $lastName = $_POST['lastName'];
    $age = $_POST['age'];
    $gender = $_POST['gender'];
    $phoneNumber = $_POST['phoneNumber'];
    $email = $_POST['email'];

    try {
        // Start a transaction
        $pdo->beginTransaction();

        // Step 1: Insert data into the "passenger" table
        $insertPassengerSQL = "INSERT INTO passenger (passport_number, first_Name, last_Name, age, gender) 
                               VALUES (:passport, :firstName, :lastName, :age, :gender)";
        $stmt = $pdo->prepare($insertPassengerSQL);
        $stmt->bindParam(':passport', $passport, PDO::PARAM_STR);
        $stmt->bindParam(':firstName', $firstName, PDO::PARAM_STR);
        $stmt->bindParam(':lastName', $lastName, PDO::PARAM_STR);
        $stmt->bindParam(':age', $age, PDO::PARAM_INT);
        $stmt->bindParam(':gender', $gender, PDO::PARAM_STR);
        $stmt->execute();

        // Step 2: Insert data into the "passenger_phone" table
        $insertPhoneSQL = "INSERT INTO passenger_phone (passport_number, phone_number) 
                           VALUES (:passport, :phoneNumber)";
        $stmt = $pdo->prepare($insertPhoneSQL);
        $stmt->bindParam(':passport', $passport, PDO::PARAM_STR);
        $stmt->bindParam(':phoneNumber', $phoneNumber, PDO::PARAM_STR);
        $stmt->execute();

        // Step 3: Insert data into the "passenger_email" table
        $insertEmailSQL = "INSERT INTO passenger_email (passport_number, email) 
                           VALUES (:passport, :email)";
        $stmt = $pdo->prepare($insertEmailSQL);
        $stmt->bindParam(':passport', $passport, PDO::PARAM_STR);
        $stmt->bindParam(':email', $email, PDO::PARAM_STR);
        $stmt->execute();

        // Commit the transaction if all queries were successful
        $pdo->commit();

        // Successful reservation
        $_SESSION['success_message'] = "Congrats! You have made a reservation successfully.";
        header("Location: index.php");
        exit();
    } catch (PDOException $e) {
        // Rollback the transaction on error
        $pdo->rollBack();

        // Handle error if needed
        $_SESSION['error_message'] = "Reservation failed. Please try again.";
        header("Location: passengerdetails.php");
        exit();
    }
}
?>