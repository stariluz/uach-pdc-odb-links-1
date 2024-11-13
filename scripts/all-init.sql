DROP TABLE IF EXISTS apple_orchard_sales;
DROP TABLE IF EXISTS apple_orchards;
CREATE TABLE apple_orchards (
    orchard_name VARCHAR2(255) PRIMARY KEY,
    location VARCHAR2(255) NOT NULL,
    server VARCHAR2(255) NOT NULL CHECK (server IN ('chihuahua', 'juarez', 'cuauhtemoc'))
);

CREATE TABLE apple_orchard_sales (
    sale_id RAW(16) DEFAULT SYS_GUID() PRIMARY KEY,
    orchard_name VARCHAR2(255) NOT NULL,
    sale_date DATE NOT NULL,
    price NUMBER(10, 2) NOT NULL,
    quantity_sold NUMBER NOT NULL,
    CONSTRAINT fk_orchard FOREIGN KEY (orchard_name) REFERENCES apple_orchards(orchard_name)
);
