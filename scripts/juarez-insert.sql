insert into apple_orchard_sales (
   orchard_name,
   sale_date,
   price,
   quantity_sold,
   location,
   city
) values ( 'Los Pinos Orchard',
           to_date('2024-10-03','YYYY-MM-DD'),
           280.75,
           200,
           'San Miguel de Allende',
           'Juárez' ),( 'El Rincón Orchard',
                        to_date('2024-10-10','YYYY-MM-DD'),
                        290.60,
                        160,
                        'Morelia',
                        'Juárez' );

commit;