-- Однострочный комментарий
# Еще вариант однострочного комментария
/*
Это многострочный комментарий
Вторая строка многострочного комментария

используем снэйк кэйс
команды пишем капсом
*/

CREATE DATABASE IF NOT EXISTS lesson_1;

USE lesson_1;

DROP TABLE IF EXISTS student;
CREATE TABLE student
(
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(40),
email VARCHAR(100)
);

DESC student;

INSERT student(first_name, email)
VALUES
("Алексей", "alex@hmail.com"),
("Бармалей", "bary@hmail.com"),
("Воробей", "vorob@hmail.com"),
("Скарабей", "score@hmail.com");

SELECT * 
FROM student
WHERE first_name LIKE "%р%"