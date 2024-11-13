-- Actualización de datos en huertas

EXECUTE update_apple_orchard(1, 'Orchard El Nuevo Sol', 'Nuevo Valle de Bravo');
EXECUTE update_apple_orchard(2, 'Orchard Amistad Actualizada', 'Nuevo Guanajuato');
EXECUTE update_apple_orchard(3, 'Orchard Esperanza Actualizada', 'Nuevo Querétaro');
EXECUTE update_apple_orchard(4, 'Orchard Manzanos Renovados', 'Nuevo Puebla');
EXECUTE update_apple_orchard(5, 'Orchard Frutales Actualizados', 'Nuevo Toluca');


-- Actualización de datos en ventas

EXECUTE update_apple_orchard_sale(1, DATE '2024-11-01', 325.00, 155);
EXECUTE update_apple_orchard_sale(2, DATE '2024-11-03', 345.00, 185);
EXECUTE update_apple_orchard_sale(3, DATE '2024-11-05', 355.00, 125);
EXECUTE update_apple_orchard_sale(4, DATE '2024-11-07', 315.00, 205);
EXECUTE update_apple_orchard_sale(5, DATE '2024-11-09', 335.00, 175);

