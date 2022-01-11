import pymysql as sql

db = sql.connect(host="localhost", user="root", passwd="1234")
cur = db.cursor()

cur.execute("SHOW DATABASES;")

result_table = cur.fetchall()
for index, row in enumerate(result_table, start=1):
    serial_number = str(index) + "."
    print(serial_number, row[0])

cur.close()
db.close()
