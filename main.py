from dotenv import load_dotenv
import psycopg2
import csv
import os

# Загрузить переменные окружения из файла .env
load_dotenv()

# Список CSV файлов, содержащих данные для заполнения таблиц
tables = ['employees_data.csv', 'customers_data.csv', 'orders_data.csv']

# Список имен таблиц в базе данных PostgreSQL
tables_name = ['employees', 'customers', 'orders']


def add_data_in_bd(tables, tables_name):
    """Скрипт для заполнения данными таблиц в БД Postgres."""
    # Устанавливаем соединение с базой данных
    password = os.getenv('DATABASE_PASSWORD')
    conn = psycopg2.connect(host='localhost', database='north', user='postgres', password=password)
    cur = conn.cursor()
    for i in range(len(tables)):
        # Открываем CSV файл для чтения
        with open(os.path.join('north_data', tables[i]), 'r') as csvfile:
            header = next(csvfile)
            csvreader = csv.reader(csvfile)
            for row in csvreader:
                values = '%s, ' * len(row)
                cur.execute(f"INSERT INTO {tables_name[i]} VALUES ({values[:-2]})", row)
            # Фиксируем изменения в базе данных
            conn.commit()
    # Закрываем курсор и соединение
    cur.close()
    conn.close()


# Вызываем функцию для заполнения данными таблиц в базе данных
if __name__ == '__main__':
    add_data_in_bd(tables, tables_name)
