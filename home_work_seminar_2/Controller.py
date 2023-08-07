from config import host, user, password, db_name
from Operation import Operation as op
import pymysql


class Controller:

    @staticmethod
    def set_command_and_data_from_view(kind_of: op, data: dict) -> str:

        try:
            connection = pymysql.connect(
                host=host,
                port=3306,
                user=user,
                password=password,
                database=db_name,
                cursorclass=pymysql.cursors.DictCursor)

            try:
                cursor = connection.cursor()

                cursor.execute(f"""
                            CREATE TABLE IF NOT EXISTS work_group (
                            user_id INT PRIMARY KEY AUTO_INCREMENT,
                            first_name VARCHAR(45),
                            last_name VARCHAR(45),
                            age INT,
                            departament VARCHAR(70)
                        ); """)
                connection.commit()

                if kind_of == op.UPDATE:
                    sql_queue = str.format(
                        f"""
                        UPDATE work_group
                        SET 
                            first_name = "{data.get("first_name")}",
                            last_name = "{data.get("last_name")}",
                            age = {0 if data.get("age")=="" else int(data.get("age"))},
                            departament = "{data.get("departament")}"
                        WHERE user_id = {data.get("user_id")};""")

                elif kind_of == op.CREATE:
                    sql_queue = str.format(
                        f"""                        
                        INSERT work_group (first_name, last_name, age, departament)
                        VALUES
                        (   "{data.get("first_name")}", "{data.get("last_name")}", "{0 if data.get("age")=="" else int(data.get("age"))}", "{data.get("departament")}");""")

                elif kind_of == op.DELETE:
                    sql_queue = str.format(
                        f"""
                    DELETE FROM work_group  
                        WHERE user_id = {data.get("user_id")};                 
                        """)
                else:
                    returnStr = "";
                    res = cursor.execute(f"SELECT * FROM work_group;")
                    rows = cursor.fetchall();
                    for row in rows:
                        returnStr += "\n" + "; ".join('{}:{}'.format(key, val) for key, val in row.items())
                    return returnStr;

                cursor.execute(sql_queue)
                connection.commit()
                return "ok"

            finally:
                print("Connection is close")
                connection.close()

        except Exception as ex:
            print("Disconnected")
            print(ex)
