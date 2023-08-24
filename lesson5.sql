DROP DATABASE IF EXISTS lesson_5;
CREATE DATABASE lesson_5;
USE lesson_5;

DROP TABLE IF EXISTS zak;
CREATE TABLE zak
(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(30),
rate INT
);

INSERT zak(name, rate)
VALUES
("zak1", 1),
("zak2", 5),
("zak3", 7),
("zak4", 4);

DROP VIEW  IF EXISTS zak_top;
CREATE VIEW zak_top AS
(SELECT * FROM zak WHERE rate = (SELECT MAX(rate) FROM zak));

SELECT * FROM zak_top;
