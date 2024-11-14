CREATE OR REPLACE PROCEDURE insert_apple_orchard_sale (
    p_orchard_name IN VARCHAR2,
    p_sale_date IN DATE,
    p_price IN NUMBER,
    p_quantity_sold IN NUMBER
) AS
    v_server VARCHAR2(255);
BEGIN
    -- Obtener el servidor correspondiente para la huerta con el orchard_name proporcionado
    SELECT server
    INTO v_server
    FROM (
        SELECT server
        FROM apple_orchards@chihuahua_link
        WHERE orchard_name = p_orchard_name
        UNION
        SELECT server
        FROM apple_orchards@juarez_link
        WHERE orchard_name = p_orchard_name
        UNION
        SELECT server
        FROM apple_orchards@cuauhtemoc_link
        WHERE orchard_name = p_orchard_name
    ) combined_servers;

    -- Insertar en la tabla de ventas en el servidor correspondiente
    IF v_server = 'chihuahua' THEN
        INSERT INTO apple_orchard_sales@chihuahua_link (orchard_name, sale_date, price, quantity_sold)
        VALUES (p_orchard_name, p_sale_date, p_price, p_quantity_sold);

    ELSIF v_server = 'cuauhtemoc' THEN
        INSERT INTO apple_orchard_sales@cuauhtemoc_link (orchard_name, sale_date, price, quantity_sold)
        VALUES (p_orchard_name, p_sale_date, p_price, p_quantity_sold);

    ELSIF v_server = 'juarez' THEN
        INSERT INTO apple_orchard_sales@juarez_link (orchard_name, sale_date, price, quantity_sold)
        VALUES (p_orchard_name, p_sale_date, p_price, p_quantity_sold);

    ELSE
        -- Error si el servidor es desconocido
        RAISE_APPLICATION_ERROR(-20002, 'Servidor desconocido para la huerta.');
    END IF;

    -- Confirmar la transacción
    COMMIT;
END insert_apple_orchard_sale;