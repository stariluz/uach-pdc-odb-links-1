CREATE OR REPLACE PROCEDURE delete_apple_orchard_sale (
    p_sale_id IN RAW
) AS
    v_server VARCHAR2(255);
BEGIN
    -- Obtener el servidor asociado a la venta
    SELECT server
    INTO v_server
    FROM (
        SELECT server
        FROM apple_orchards ao
        JOIN apple_orchard_sales aos ON ao.orchard_name = aos.orchard_name
        WHERE aos.sale_id = p_sale_id
        UNION
        SELECT server
        FROM apple_orchards@cuauhtemoc_chihuahua ao2
        JOIN apple_orchard_sales@cuauhtemoc_chihuahua aos2 ON ao2.orchard_name = aos2.orchard_name
        WHERE aos2.sale_id = p_sale_id
        UNION
        SELECT server
        FROM apple_orchards@cuauhtemoc_juarez ao3
        JOIN apple_orchard_sales@cuauhtemoc_juarez aos3 ON ao3.orchard_name = aos3.orchard_name
        WHERE aos3.sale_id = p_sale_id
    ) combined_servers
    WHERE ROWNUM = 1;

    -- Eliminar la venta en el servidor correspondiente
    IF v_server = 'cuauhtemoc' THEN
        DELETE FROM apple_orchard_sales 
        WHERE sale_id = p_sale_id;

    ELSIF v_server = 'juarez' THEN
        DELETE FROM apple_orchard_sales@cuauhtemoc_juarez
        WHERE sale_id = p_sale_id;

    ELSIF v_server = 'chihuahua' THEN
        DELETE FROM apple_orchard_sales@cuauhtemoc_chihuahua
        WHERE sale_id = p_sale_id;

    ELSE
        RAISE_APPLICATION_ERROR(-20006, 'Servidor desconocido para la venta.');
    END IF;

    COMMIT;
END delete_apple_orchard_sale;