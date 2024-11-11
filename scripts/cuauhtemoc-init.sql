drop table if exists apple_orchard_sales;
create table apple_orchard_sales (
   id            int primary key,
   orchard_name  varchar(255) not null,
   sale_date     date not null,
   price         decimal(10,2) not null,
   quantity_sold int not null,
   location      varchar(255) not null,
   city          varchar(255) not null
);

drop sequence if exists apple_orchard_sales_seq;
create sequence apple_orchard_sales_seq start with 1 increment by 1;
create or replace trigger apple_orchard_sales_trigger before
   insert on apple_orchard_sales
   for each row
begin
   :new.id := apple_orchard_sales_seq.nextval;
end;
/