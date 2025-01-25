<?php
include 'db.php';

$table = $_GET['table'];

$sql = "SELECT * FROM " . $table;
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<table>";
    
    if ($table == 'Employees') {
        echo "<thead><tr><th>Працівник</th><th>Посада</th><th>Контактний телефон</th><th>Відділ</th><th>Дія</th></tr></thead>";
    } elseif ($table == 'Fields') {
        echo "<thead><tr><th>Поле</th><th>Розмір</th><th>Локація</th><th>Тип культури</th><th>Дія</th></tr></thead>";
    } elseif ($table == 'Harvest') {
        echo "<thead><tr><th>ID Поля</th><th>Дата збору</th><th>Обсяг</th><th>Якість</th><th>Дія</th></tr></thead>";
    } elseif ($table == 'Plant_Protection_and_Fertilizers') {
        echo "<thead><tr><th>Назва</th><th>Тип</th><th>Дозування</th><th>Дата застосування</th><th>ID Поля</th><th>Дія</th></tr></thead>";
    }

    echo "<tbody>";
    while($row = $result->fetch_assoc()) {
        echo "<tr>";
        if ($table == 'Employees') {
            echo "<td>" . $row["name"] . "</td><td>" . $row["position"] . "</td><td>" . $row["contact_phone"] . "</td><td>" . $row["department"] . "</td>";
        } elseif ($table == 'Fields') {
            echo "<td>" . $row["name"] . "</td><td>" . $row["size"] . "</td><td>" . $row["location"] . "</td><td>" . $row["crop_type"] . "</td>";
        } elseif ($table == 'Harvest') {
            echo "<td>" . $row["field_id"] . "</td><td>" . $row["harvest_date"] . "</td><td>" . $row["quantity"] . "</td><td>" . $row["quality"] . "</td>";
        } elseif ($table == 'Plant_Protection_and_Fertilizers') {
            echo "<td>" . $row["name"] . "</td><td>" . $row["type"] . "</td><td>" . $row["dosage"] . "</td><td>" . $row["application_date"] . "</td><td>" . $row["field_id"] . "</td>";
        }
        echo "<td><button class='deleteButton' onclick='deleteRecord(" . $row["id"] . ", \"" . $table . "\")'>Видалити</button></td>";
        echo "</tr>";
    }
    echo "</tbody>";
    echo "</table>";
} else {
    echo "0 results";
}

$conn->close();
?>
