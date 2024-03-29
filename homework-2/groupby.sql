-- 1. Заказы, отправленные в города, заканчивающиеся на 'burg'. Вывести без повторений две колонки (город, страна)
SELECT DISTINCT ship_city, ship_country
FROM orders
WHERE ship_city ILIKE '%burg';

-- 2. Идентификатор заказа, идентификатор заказчика, вес и страна отгрузки. Заказ отгружен в страны, начинающиеся на 'P'. Результат отсортирован по весу (по убыванию). Вывести первые 10 записей.
SELECT order_id, customer_id, weight, ship_country
FROM orders
WHERE ship_country LIKE 'P%'
ORDER BY weight DESC
LIMIT 10;

-- 3. Имя, фамилия и телефон сотрудников, у которых в данных отсутствует регион
SELECT first_name, last_name, home_phone
FROM employees
WHERE region IS NULL;

-- 4. Количество поставщиков (suppliers) в каждой из стран. Результат отсортировать по убыванию количества поставщиков в стране
SELECT country, COUNT(*) AS supplier_count
FROM suppliers
GROUP BY country
ORDER BY supplier_count DESC;

-- 5. Суммарный вес заказов (в которых известен регион) по странам, но вывести только те результаты, где суммарный вес на страну больше 2750. Отсортировать по убыванию суммарного веса
SELECT ship_country, SUM(freight) AS total_weight
FROM orders
WHERE ship_region IS NOT NULL
GROUP BY ship_country
HAVING SUM(freight) > 2750
ORDER BY total_weight DESC;

-- 6. Страны, в которых зарегистрированы и заказчики (customers) и поставщики (suppliers) и работники (employees).
SELECT country
FROM customers
INTERSECT
SELECT country
FROM suppliers
INTERSECT
SELECT country
FROM employees;

-- 7. Страны, в которых зарегистрированы и заказчики (customers) и поставщики (suppliers), но не зарегистрированы работники (employees).
SELECT country
FROM customers
INTERSECT
SELECT country
FROM suppliers
EXCEPT
SELECT country
FROM employees;
