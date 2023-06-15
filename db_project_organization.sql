-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 15 2023 г., 05:33
-- Версия сервера: 10.4.24-MariaDB
-- Версия PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `db_project_organization`
--

-- --------------------------------------------------------

--
-- Структура таблицы `attributes`
--

CREATE TABLE `attributes` (
  `id_attribute` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `attributes`
--

INSERT INTO `attributes` (`id_attribute`, `name`) VALUES
(1, 'Обслуживаемое оборудование'),
(2, 'Авторские свидетельства');

-- --------------------------------------------------------

--
-- Структура таблицы `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id_index` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `attribute_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id_category` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id_category`, `name`) VALUES
(1, 'Конструктор'),
(2, 'Инженер'),
(3, 'Техник'),
(4, 'Лаборант');

-- --------------------------------------------------------

--
-- Структура таблицы `contracts`
--

CREATE TABLE `contracts` (
  `id_contract` int(11) NOT NULL,
  `conclusion_date` date NOT NULL DEFAULT curdate(),
  `deadline` date NOT NULL DEFAULT curdate(),
  `contract_cost` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `contracts`
--

INSERT INTO `contracts` (`id_contract`, `conclusion_date`, `deadline`, `contract_cost`) VALUES
(3, '0000-00-00', '0000-00-00', '0.00');

-- --------------------------------------------------------

--
-- Структура таблицы `contract_customer`
--

CREATE TABLE `contract_customer` (
  `contract_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `contract_head`
--

CREATE TABLE `contract_head` (
  `contract_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `contract_project`
--

CREATE TABLE `contract_project` (
  `id_index` int(11) NOT NULL,
  `contract_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `customers`
--

CREATE TABLE `customers` (
  `id_customer` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(18) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `customers`
--

INSERT INTO `customers` (`id_customer`, `name`, `phone`) VALUES
(1, '111', '099-99-99'),
(2, '222', '099-99-98'),
(3, '333', '000-00-00');

-- --------------------------------------------------------

--
-- Структура таблицы `departments`
--

CREATE TABLE `departments` (
  `id_department` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `departments`
--

INSERT INTO `departments` (`id_department`, `name`) VALUES
(1, 'Первый'),
(2, 'Второй'),
(3, 'Третий'),
(4, 'Четвертый');

-- --------------------------------------------------------

--
-- Структура таблицы `department_head`
--

CREATE TABLE `department_head` (
  `employee_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `department_head`
--

INSERT INTO `department_head` (`employee_id`, `department_id`) VALUES
(5, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `employees`
--

CREATE TABLE `employees` (
  `id_employee` int(11) NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `middle_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `date_of_birth` date NOT NULL DEFAULT '1970-01-01',
  `phone` varchar(9) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `employees`
--

INSERT INTO `employees` (`id_employee`, `last_name`, `first_name`, `middle_name`, `date_of_birth`, `phone`) VALUES
(1, 'Иванов', 'Иван', 'Иванович', '1988-03-22', '100-00-01'),
(2, 'Петров', 'Петр', 'Петрович', '1987-04-16', '100-00-02'),
(3, 'Сергеев', 'Сергей', 'Сергеевич', '1989-01-20', '100-00-03'),
(4, 'Максимов', 'Максим', 'Максимович', '1965-01-26', '100-00-04'),
(5, 'Павлов', 'Павел', 'Павлович', '1977-02-11', '100-00-05'),
(6, 'Романов', 'Роман', 'Романович', '1971-07-04', '100-00-06');

-- --------------------------------------------------------

--
-- Структура таблицы `employee_category`
--

CREATE TABLE `employee_category` (
  `employee_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `employee_category`
--

INSERT INTO `employee_category` (`employee_id`, `category_id`) VALUES
(4, 1),
(1, 2),
(3, 3),
(2, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `employee_department`
--

CREATE TABLE `employee_department` (
  `employee_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `employee_work`
--

CREATE TABLE `employee_work` (
  `id_index` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `work_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `projects`
--

CREATE TABLE `projects` (
  `id_project` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `begin_date` date NOT NULL DEFAULT curdate(),
  `end_date` date NOT NULL DEFAULT curdate(),
  `project_cost` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `project_head`
--

CREATE TABLE `project_head` (
  `project_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `works`
--

CREATE TABLE `works` (
  `id_work` int(11) NOT NULL,
  `begin_date` date DEFAULT curdate(),
  `end_date` date DEFAULT curdate(),
  `work_cost` decimal(10,2) DEFAULT NULL,
  `work_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `work_project`
--

CREATE TABLE `work_project` (
  `work_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `work_types`
--

CREATE TABLE `work_types` (
  `id_type` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id_attribute`);

--
-- Индексы таблицы `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id_index`),
  ADD KEY `attribute_id` (`attribute_id`),
  ADD KEY `attribute_values_ibfk_1` (`employee_id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`);

--
-- Индексы таблицы `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id_contract`);

--
-- Индексы таблицы `contract_customer`
--
ALTER TABLE `contract_customer`
  ADD PRIMARY KEY (`contract_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Индексы таблицы `contract_head`
--
ALTER TABLE `contract_head`
  ADD PRIMARY KEY (`contract_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Индексы таблицы `contract_project`
--
ALTER TABLE `contract_project`
  ADD PRIMARY KEY (`id_index`),
  ADD KEY `contract_id` (`contract_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Индексы таблицы `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id_customer`);

--
-- Индексы таблицы `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id_department`);

--
-- Индексы таблицы `department_head`
--
ALTER TABLE `department_head`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Индексы таблицы `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id_employee`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Индексы таблицы `employee_category`
--
ALTER TABLE `employee_category`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `employee_department`
--
ALTER TABLE `employee_department`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Индексы таблицы `employee_work`
--
ALTER TABLE `employee_work`
  ADD PRIMARY KEY (`id_index`),
  ADD KEY `work_id` (`work_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Индексы таблицы `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id_project`);

--
-- Индексы таблицы `project_head`
--
ALTER TABLE `project_head`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Индексы таблицы `works`
--
ALTER TABLE `works`
  ADD PRIMARY KEY (`id_work`),
  ADD KEY `work_type_id` (`work_type_id`);

--
-- Индексы таблицы `work_project`
--
ALTER TABLE `work_project`
  ADD PRIMARY KEY (`work_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Индексы таблицы `work_types`
--
ALTER TABLE `work_types`
  ADD PRIMARY KEY (`id_type`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id_attribute` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id_index` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id_contract` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `contract_project`
--
ALTER TABLE `contract_project`
  MODIFY `id_index` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `customers`
--
ALTER TABLE `customers`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `departments`
--
ALTER TABLE `departments`
  MODIFY `id_department` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `employees`
--
ALTER TABLE `employees`
  MODIFY `id_employee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `employee_work`
--
ALTER TABLE `employee_work`
  MODIFY `id_index` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `projects`
--
ALTER TABLE `projects`
  MODIFY `id_project` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `works`
--
ALTER TABLE `works`
  MODIFY `id_work` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `work_types`
--
ALTER TABLE `work_types`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `attribute_values_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id_employee`),
  ADD CONSTRAINT `attribute_values_ibfk_2` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id_attribute`);

--
-- Ограничения внешнего ключа таблицы `contract_customer`
--
ALTER TABLE `contract_customer`
  ADD CONSTRAINT `contract_customer_ibfk_1` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id_contract`),
  ADD CONSTRAINT `contract_customer_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id_customer`);

--
-- Ограничения внешнего ключа таблицы `contract_head`
--
ALTER TABLE `contract_head`
  ADD CONSTRAINT `contract_head_ibfk_1` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id_contract`),
  ADD CONSTRAINT `contract_head_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id_employee`);

--
-- Ограничения внешнего ключа таблицы `contract_project`
--
ALTER TABLE `contract_project`
  ADD CONSTRAINT `contract_project_ibfk_1` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id_contract`),
  ADD CONSTRAINT `contract_project_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id_project`);

--
-- Ограничения внешнего ключа таблицы `department_head`
--
ALTER TABLE `department_head`
  ADD CONSTRAINT `department_head_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id_employee`),
  ADD CONSTRAINT `department_head_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id_department`);

--
-- Ограничения внешнего ключа таблицы `employee_category`
--
ALTER TABLE `employee_category`
  ADD CONSTRAINT `employee_category_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id_employee`),
  ADD CONSTRAINT `employee_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_category`);

--
-- Ограничения внешнего ключа таблицы `employee_department`
--
ALTER TABLE `employee_department`
  ADD CONSTRAINT `employee_department_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id_employee`),
  ADD CONSTRAINT `employee_department_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id_department`);

--
-- Ограничения внешнего ключа таблицы `employee_work`
--
ALTER TABLE `employee_work`
  ADD CONSTRAINT `employee_work_ibfk_1` FOREIGN KEY (`work_id`) REFERENCES `works` (`id_work`),
  ADD CONSTRAINT `employee_work_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id_employee`);

--
-- Ограничения внешнего ключа таблицы `project_head`
--
ALTER TABLE `project_head`
  ADD CONSTRAINT `project_head_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id_project`),
  ADD CONSTRAINT `project_head_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id_employee`);

--
-- Ограничения внешнего ключа таблицы `works`
--
ALTER TABLE `works`
  ADD CONSTRAINT `works_ibfk_1` FOREIGN KEY (`work_type_id`) REFERENCES `work_types` (`id_type`);

--
-- Ограничения внешнего ключа таблицы `work_project`
--
ALTER TABLE `work_project`
  ADD CONSTRAINT `work_project_ibfk_1` FOREIGN KEY (`work_id`) REFERENCES `works` (`id_work`),
  ADD CONSTRAINT `work_project_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id_project`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
