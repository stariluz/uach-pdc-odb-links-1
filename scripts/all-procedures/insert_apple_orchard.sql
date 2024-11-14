CREATE OR REPLACE PROCEDURE insert_apple_orchard (
    p_orchard_name IN VARCHAR2,
    p_location IN VARCHAR2,
    p_server IN VARCHAR2
) AS
BEGIN
    -- Verificamos que el servidor ingresado esté entre los permitidos
    IF LOWER(p_server) = 'chihuahua' THEN
        INSERT INTO apple_orchards@chihuahua_link(orchard_name, location, server)
        VALUES (p_orchard_name, p_location, LOWER(p_server));

    ELSIF LOWER(p_server) = 'cuauhtemoc' THEN
        INSERT INTO apple_orchards@cuauhtemoc_link (orchard_name, location, server)
        VALUES (p_orchard_name, p_location, LOWER(p_server));

    ELSIF LOWER(p_server) = 'juarez' THEN
        INSERT INTO apple_orchards@juarez_link (orchard_name, location, server)
        VALUES (p_orchard_name, p_location, LOWER(p_server));

    ELSE
        -- Genera un error si el servidor no es válido
        RAISE_APPLICATION_ERROR(-20001, 'El servidor debe ser "chihuahua", "juarez" o "cuauhtemoc".');
    END IF;

    -- Confirmar la transacción
    COMMIT;
END insert_apple_orchard;