[https://github.com/oracle/docker-images/tree/main/OracleDatabase/SingleInstance#how-to-build-and-run](https://github.com/oracle/docker-images/tree/main/OracleDatabase/SingleInstance#how-to-build-and-run)
```sh
docker pull container-registry.oracle.com/database/free:latest
docker stop chihuahua-odb
docker rm chihuahua-odb
docker run -dti --name chihuahua-odb \
--network apples-network \
-p 1521:1521 \
--env-file .env \
container-registry.oracle.com/database/free:latest

docker stop juarez-odb
docker rm juarez-odb
docker run -dti --name juarez-odb \
--network apples-network \
-p 1522:1521 \
--env-file .env \
container-registry.oracle.com/database/free:latest

docker stop cuauhtemoc-odb
docker rm cuauhtemoc-odb
docker run -dti --name cuauhtemoc-odb \
--network apples-network \
-p 1523:1521 \
--env-file .env \
container-registry.oracle.com/database/free:latest
```


```sql
ALTER SYSTEM SET local_listener='(ADDRESS=(PROTOCOL=TCP)(HOST=172.18.0.3)(PORT=1521))' SCOPE=BOTH;
```


```sql
"Containers": {
            "0922e50c74b3defe894300f1749033ca795ff0c40177edd7ddf36c60e5028555": {        
                "Name": "cuauhtemoc-odb",
                "EndpointID": "74e2b8e21cbd33a5b780600ff024df44b21e7822b4e176d92e7d686084f802ba",
                "MacAddress": "02:42:ac:12:00:04",
                "IPv4Address": "172.18.0.4/16",
                "IPv6Address": ""
            },
            "a7fb4e39df9b5a6166ce7deaf057c971d462d1b4ca11def51836dcfacb10fb86": {        
                "Name": "juarez-odb",
                "EndpointID": "a76ff4da5b8f692287c1edd5aac772f0d85ceaa1b330a09ed36f84d204ccc1ee",
                "MacAddress": "02:42:ac:12:00:03",
                "IPv4Address": "172.18.0.3/16",
                "IPv6Address": ""
            },
            "bd91537162bbab37c8e99511c56b851c538d3918a8663908d699208fddd917fc": {        
                "Name": "chihuahua-odb",
                "EndpointID": "782dbb27bbc814e7f4b58de249f137914401e5710f4387a283e11efd5e37a848",
                "MacAddress": "02:42:ac:12:00:02",
                "IPv4Address": "172.18.0.2/16",
                "IPv6Address": ""
            }
        },
```