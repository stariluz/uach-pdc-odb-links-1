SELECT * FROM apple_orchards@chihuahua_link
UNION
SELECT * FROM apple_orchards@juarez_link
UNION
SELECT * FROM apple_orchards@cuauhtemoc_link;

SELECT * FROM apple_orchards@chihuahua_link;
SELECT * FROM apple_orchards@juarez_link;
SELECT * FROM apple_orchards@cuauhtemoc_link;

SELECT * FROM apple_orchard_sales@chihuahua_link
UNION
SELECT * FROM apple_orchard_sales@juarez_link
UNION
SELECT * FROM apple_orchard_sales@cuauhtemoc_link;

SELECT * FROM apple_orchard_sales@chihuahua_link;
SELECT * FROM apple_orchard_sales@juarez_link;
SELECT * FROM apple_orchard_sales@cuauhtemoc_link;

COMMIT;