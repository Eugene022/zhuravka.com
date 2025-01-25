function loadData(tableName) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("data-container").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "load-data.php?table=" + tableName, true);
    xhttp.send();

    // Відображення кнопки додавання для відповідної таблиці
    var addButton = document.getElementById("addRecordButton");
    addButton.style.display = "block";
    addButton.setAttribute("onclick", "showAddModal('" + tableName + "')");
    addButton.textContent = "Додати";
}

// Початкове приховування кнопки додавання
document.getElementById("addRecordButton").style.display = "none";

function showAddModal(table) {
    var form = document.getElementById("addRecordForm");
    form.innerHTML = ""; // Очищення форми
    document.getElementById("modalTitle").textContent = "Додавання даних";

    // Додавання полів в залежності від таблиці
    if (table === "Employees") {
        form.innerHTML += '<label for="name">Ім\'я:</label><input type="text" id="name" name="name" required><br>';
        form.innerHTML += '<label for="position">Посада:</label><input type="text" id="position" name="position" required><br>';
        form.innerHTML += '<label for="contact_phone">Телефон:</label><input type="text" id="contact_phone" name="contact_phone" required><br>';
        form.innerHTML += '<label for="department">Відділ:</label><input type="text" id="department" name="department" required><br>';
    } else if (table === "Fields") {
        form.innerHTML += '<label for="name">Назва поля:</label><input type="text" id="name" name="name" required><br>';
        form.innerHTML += '<label for="size">Розмір (га):</label><input type="number" id="size" name="size" required><br>';
        form.innerHTML += '<label for="location">Місцезнаходження:</label><input type="text" id="location" name="location" required><br>';
        form.innerHTML += '<label for="crop_type">Тип культури:</label><input type="text" id="crop_type" name="crop_type" required><br>';
    } else if (table === "Harvest") {
        form.innerHTML += '<label for="field_id">ID поля:</label><input type="number" id="field_id" name="field_id" required><br>';
        form.innerHTML += '<label for="harvest_date">Дата збору:</label><input type="date" id="harvest_date" name="harvest_date" required><br>';
        form.innerHTML += '<label for="quantity">Обсяг (кг):</label><input type="number" id="quantity" name="quantity" required><br>';
        form.innerHTML += '<label for="quality">Якість:</label><input type="text" id="quality" name="quality" required><br>';
    } else if (table === "Plant_Protection_and_Fertilizers") {
        form.innerHTML += '<label for="name">Назва:</label><input type="text" id="name" name="name" required><br>';
        form.innerHTML += '<label for="type">Тип:</label><input type="text" id="type" name="type" required><br>';
        form.innerHTML += '<label for="dosage">Дозування:</label><input type="text" id="dosage" name="dosage" required><br>';
        form.innerHTML += '<label for="application_date">Дата застосування:</label><input type="date" id="application_date" name="application_date" required><br>';
        form.innerHTML += '<label for="field_id">ID поля:</label><input type="number" id="field_id" name="field_id" required><br>';
    }

    form.innerHTML += '<button type="submit">Додати</button>';

    // Відкриття модального вікна
    document.getElementById("addRecordModal").style.display = "block";

    // Обробка події відправки форми
    form.onsubmit = function(event) {
        event.preventDefault();
        addRecord(table, new FormData(this));
    }
}

// Закривання модального вікна
document.querySelector('.close').addEventListener('click', function() {
    document.getElementById('addRecordModal').style.display = 'none';
});

function addRecord(table, formData) {
    formData.append("table", table); // Додавання назви таблиці до даних форми

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("addRecordModal").style.display = "none"; // Закриття модального вікна
            loadData(table); // Оновлення таблиці
        }
    };
    xhttp.open("POST", "add-record.php", true);
    xhttp.send(formData);
}

function deleteRecord(id, table) {
    var confirmation = confirm("Ви впевнені, що хочете видалити цей запис?");
    if (confirmation) {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                loadData(table); // Оновлення таблиці
            }
        };
        xhttp.open("GET", "delete-record.php?id=" + id + "&table=" + table, true);
        xhttp.send();
    }
}
