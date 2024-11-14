define db_password = 'my_pw_is_very_safe_yipi_1';

drop database link if exists chihuahua_link;
create database link chihuahua_link
   connect to system identified by &db_password
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
  from dual@chihuahua_link;

drop database link if exists juarez_link;
create database link juarez_link
   connect to system identified by &db_password
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
  from dual@juarez_link;


drop database link if exists cuauhtemoc_link;
create database link cuauhtemoc_link
   connect to system identified by &db_password
using '(DESCRIPTION =
         (ADDRESS=
            (PROTOCOL = TCP)
            (HOST = 172.18.0.4)
            (PORT = 1521)
         )
         (CONNECT_DATA =
            (SERVICE_NAME = FREE)
         )
      )';
select *
  from dual@cuauhtemoc_link;
  