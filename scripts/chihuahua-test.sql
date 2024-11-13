SELECT * FROM apple_orchards
UNION
SELECT * FROM apple_orchards@chihuahua_juarez
UNION
SELECT * FROM apple_orchards@chihuahua_cuauhtemoc;

SELECT * FROM apple_orchards;
SELECT * FROM apple_orchards@chihuahua_juarez;
SELECT * FROM apple_orchards@chihuahua_cuauhtemoc;

SELECT * FROM apple_orchard_sales
UNION
SELECT * FROM apple_orchard_sales@chihuahua_juarez
UNION
SELECT * FROM apple_orchard_sales@chihuahua_cuauhtemoc;

SELECT * FROM apple_orchard_sales;
SELECT * FROM apple_orchard_sales@chihuahua_juarez;
SELECT * FROM apple_orchard_sales@chihuahua_cuauhtemoc;