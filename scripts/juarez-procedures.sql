CREATE OR REPLACE PROCEDURE insert_apple_orchard (
    p_orchard_name IN VARCHAR2,
    p_location IN VARCHAR2,
    p_server IN VARCHAR2
) AS
BEGIN
    -- Verificamos que el servidor ingresado esté entre los permitidos
    IF LOWER(p_server) = 'chihuahua' THEN
        INSERT INTO apple_orchards@juarez_chihuahua (orchard_name, location, server)
        VALUES (p_orchard_name, p_location, LOWER(p_server));

    ELSIF LOWER(p_server) = 'juarez' THEN
        INSERT INTO apple_orchards (orchard_name, location, server)
        VALUES (p_orchard_name, p_location, LOWER(p_server));

    ELSIF LOWER(p_server) = 'cuauhtemoc' THEN
        INSERT INTO apple_orchards@juarez_cuauhtemoc (orchard_name, location, server)
        VALUES (p_orchard_name, p_location, LOWER(p_server));

    ELSE
        -- Genera un error si el servidor no es válido
        RAISE_APPLICATION_ERROR(-20001, 'El servidor debe ser "chihuahua", "juarez" o "cuauhtemoc".');
    END IF;

    -- Confirmar la transacción
    COMMIT;
END insert_apple_orchard;
/

CREATE OR REPLACE PROCEDURE insert_apple_orchard_sale (
    p_orchard_id IN NUMBER,
    p_sale_date IN DATE,
    p_price IN NUMBER,
    p_quantity_sold IN NUMBER
) AS
    v_server VARCHAR2(255);
BEGIN
    -- Obtener el servidor correspondiente para la huerta con el orchard_id proporcionado
    SELECT server INTO v_server
    FROM apple_orchards
    WHERE orchard_id = p_orchard_id;

    -- Insertar en la tabla de ventas en el servidor correspondiente
    IF v_server = 'chihuahua' THEN
        INSERT INTO apple_orchard_sales (orchard_id, sale_date, price, quantity_sold)
        VALUES (p_orchard_id, p_sale_date, p_price, p_quantity_sold);

    ELSIF v_server = 'juarez' THEN
        INSERT INTO apple_orchard_sales (orchard_id, sale_date, price, quantity_sold)
        VALUES (p_orchard_id, p_sale_date, p_price, p_quantity_sold);

    ELSIF v_server = 'cuauhtemoc' THEN
        INSERT INTO apple_orchard_sales@juarez_cuauhtemoc (orchard_id, sale_date, price, quantity_sold)
        VALUES (p_orchard_id, p_sale_date, p_price, p_quantity_sold);

    ELSE
        -- Error si el servidor es desconocido
        RAISE_APPLICATION_ERROR(-20002, 'Servidor desconocido para la huerta.');
    END IF;

    -- Confirmar la transacción
    COMMIT;
END insert_apple_orchard_sale;
/

CREATE OR REPLACE PROCEDURE update_apple_orchard (
    p_orchard_id IN NUMBER,
    p_new_name IN VARCHAR2,
    p_new_location IN VARCHAR2
) AS
    v_server VARCHAR2(255);
BEGIN
    -- Obtener el servidor asociado a la huerta
    SELECT server INTO v_server
    FROM apple_orchards
    WHERE orchard_id = p_orchard_id;

    -- Actualizar en el servidor correspondiente
    IF v_server = 'juarez' THEN
        UPDATE apple_orchards
        SET orchard_name = p_new_name, location = p_new_location
        WHERE orchard_id = p_orchard_id;

    ELSIF v_server = 'chihuahua' THEN
        UPDATE apple_orchards@juarez_chihuahua
        SET orchard_name = p_new_name, location = p_new_location
        WHERE orchard_id = p_orchard_id;

    ELSIF v_server = 'cuauhtemoc' THEN
        UPDATE apple_orchards@juarez_cuauhtemoc
        SET orchard_name = p_new_name, location = p_new_location
        WHERE orchard_id = p_orchard_id;

    ELSE
        RAISE_APPLICATION_ERROR(-20003, 'Servidor desconocido para la huerta.');
    END IF;

    COMMIT;
END update_apple_orchard;
/

CREATE OR REPLACE PROCEDURE update_apple_orchard_sale (
    p_sale_id IN NUMBER,
    p_new_sale_date IN DATE,
    p_new_price IN NUMBER,
    p_new_quantity_sold IN NUMBER
) AS
    v_server VARCHAR2(255);
BEGIN
    -- Obtener el servidor de la venta correspondiente
    SELECT server INTO v_server
    FROM apple_orchards ao
    JOIN apple_orchard_sales aos ON ao.orchard_id = aos.orchard_id
    WHERE aos.sale_id = p_sale_id;

    -- Actualizar en el servidor correspondiente
    IF v_server = 'juarez' THEN
        UPDATE apple_orchard_sales
        SET sale_date = p_new_sale_date,
            price = p_new_price,
            quantity_sold = p_new_quantity_sold
        WHERE sale_id = p_sale_id;

    ELSIF v_server = 'chihuahua' THEN
        UPDATE apple_orchard_sales@juarez_chihuahua
        SET sale_date = p_new_sale_date,
            price = p_new_price,
            quantity_sold = p_new_quantity_sold
        WHERE sale_id = p_sale_id;

    ELSIF v_server = 'cuauhtemoc' THEN
        UPDATE apple_orchard_sales@juarez_cuauhtemoc
        SET sale_date = p_new_sale_date,
            price = p_new_price,
            quantity_sold = p_new_quantity_sold
        WHERE sale_id = p_sale_id;

    ELSE
        RAISE_APPLICATION_ERROR(-20004, 'Servidor desconocido para la venta.');
    END IF;

    COMMIT;
END update_apple_orchard_sale;
/

CREATE OR REPLACE PROCEDURE delete_apple_orchard (
    p_orchard_id IN NUMBER
) AS
    v_server VARCHAR2(255);
BEGIN
    -- Obtener el servidor de la huerta
    SELECT server INTO v_server
    FROM apple_orchards
    WHERE orchard_id = p_orchard_id;

    -- Eliminar la huerta y sus ventas en el servidor correspondiente
    IF v_server = 'juarez' THEN
        DELETE FROM apple_orchard_sales
        WHERE orchard_id = p_orchard_id;

        DELETE FROM apple_orchards
        WHERE orchard_id = p_orchard_id;

    ELSIF v_server = 'chihuahua' THEN
        DELETE FROM apple_orchard_sales@juarez_chihuahua
        WHERE orchard_id = p_orchard_id;

        DELETE FROM apple_orchards@juarez_chihuahua
        WHERE orchard_id = p_orchard_id;

    ELSIF v_server = 'cuauhtemoc' THEN
        DELETE FROM apple_orchard_sales@juarez_cuauhtemoc
        WHERE orchard_id = p_orchard_id;

        DELETE FROM apple_orchards@juarez_cuauhtemoc
        WHERE orchard_id = p_orchard_id;

    ELSE
        RAISE_APPLICATION_ERROR(-20005, 'Servidor desconocido para la huerta.');
    END IF;

    COMMIT;
END delete_apple_orchard;
/

CREATE OR REPLACE PROCEDURE delete_apple_orchard_sale (
    p_sale_id IN NUMBER
) AS
    v_server VARCHAR2(255);
BEGIN
    -- Obtener el servidor asociado a la venta
    SELECT server INTO v_server
    FROM apple_orchards ao
    JOIN apple_orchard_sales aos ON ao.orchard_id = aos.orchard_id
    WHERE aos.sale_id = p_sale_id;

    -- Eliminar la venta en el servidor correspondiente
    IF v_server = 'juarez' THEN
        DELETE FROM apple_orchard_sales
        WHERE sale_id = p_sale_id;

    ELSIF v_server = 'chihuahua' THEN
        DELETE FROM apple_orchard_sales@juarez_chihuahua
        WHERE sale_id = p_sale_id;

    ELSIF v_server = 'cuauhtemoc' THEN
        DELETE FROM apple_orchard_sales@juarez_cuauhtemoc
        WHERE sale_id = p_sale_id;

    ELSE
        RAISE_APPLICATION_ERROR(-20006, 'Servidor desconocido para la venta.');
    END IF;

    COMMIT;
END delete_apple_orchard_sale;
/