-- A. Basic Analysis:

-- 1. Total brand, model, no.of phones
select count(distinct brand) as brand, count(distinct model) as model, count(*)as total_phones from sales;
-- 2. No.of phones per brand
select brand, count(*) as total_sales from sales
group by brand
order by total_sales desc;
-- 3. Average selling price per brand
select brand, round(avg(selling_price),2) as avg_sp from sales
group by brand
order by avg_sp desc;
-- 4. Top 10 Brands
select distinct Brand, Model, Selling_Price
from sales
order by Selling_Price desc
limit 10;
