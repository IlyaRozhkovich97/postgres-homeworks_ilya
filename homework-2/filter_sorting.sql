-- 1. Заказы, доставленные в страны France, Germany, Spain
SELECT *
FROM orders
WHERE ship_country IN ('France', 'Germany', 'Spain');

-- 2. Уникальные страны и города, куда отправлялись заказы, отсортированные по странам и городам
SELECT DISTINCT ship_country, ship_city
FROM orders
ORDER BY ship_country, ship_city;

-- 3. Среднее количество дней на доставку товара в Германию
SELECT AVG(shipped_date - order_date)
FROM orders
WHERE ship_country = 'Germany';

-- 4. Минимальная и максимальная цена среди продуктов, не снятых с продажи
SELECT MIN(unit_price) AS min_price, MAX(unit_price) AS max_price
FROM products
WHERE discontinued <> 1;

-- 5. Минимальная и максимальная цена среди продуктов, не снятых с продажи и с запасом не менее 20 единиц
SELECT MIN(unit_price) AS min_price, MAX(unit_price) AS max_price
FROM products
WHERE discontinued <> 1 AND units_in_stock >= 20;
