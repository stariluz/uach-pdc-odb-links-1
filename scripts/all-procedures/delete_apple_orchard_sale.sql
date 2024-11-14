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

    -- Eliminar la venta en el servidor correspondiente
    IF v_server = 'chihuahua' THEN
        DELETE FROM sales_chihuahua 
        WHERE sale_id = p_sale_id;

    ELSIF v_server = 'cuauhtemoc' THEN
        DELETE FROM sales_cuauhtemoc
        WHERE sale_id = p_sale_id;

    ELSIF v_server = 'juarez' THEN
        DELETE FROM sales_juarez
        WHERE sale_id = p_sale_id;

    ELSE
        RAISE_APPLICATION_ERROR(-20006, 'Servidor desconocido para la venta.');
    END IF;

    COMMIT;
END delete_apple_orchard_sale;