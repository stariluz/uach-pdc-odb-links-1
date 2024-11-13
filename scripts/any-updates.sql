-- Actualización de datos en huertas

EXECUTE update_apple_orchard('Orchard El Sol', 'Orchard El Nuevo Sol', 'Nuevo Valle de Bravo');
EXECUTE update_apple_orchard('Orchard La Amistad', 'Orchard Amistad Actualizada', 'Nuevo Guanajuato');
EXECUTE update_apple_orchard('Orchard La Esperanza', 'Orchard Esperanza Actualizada', 'Nuevo Querétaro');
EXECUTE update_apple_orchard('Orchard Los Manzanos', 'Orchard Manzanos Renovados', 'Nuevo Puebla');
EXECUTE update_apple_orchard('Orchard Frutales', 'Orchard Frutales Actualizados', 'Nuevo Toluca');

-- Actualización de datos en ventas

EXECUTE update_apple_orchard_sale('Orchard El Sol', DATE '2024-11-01', 325.00, 155);
EXECUTE update_apple_orchard_sale('Orchard La Amistad', DATE '2024-11-03', 345.00, 185);
EXECUTE update_apple_orchard_sale('Orchard La Esperanza', DATE '2024-11-05', 355.00, 125);
EXECUTE update_apple_orchard_sale('Orchard Los Manzanos', DATE '2024-11-07', 315.00, 205);
EXECUTE update_apple_orchard_sale('Orchard Frutales', DATE '2024-11-09', 335.00, 175);
