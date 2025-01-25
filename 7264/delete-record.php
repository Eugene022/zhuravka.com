<?php
include 'db.php';

$id = $_GET['id'];
$table = $_GET['table'];

$sql = "DELETE FROM " . $table . " WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id);

if ($stmt->execute()) {
    echo "Record deleted successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$stmt->close();
$conn->close();
?>
