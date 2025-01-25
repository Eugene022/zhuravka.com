<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "zhuravka";

// Створення підключення
$conn = new mysqli($servername, $username, $password, $dbname);

// Перевірка підключення
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
?>
