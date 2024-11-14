CREATE OR REPLACE VIEW orchard_sales_summary AS
   SELECT o.orchard_name,
          o.location,
          COUNT(s.sale_id) AS total_sales,
          SUM(s.quantity_sold) AS total_quantity_sold,
          SUM(s.price * s.quantity_sold) AS total_revenue
     FROM apple_orchards o
     JOIN (
      SELECT *
        FROM sales_chihuahua
      UNION ALL
      SELECT *
        FROM sales_juarez
      UNION ALL
      SELECT *
        FROM sales_cuauhtemoc
   ) s
   ON o.orchard_name = s.orchard_name
    GROUP BY o.orchard_name,
             o.location;