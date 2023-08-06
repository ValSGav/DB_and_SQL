import pymysql
from config import host, user, password, db_name

try:
    connection = pymysql.connect(
        host=host,
        port=3306,
        user=user,
        password=password,
        database=db_name,
        cursorclass=pymysql.cursors.DictCursor
    )
    print("Connected")
    try:
        cursor = connection.cursor()
        drop_query = "DROP TABLE IF EXISTS test_py;"
        create_query = """ CREATE TABLE test_py(
        id INT PRIMARY KEY AUTO_INCREMENT,
        first_name VARCHAR(45)
        ); """
        cursor.execute(drop_query)
        cursor.execute(create_query)

        insert_query = """ INSERT test_py(first_name)
         VALUES
         ("Alex"),
         ("Mikle"),
         ("Anton");
         """


        cursor.execute(insert_query)
        connection.commit()

        cursor.execute("UPDATE test_py SET first_name = 'Test' WHERE id = 2 ")
        connection.commit()

        cursor.execute("DELETE FROM test_py  WHERE id = 3 ")
        connection.commit()

        res = cursor.execute("SELECT * FROM test_py")

        rows = cursor.fetchall();

        for row in rows:
            print(row)

        print("ok")
    finally:
        connection.close()
except Exception as ex:
    print("Disconnected")
    print(ex)
