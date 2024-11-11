insert into apple_orchard_sales (
   orchard_name,
   sale_date,
   price,
   quantity_sold,
   location,
   city
) values ( 'La Esperanza Orchard',
           to_date('2024-10-05','YYYY-MM-DD'),
           320.00,
           120,
           'Querétaro',
           'Cuauhtémoc' );

commit;