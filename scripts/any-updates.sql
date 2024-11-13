-- Actualización de datos en huertas
BEGIN
    update_apple_orchard(1, 'Orchard El Nuevo Sol', 'Nuevo Valle de Bravo');
    update_apple_orchard(2, 'Orchard Amistad Actualizada', 'Nuevo Guanajuato');
    update_apple_orchard(3, 'Orchard Esperanza Actualizada', 'Nuevo Querétaro');
    update_apple_orchard(4, 'Orchard Manzanos Renovados', 'Nuevo Puebla');
    update_apple_orchard(5, 'Orchard Frutales Actualizados', 'Nuevo Toluca');
END;
/

-- Actualización de datos en ventas
BEGIN
    update_apple_orchard_sale(1, DATE '2024-11-01', 325.00, 155);
    update_apple_orchard_sale(2, DATE '2024-11-03', 345.00, 185);
    update_apple_orchard_sale(3, DATE '2024-11-05', 355.00, 125);
    update_apple_orchard_sale(4, DATE '2024-11-07', 315.00, 205);
    update_apple_orchard_sale(5, DATE '2024-11-09', 335.00, 175);
END;
/
