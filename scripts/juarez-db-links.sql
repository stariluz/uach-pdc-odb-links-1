drop database link if exists juarez_chihuahua;
create database link juarez_chihuahua
   connect to system identified by my_pw_is_very_safe_yipi_1
using '(DESCRIPTION =
         (ADDRESS=
            (PROTOCOL = TCP)
            (HOST = 172.18.0.2)
            (PORT = 1521)
         )
         (CONNECT_DATA =
            (SERVICE_NAME = free)
         )
      )';

drop database link if exists juarez_cuauhtemoc;
create database link juarez_cuauhtemoc
   connect to system identified by my_pw_is_very_safe_yipi_1
using '(DESCRIPTION =
         (ADDRESS=
            (PROTOCOL = TCP)
            (HOST = 172.18.0.4)
            (PORT = 1521)
         )
         (CONNECT_DATA =
            (SERVICE_NAME = free)
         )
      )';