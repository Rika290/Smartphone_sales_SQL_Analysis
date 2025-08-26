-- D. Feature based Analysis 

-- 1. Phones with at least 8 GB RAM and 128 GB storage
select brand, model, memory, storage, selling_price, rating 
from sales 
where memory ='8 GB' and storage ='128 GB';
-- no.of phones
with list as (select brand, model, memory, storage, selling_price, rating 
from sales 
where memory ='8 GB' and storage ='128 GB')
select count(*)as total from list;
-- 2. Avg price by storage 
select brand, storage, round(avg(selling_price),2) as avg_price
from sales
group by brand, storage
order by avg_price desc;

-- 3. Phone rating based on camera existence  
select Camera, ROUND(avg(Selling_Price), 2) as avg_price
from sales
group by Camera;
