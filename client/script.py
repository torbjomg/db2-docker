import ibm_db
import os
import time

# os.system("chmod +x /bind_packages.sh")
# os.system("/bind_packages.sh")

DB_USER = os.environ.get("DB_USER")
DB_PASSWORD = os.environ.get("DB_PASSWORD")
CONNECTION_STRING = f"DATABASE=testdb;HOSTNAME=db2;PORT=50000;PROTOCOL=TCPIP;UID={DB_USER};PWD={DB_PASSWORD};"
wait = 300
print("waiting 30")
time.sleep(60)
while wait > 0:
    try:
        con = ibm_db.connect(
            CONNECTION_STRING,
            "",
            "",
        )
        if con:
            print("Connected to the DB2 service!")
            break
        else:
            print("Failed to connect to the DB2 service.")
    except Exception as e:
        print(e)
        print("Retrying in 5 seconds...")
        time.sleep(5)
        wait -= 5
        if wait <= 0:
            print("Failed to connect to the DB2 service.")
            break

con = ibm_db.connect(
    CONNECTION_STRING,
    "",
    "",
)
stmt = ibm_db.exec_immediate(con, "SELECT 1 FROM SYSIBM.SYSDUMMY1")

res = ibm_db.fetch_tuple(stmt)

assert res[0] == 1
print(res[0])
