-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Час створення: Бер 30 2024 р., 10:10
-- Версія сервера: 10.4.32-MariaDB
-- Версія PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `zhuravka`
--

-- --------------------------------------------------------

--
-- Структура таблиці `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `contact_phone` varchar(20) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `employees`
--

INSERT INTO `employees` (`id`, `name`, `position`, `contact_phone`, `department`) VALUES
(1, 'Віктор Свинар', 'Директор', '+380123456789', 'Адміністрація'),
(2, 'Олена Іваненко', 'Головний бухгалтер', '+380987654321', 'Бухгалтерія');

-- --------------------------------------------------------

--
-- Структура таблиці `fields`
--

CREATE TABLE `fields` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `size` decimal(10,2) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `crop_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `fields`
--

INSERT INTO `fields` (`id`, `name`, `size`, `location`, `crop_type`) VALUES
(1, 'Поле 1', 50.50, 'Журавка', 'Пшениця'),
(2, 'Поле 2', 30.20, 'Журавка', 'Кукурудза'),
(3, 'Поле 3', 45.00, 'Журавка', 'Соняшник');

-- --------------------------------------------------------

--
-- Структура таблиці `harvest`
--

CREATE TABLE `harvest` (
  `id` int(11) NOT NULL,
  `field_id` int(11) DEFAULT NULL,
  `harvest_date` date DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `quality` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `harvest`
--

INSERT INTO `harvest` (`id`, `field_id`, `harvest_date`, `quantity`, `quality`) VALUES
(1, 1, '2024-08-15', 5000.00, 'Висока'),
(2, 2, '2024-09-10', 3000.00, 'Середня'),
(3, 3, '2024-08-20', 4500.00, 'Висока');

-- --------------------------------------------------------

--
-- Структура таблиці `plant_protection_and_fertilizers`
--

CREATE TABLE `plant_protection_and_fertilizers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `dosage` varchar(50) DEFAULT NULL,
  `application_date` date DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `plant_protection_and_fertilizers`
--

INSERT INTO `plant_protection_and_fertilizers` (`id`, `name`, `type`, `dosage`, `application_date`, `field_id`) VALUES
(1, 'Гербіцид А', 'Гербіцид', '1 л/га', '2024-04-15', 1),
(2, 'Добриво Б', 'Мінеральне добриво', '200 кг/га', '2024-04-20', 2),
(3, 'Інсектицид В', 'Інсектицид', '0.5 л/га', '2024-05-05', 3);

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `harvest`
--
ALTER TABLE `harvest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_id` (`field_id`);

--
-- Індекси таблиці `plant_protection_and_fertilizers`
--
ALTER TABLE `plant_protection_and_fertilizers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_id` (`field_id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `harvest`
--
ALTER TABLE `harvest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `plant_protection_and_fertilizers`
--
ALTER TABLE `plant_protection_and_fertilizers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `harvest`
--
ALTER TABLE `harvest`
  ADD CONSTRAINT `harvest_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `plant_protection_and_fertilizers`
--
ALTER TABLE `plant_protection_and_fertilizers`
  ADD CONSTRAINT `plant_protection_and_fertilizers_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
