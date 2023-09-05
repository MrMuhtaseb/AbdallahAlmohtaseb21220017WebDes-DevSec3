<?php
// Start the session at the very beginning to fix the warning
if (empty(session_id()) && !headers_sent()) {
  session_start();
}
require("connect.php");

if (isset($_POST['login'])) {
  $sql = "SELECT * FROM login WHERE username=:username AND password=:password";
  $statement = $pdo->prepare($sql);
  $username = $_POST['username'];
  $password = $_POST['password'];

  $statement->bindParam(":username", $username, PDO::PARAM_STR);
  $statement->bindParam(":password", $password, PDO::PARAM_STR);
  $statement->execute();
  $count = $statement->rowCount();
  if ($count == 1) {
    $_SESSION['username'] = $username;
    header("location:afterlogin.php");
    exit(); // Add this line to prevent further code execution after redirection
  } else {
    echo "Invalid username or password";
  }
  $pdo = null;
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <link rel="stylesheet" href="style.css">
</head>

<body>
  <form method="POST">
    <div class="login-container">
      <h2>Login Here</h2>
      <label for="username"><b>Username</b></label>
      <input type="text" placeholder="Enter Username" name="username" required>
      <label for="password"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="password" required>
      <a  id="login-btn" href = "afterlogin.php">Login</a> <!-- Changed this to a button -->

      <a class="reg-link" href="signup.php">SignUp Here</a>
    </div>
  </form>
</body>

</html>