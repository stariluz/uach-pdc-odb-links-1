CREATE OR REPLACE PROCEDURE delete_apple_orchard (
    p_orchard_name IN VARCHAR2
) AS
    v_server VARCHAR2(255);
BEGIN
    -- Obtener el servidor de la huerta
    SELECT server
    INTO v_server
    FROM (
        SELECT server
        FROM apple_chihuahua
        WHERE orchard_name = p_orchard_name
        UNION
        SELECT server
        FROM apple_juarez
        WHERE orchard_name = p_orchard_name
        UNION
        SELECT server
        FROM apple_cuauhtemoc
        WHERE orchard_name = p_orchard_name
    ) combined_servers;

    -- Eliminar la huerta y sus ventas en el servidor correspondiente
    IF v_server = 'chihuahua' THEN
        DELETE FROM sales_chihuahua 
        WHERE orchard_name = p_orchard_name;

        DELETE FROM apple_chihuahua
        WHERE orchard_name = p_orchard_name;

    ELSIF v_server = 'cuauhtemoc' THEN
        DELETE FROM sales_cuauhtemoc
        WHERE orchard_name = p_orchard_name;

        DELETE FROM apple_cuauhtemoc
        WHERE orchard_name = p_orchard_name;

    ELSIF v_server = 'juarez' THEN
        DELETE FROM sales_juarez
        WHERE orchard_name = p_orchard_name;

        DELETE FROM apple_juarez
        WHERE orchard_name = p_orchard_name;

    ELSE
        RAISE_APPLICATION_ERROR(-20005, 'Servidor desconocido para la huerta.');
    END IF;

    COMMIT;
END delete_apple_orchard;