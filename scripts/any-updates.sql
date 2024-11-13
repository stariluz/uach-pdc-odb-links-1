-- Actualización de datos en huertas

EXECUTE update_apple_orchard('Orchard El Sol', 'Orchard El Sol', 'Nuevo Valle de Bravo');
EXECUTE update_apple_orchard('Orchard La Amistad', 'Orchard La Amistad', 'Nuevo Guanajuato');
EXECUTE update_apple_orchard('Orchard La Esperanza', 'Orchard La Esperanza', 'Nuevo Querétaro');
EXECUTE update_apple_orchard('Orchard Los Manzanos', 'Orchard Los Manzanos', 'Nuevo Puebla');
EXECUTE update_apple_orchard('Orchard Frutales', 'Orchard Frutales', 'Nuevo Toluca');

-- Actualización de datos en ventas

EXECUTE update_apple_orchard_sale(RAW('26CC4BC7800F02DAE063040012ACA735'), DATE '2024-11-01', 325.00, 155);
EXECUTE update_apple_orchard_sale(RAW('26CC4BCAC5AD02D3E063030012AC3062'), DATE '2024-11-03', 345.00, 185);
EXECUTE update_apple_orchard_sale(RAW('26CC4BC9449E02D9E063020012AC728E'), DATE '2024-11-05', 355.00, 125);
EXECUTE update_apple_orchard_sale(RAW('26CC4BCAC5AE02D3E063030012AC3062'), DATE '2024-11-07', 315.00, 205);
EXECUTE update_apple_orchard_sale(RAW('26CC4BC944A002D9E063020012AC728E'), DATE '2024-11-09', 335.00, 175);
