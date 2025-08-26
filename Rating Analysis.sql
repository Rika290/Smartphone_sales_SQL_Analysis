-- C. Analysis on rating

-- 1. Average rating per brand
select brand, round(avg(rating),2) as avg_rating 
from sales
group by brand
order by avg_rating desc;
-- 2. 10 highest ratings on models and brands
select brand, model, round(avg(rating),2) as avg
from sales
group by brand, model
order by avg desc
limit 10;
-- 3. 10 lowest ratings on models and brands
select brand, model, round(avg(rating),2) as avg
from sales
group by brand, model
order by avg 
limit 10;
