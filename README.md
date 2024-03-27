# Введение в БД. Домашнее задание

### Установка Postgres

- [Скачать](https://www.postgresql.org/download/) и установить локально Postgres

### Создание БД

- Подключиться к Postgres из командной строки
- Создать БД с названием `north`

### Создание таблиц

- Ознакомиться с данными в папке `north_data`
- Создать три таблицы, используя `query tool` в pgAdmin
    - `employees`
    - `customers`
    - `orders`
- Колонки для таблиц и связи между таблицами определить самостоятельно
- Sql-код для создания таблиц скопировать в файл `create_tables.sql`

### Заполнение таблиц данными

- Написать скрипт в `main.py`, который заполнит созданные таблицы данными из `north_data`
- Для подключения к БД использовать библиотеку `psycopg2`
- Зайти в pgAdmin и убедиться, что данные в таблицах есть