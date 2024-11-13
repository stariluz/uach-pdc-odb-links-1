CREATE OR REPLACE PROCEDURE update_apple_orchard (
    p_orchard_name IN VARCHAR2,
    p_new_name IN VARCHAR2,
    p_new_location IN VARCHAR2
) AS
    v_server VARCHAR2(255);
BEGIN
    -- Obtener el servidor asociado a la huerta
    SELECT server
    INTO v_server
    FROM (
        SELECT server
        FROM apple_orchards
        WHERE orchard_name = p_orchard_name
        UNION
        SELECT server
        FROM apple_orchards@juarez_chihuahua
        WHERE orchard_name = p_orchard_name
        UNION
        SELECT server
        FROM apple_orchards@juarez_cuauhtemoc
        WHERE orchard_name = p_orchard_name
    ) combined_servers;

    -- Actualizar en el servidor correspondiente
    IF v_server = 'juarez' THEN
        UPDATE apple_orchards
        SET orchard_name = p_new_name, location = p_new_location
        WHERE orchard_name = p_orchard_name;

    ELSIF v_server = 'cuauhtemoc' THEN
        UPDATE apple_orchards@juarez_cuauhtemoc
        SET orchard_name = p_new_name, location = p_new_location
        WHERE orchard_name = p_orchard_name;

    ELSIF v_server = 'chihuahua' THEN
        UPDATE apple_orchards@juarez_chihuahua
        SET orchard_name = p_new_name, location = p_new_location
        WHERE orchard_name = p_orchard_name;

    ELSE
        RAISE_APPLICATION_ERROR(-20003, 'Servidor desconocido para la huerta.');
    END IF;

    COMMIT;
END update_apple_orchard;