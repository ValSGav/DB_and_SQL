CREATE DATABASE IF NOT EXISTS lesson_4;

USE lesson_4;

CREATE TABLE IF NOT EXISTS staff
(
id INT PRIMARY KEY AUTO_INCREMENT,
firstname VARCHAR(45),
lastname VARCHAR(45),
post VARCHAR(45),
seniority INT,
salary DECIMAL(8,2),
age INT
);
TRUNCATE staff; -- Очистка таблицы от данных, остаются только имена столбцов
INSERT staff (firstname, lastname, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', 40, 100000, 60),
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

-- *****************************************************************************
-- Оконные функции(не сокращают количество данных)
-- 1. Ранжирование
-- Вывести список всех сотрудников и указать в общем списке место по зарплате

SELECT 
	salary,
    post,
    CONCAT(firstname, " ", lastname) AS fullname,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS `dense_rank`,
    RANK() OVER (ORDER BY salary) AS `rank`
FROM staff;

-- то же самое, но для каждой должностиalter

    SELECT 
	salary,
    post,
    CONCAT(firstname, " ", lastname) AS fullname,
    RANK() OVER (PARTITION BY post ORDER BY salary) AS `rank`
FROM staff;

-- получение самых больших(рэнк 1)

SELECT * 
FROM( SELECT 
	salary,
    post,
    CONCAT(firstname, " ", lastname) AS fullname,
    RANK() OVER (PARTITION BY post ORDER BY salary) AS `rank`
FROM staff) as salary_rank
where salary_rank.`rank` < 3;

-- 2. Агрегация

-- Найти среднюю зп
-- найти суммарную зп
-- найти процентное соотношение зп к суммарной по должности

SELECT
	salary,
    post,
    CONCAT(firstname, " ", lastname) AS fullname,
    AVG(salary) OVER w AS avg_salary,
    SUM(salary) OVER w AS sum_salary,
    ROUND(salary * 100 / SUM(salary) OVER w, 2) as percent_post,
	ROUND(salary * 100 / SUM(salary) OVER w1, 2) as percent_total
FROM staff
WINDOW w AS (PARTITION BY post), w1 AS ();
    