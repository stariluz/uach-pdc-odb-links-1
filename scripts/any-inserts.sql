-- Creación de huertas en diferentes servidores

EXECUTE insert_apple_orchard('Orchard El Sol', 'Valle de Bravo', 'chihuahua');
EXECUTE insert_apple_orchard('Orchard La Amistad', 'Guanajuato', 'chihuahua');
EXECUTE insert_apple_orchard('Orchard La Esperanza', 'Querétaro', 'cuauhtemoc');
EXECUTE insert_apple_orchard('Orchard Los Manzanos', 'Puebla', 'juarez');
EXECUTE insert_apple_orchard('Orchard Frutales', 'Toluca', 'chihuahua');
EXECUTE insert_apple_orchard('Orchard La Huerta', 'Morelia', 'cuauhtemoc');
EXECUTE insert_apple_orchard('Orchard El Progreso', 'Celaya', 'juarez');
EXECUTE insert_apple_orchard('Orchard Buenavista', 'Chilpancingo', 'chihuahua');
EXECUTE insert_apple_orchard('Orchard La Paz', 'Oaxaca', 'juarez');
EXECUTE insert_apple_orchard('Orchard Los Arboles', 'Zacatecas', 'cuauhtemoc');

-- Creación de ventas en diferentes huertas

EXECUTE insert_apple_orchard_sale('Orchard El Sol', DATE '2024-10-01', 320.00, 150);
EXECUTE insert_apple_orchard_sale('Orchard La Amistad', DATE '2024-10-05', 340.00, 180);
EXECUTE insert_apple_orchard_sale('Orchard La Esperanza', DATE '2024-10-07', 350.00, 120);
EXECUTE insert_apple_orchard_sale('Orchard Los Manzanos', DATE '2024-10-09', 310.00, 200);
EXECUTE insert_apple_orchard_sale('Orchard Frutales', DATE '2024-10-11', 330.00, 170);
EXECUTE insert_apple_orchard_sale('Orchard La Huerta', DATE '2024-10-12', 360.00, 220);
EXECUTE insert_apple_orchard_sale('Orchard El Progreso', DATE '2024-10-14', 340.00, 130);
EXECUTE insert_apple_orchard_sale('Orchard Buenavista', DATE '2024-10-15', 300.00, 140);
EXECUTE insert_apple_orchard_sale('Orchard La Paz', DATE '2024-10-16', 310.00, 110);
EXECUTE insert_apple_orchard_sale('Orchard Los Arboles', DATE '2024-10-18', 330.00, 160);
