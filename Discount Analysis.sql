-- B. Discount Analysis

-- 1. Avg discount percentage per brand
select brand, round(avg(discount_percentage),2) as avg_discount_percentage
from sales
group by brand
order by avg_discount_percentage desc;
-- 2. Phones with highest discount %
select brand, model, selling_price, original_price, discount_percentage 
from sales 
order by discount_percentage desc
limit 10;
-- 3. No.of phones sold with and without discounts
select case when discount >0 then 'discounted' else 'not discounted' end as discount_status, count(*) as no_of_phones
from sales
group by discount_status;
