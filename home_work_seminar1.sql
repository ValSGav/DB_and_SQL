/*
1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными
*/

CREATE DATABASE home_work_seminar1;
USE home_work_seminar1;
DROP TABLE IF EXISTS mobile_phone;
CREATE TABLE mobile_phone
(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
product_name VARCHAR(10),
manufacturer VARCHAR(15),
product_count INT,
price int
);

INSERT mobile_phone (product_name, manufacturer, product_count, price)
VALUES
("iPhone X", "Apple", 3, 76000),
("iPhone 8", "Apple", 2, 51000),
("Galaxy S9", "Samsung", 2, 56000),
("Galaxy S8", "Samsung", 1, 41000),
("P20 PRO", "Huawei", 5, 36000);


/*
2. 	Выведите название, производителя и цену для товаров, количество которых превышает 2 (SQL - файл, скриншот, либо сам код)
*/

SELECT product_name, manufacturer, price
FROM mobile_phone
WHERE product_count > 2;

/*
3. Выведите весь ассортимент товаров марки “Samsung”
*/

SELECT *
FROM mobile_phone
WHERE manufacturer = "Samsung"; 

/*
4. 	Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**
*/
SELECT *
FROM mobile_phone
WHERE product_count * price > 100000 AND product_count * price < 145000; 

/*
4.*** С помощью регулярных выражений найти (можно использовать операторы “LIKE”, “RLIKE” для 4.3 ):
*/

/*
4.1. Товары, в которых есть упоминание "Iphone"
*/

SELECT *
FROM mobile_phone
WHERE product_name LIKE "%iPhone%"; 
	
/*
4.2. "Galaxy"
*/
SELECT *
FROM mobile_phone
WHERE product_name LIKE "%Galaxy%";

/*4.3.  Товары, в которых есть ЦИФРЫ
*/

SELECT *
FROM mobile_phone
WHERE product_name RLIKE "[a-z]*[0-9]+[a-z]*";

/*4.4.  Товары, в которых есть ЦИФРА "8"  
*/
SELECT *
FROM mobile_phone
WHERE product_name RLIKE "[a-z]*[8]+[a-z]*";
