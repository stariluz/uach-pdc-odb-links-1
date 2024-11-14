define db_password = 'my_pw_is_very_safe_yipi_1';

DROP DATABASE LINK IF EXISTS chihuahua_link;
CREATE DATABASE LINK chihuahua_link
   CONNECT TO system IDENTIFIED BY &db_password
USING '(DESCRIPTION =
         (ADDRESS=
            (PROTOCOL = TCP)
            (HOST = 172.18.0.2)
            (PORT = 1521)
         )
         (CONNECT_DATA =
            (SERVICE_NAME = FREE)
         )
      )';
SELECT *
  FROM dual@chihuahua_link;

DROP DATABASE LINK IF EXISTS juarez_link;
CREATE DATABASE LINK juarez_link
   CONNECT TO system IDENTIFIED BY &db_password
USING '(DESCRIPTION =
         (ADDRESS=
            (PROTOCOL = TCP)
            (HOST = 172.18.0.3)
            (PORT = 1521)
         )
         (CONNECT_DATA =
            (SERVICE_NAME = FREE)
         )
      )';
SELECT *
  FROM dual@juarez_link;


DROP DATABASE LINK IF EXISTS cuauhtemoc_link;
CREATE DATABASE LINK cuauhtemoc_link
   CONNECT TO system IDENTIFIED BY &db_password
USING '(DESCRIPTION =
         (ADDRESS=
            (PROTOCOL = TCP)
            (HOST = 172.18.0.4)
            (PORT = 1521)
         )
         (CONNECT_DATA =
            (SERVICE_NAME = FREE)
         )
      )';
SELECT *
  FROM dual@cuauhtemoc_link;


COMMIT;