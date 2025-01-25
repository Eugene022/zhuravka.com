<?php
include 'db.php';

$table = $_POST['table'];

if ($table === "Employees") {
    $name = $_POST['name'];
    $position = $_POST['position'];
    $contact_phone = $_POST['contact_phone'];
    $department = $_POST['department'];

    $sql = "INSERT INTO Employees (name, position, contact_phone, department) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssss", $name, $position, $contact_phone, $department);
} elseif ($table === "Fields") {
    $name = $_POST['name'];
    $size = $_POST['size'];
    $location = $_POST['location'];
    $crop_type = $_POST['crop_type'];

    $sql = "INSERT INTO Fields (name, size, location, crop_type) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sdss", $name, $size, $location, $crop_type);
} elseif ($table === "Harvest") {
    $field_id = $_POST['field_id'];
    $harvest_date = $_POST['harvest_date'];
    $quantity = $_POST['quantity'];
    $quality = $_POST['quality'];

    $sql = "INSERT INTO Harvest (field_id, harvest_date, quantity, quality) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("isds", $field_id, $harvest_date, $quantity, $quality);
} elseif ($table === "Plant_Protection_and_Fertilizers") {
    $name = $_POST['name'];
    $type = $_POST['type'];
    $dosage = $_POST['dosage'];
    $application_date = $_POST['application_date'];
    $field_id = $_POST['field_id'];

    $sql = "INSERT INTO Plant_Protection_and_Fertilizers (name, type, dosage, application_date, field_id) VALUES (?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssdi", $name, $type, $dosage, $application_date, $field_id);
}

if ($stmt->execute()) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$stmt->close();
$conn->close();
?>
