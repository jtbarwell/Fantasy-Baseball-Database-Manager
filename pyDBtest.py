import pyodbc
server = 'DESKTOP-IEKNRR8\SQLEXPRESS'
database = 'baseball'
driver = '{ODBC Driver 17 for SQL Server}'

with pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};Server=DESKTOP-IEKNRR8\SQLEXPRESS;Database=baseball;Trusted_Connection=yes;') as conn:
    with conn.cursor() as cursor:
        cursor.execute("SELECT TOP 3 name, collation_name FROM sys.databases")
        row = cursor.fetchone()
        while row:
            print (str(row[0]) + " " + str(row[1]))
            row = cursor.fetchone()