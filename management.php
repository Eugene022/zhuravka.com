<!DOCTYPE html>
<html>

<head>
    <title>УПРАВЛІННЯ - ТОВ “ЖУРАВКА”</title>
    <link rel="stylesheet" href="style.css">
    <meta charset="UTF-8">
</head>

<body>
    <div class="content-wrapper">
        <div class="main-content">
            <header>
                <h1>УПРАВЛІННЯ ДІЯЛЬНІСТЮ ТОВ "ЖУРАВКА"</h1>
            </header>
            <nav>
                <a href="index.html">Головна</a> |
                <a href="about.html">Про нас</a> |
                <a href="map.html">Карта</a>
            </nav>
            <section class="management">
                <h2>Управління діяльністю підприємства</h2>
                <div class="tabs">
                    <button class="tab-button" onclick="loadData('Employees')">Працівники</button>
                    <button class="tab-button" onclick="loadData('Fields')">Поля</button>
                    <button class="tab-button" onclick="loadData('Harvest')">Врожай</button>
                    <button class="tab-button" onclick="loadData('Plant_Protection_and_Fertilizers')">Засоби захисту рослин та добрива</button>
                </div>
                <div id="data-container">
                    <!-- Тут будуть відображатися дані -->
                </div>
                <button id="addRecordButton" class="addButton">Додати запис</button>
            </section>
        </div>
        <footer>
            <p>&copy; 2024 ТОВ “ЖУРАВКА”</p>
        </footer>

        <div id="addRecordModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h2 id="modalTitle">Додати запис</h2>
                <form id="addRecordForm">
                    <!-- Поля форми будуть динамічно вставлені тут -->
                </form>
            </div>
        </div>

    </div>
    <script src="script.js"></script>
</body>

</html>
