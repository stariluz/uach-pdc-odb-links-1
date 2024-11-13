drop database link if exists chihuahua_juarez;
create database link chihuahua_juarez
   connect to system identified by my_pw_is_very_safe_yipi_1
using '(DESCRIPTION =
         (ADDRESS=
            (PROTOCOL = TCP)
            (HOST = 172.18.0.3)
            (PORT = 1521)
         )
         (CONNECT_DATA =
            (SERVICE_NAME = FREE)
         )
      )';
select *
  from dual@chihuahua_juarez;


drop database link if exists chihuahua_cuauhtemoc;
create database link chihuahua_cuauhtemoc
   connect to system identified by my_pw_is_very_safe_yipi_1
using '(DESCRIPTION =
         (ADDRESS=
            (PROTOCOL = TCP)
            (HOST = 172.18.0.2)
            (PORT = 1521)
         )
         (CONNECT_DATA =
            (SERVICE_NAME = FREE)
         )
      )';
select *
  from dual@chihuahua_cuauhtemoc;