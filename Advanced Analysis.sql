-- E. Advanced analysis

-- 1. Brands and discounts
select brand, round(avg(discount),2) as avg_discount
from sales
group by brand
order by avg_discount desc;
-- 2. Relationship between brands and price and rating
select brand, round(avg(Selling_Price), 2) as avg_price,
round(AVG(Rating), 2) as avg_rating
from sales
group by brand
order by avg_price desc;
-- 3. Ranking models based on selling price 
with rk_brands as (select brand, model, sum(selling_price) as revenue, rank()over(partition by brand order by sum(selling_price) desc) as ranked_brand
from sales 
group by brand, model)
select brand, model 
from rk_brands
where ranked_brand <=3;
-- 4. Discount percentage and ratings
select case when discount_percentage > 10 then 'high_discount_percentage' else 'low_discount_percentage' 
end as discount_level, round(avg(rating),2) as avg_rating
from sales 
group by discount_level
order by avg_rating desc;
-- 5. Phone categories based on price
-- 5.a) Price range
select brand, min(selling_price) as min_price, max(selling_price) as max_price 
from sales
group by brand
order by max_price desc;
-- 5.b) Phone price categories
select brand, model, selling_price,
case when selling_price < 25000 then 'Low_Budget'
when selling_price between 25000 and 80000 then 'Mid_Budget'
else 'High_Budget' end as budget_category
from sales
order by selling_price desc;
-- 6. Highest phone brand
select brand, model, rating
from sales s1
where rating = (select max(rating) 
from sales 
where brand=s1.brand);
-- 7. Phones above avg_price
select brand, model, selling_price
from sales 
where selling_price > (
select avg(selling_price) as avg_sp 
from sales);
-- 8. Comparing phone brand with it's average rating
select brand, model, rating,
(select round(avg(rating),2) from sales s1
where s1.brand=s2.brand)as brand_avg_rating
from sales s2;
