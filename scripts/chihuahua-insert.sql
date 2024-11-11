insert into apple_orchard_sales (
   orchard_name,
   sale_date,
   price,
   quantity_sold,
   location,
   city
) values ( 'El Sol Orchard',
           to_date('2024-10-01','YYYY-MM-DD'),
           300.50,
           150,
           'Valle de Bravo',
           'Chihuahua' ),( 'La Amistad Orchard',
                           to_date('2024-10-07','YYYY-MM-DD'),
                           310.25,
                           180,
                           'Guanajuato',
                           'Chihuahua' );
commit;