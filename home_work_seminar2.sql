-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
USE seminar2_home_work;

DROP TABLE IF EXISTS sales ;
CREATE TABLE sales
(
id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE,
count_product INT
);

INSERT sales(order_date, count_product)
VALUES
("2022-01-01", 156),
("2022-01-02", 180),
("2022-01-03", 21),
("2022-01-04", 124),
("2022-01-05", 341);

SELECT * FROM sales;

-- 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
SELECT 
	id as ID,
    IF (count_product < 100, "Маленький заказ", 
		IF (count_product BETWEEN 100 AND 300, "Средний заказ", 
			IF(count_product > 300, "Большой заказ", "Ошибка" ))) AS "Тип заказа"
FROM sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE

DROP TABLE IF EXISTS orders ;
CREATE TABLE orders
(
id INT PRIMARY KEY AUTO_INCREMENT,
employee_id CHAR(3),
amount FLOAT,
order_status VARCHAR(9)
);

INSERT orders(employee_id, amount, order_status)
VALUES
("eO3", 15.0, "OPEN"),
("eO1", 25.5, "OPEN"),
("eO5", 100.7, "CLOSED"),
("eO2", 22.18, "OPEN"),
("eO4", 9.5, "CANCELLED");

SELECT 
*,
CASE 
	WHEN order_status = "OPEN" THEN "Order is in open state"
    WHEN order_status = "CLOSED" THEN "Order is closed"
    WHEN order_status = "CANCELLED" THEN "Order is cancelled"
END AS "full_order_status"
FROM orders;

