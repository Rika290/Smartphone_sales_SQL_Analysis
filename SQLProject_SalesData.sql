-- creating database:
create database smartphone_sales;
use smartphone_sales;
--
show tables;
-- adding a column ID to the sales table for better reference
alter table sales
add column ID int not null auto_increment primary key first;

-- displaying full table
select * from sales;