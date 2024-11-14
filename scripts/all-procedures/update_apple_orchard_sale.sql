CREATE OR REPLACE PROCEDURE update_apple_orchard_sale (
    p_sale_id IN RAW,
    p_new_sale_date IN DATE,
    p_new_price IN NUMBER,
    p_new_quantity_sold IN NUMBER
) AS
    v_server VARCHAR2(255);
BEGIN
    -- Obtener el servidor asociado a la venta
    SELECT server
    INTO v_server
    FROM (
        SELECT server
        FROM apple_chihuahua ao
        JOIN sales_chihuahua aos ON ao.orchard_name = aos.orchard_name
        WHERE aos.sale_id = p_sale_id
        UNION
        SELECT server
        FROM apple_juarez ao2
        JOIN sales_juarez aos2 ON ao2.orchard_name = aos2.orchard_name
        WHERE aos2.sale_id = p_sale_id
        UNION
        SELECT server
        FROM apple_cuauhtemoc ao3
        JOIN sales_cuauhtemoc aos3 ON ao3.orchard_name = aos3.orchard_name
        WHERE aos3.sale_id = p_sale_id
    ) combined_servers
    WHERE ROWNUM = 1;

    -- Actualizar en el servidor correspondiente
    IF v_server = 'chihuahua' THEN
        UPDATE apple_orchard_sales
        SET sale_date = p_new_sale_date,
            price = p_new_price,
            quantity_sold = p_new_quantity_sold
        WHERE sale_id = p_sale_id;

    ELSIF v_server = 'cuauhtemoc' THEN
        UPDATE sales_cuauhtemoc
        SET sale_date = p_new_sale_date,
            price = p_new_price,
            quantity_sold = p_new_quantity_sold
        WHERE sale_id = p_sale_id;

    ELSIF v_server = 'juarez' THEN
        UPDATE sales_juarez
        SET sale_date = p_new_sale_date,
            price = p_new_price,
            quantity_sold = p_new_quantity_sold
        WHERE sale_id = p_sale_id;

    ELSE
        RAISE_APPLICATION_ERROR(-20004, 'Servidor desconocido para la venta.');
    END IF;

    COMMIT;
END update_apple_orchard_sale;
