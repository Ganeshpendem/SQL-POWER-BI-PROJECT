Select * from Pizza_sales

select sum(total_price) as Total_Revenue from Pizza_sales;

Select distinct count(order_id) as order_pizza from Pizza_sales;

select sum(total_price)/count (distinct order_id) as avg_order_value from pizza_sales;

select sum(quantity) as total_pizza_sold from pizza_sales;

select distinct count(Order_id) as total_orders from pizza_sales;



select cast(cast(sum(quantity) AS DECIMAL(10,2))/ cast(count(distinct order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) as avg_pizza_per_order from Pizza_sales

--Total orders by week
select datename(dw, order_date) as order_day, count(distinct order_id) as total_orders
from pizza_sales
group by  datename(dw, order_date)
order by total_orders desc;



--Total orders by month
select datename(Month, order_date) as order_month, count(distinct order_id) as total_orders
from pizza_sales
group by  datename(month, order_date)
order by total_orders desc;


--percentage of sales by pizza category
select pizza_category, sum(total_price) as total_sales, sum(total_price)*100/ 
(select sum(total_price) from pizza_sales where month(order_date)=1)  as percentage_of_sales 
from pizza_sales
--where month( order_date)=1
group by pizza_category;


--percentage of sales by pizza size
select pizza_size, cast(sum(total_price) as decimal (10,2)) as total_sales, cast(sum(total_price)*100/ 
(select sum(total_price) from pizza_sales) as decimal(10,2))  as percentage_of_sales 
from pizza_sales
group by pizza_size ;

 --top 5 pizzas respective to revenue
select top 5 pizza_name, cast(sum(total_price) as decimal(10,2)) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue desc;

--bottom 5 pizzas respective to revenue
select top 5 pizza_name, cast(sum(total_price) as decimal(10,2)) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue asc;

 --top 5 pizzas respective to Quantity
select top 5 pizza_name, cast(sum(quantity) as decimal(10,2)) as quantity from pizza_sales
group by pizza_name
order by quantity desc;

 --bottom 5 pizzas respective to Quantity
select top 5 pizza_name, cast(sum(quantity) as decimal(10,2)) as quantity from pizza_sales
group by pizza_name
order by quantity asc;


 --top 5 pizzas respective to orders
 select top 5 pizza_name, (count(distinct order_id)) as Total_orders from pizza_sales
group by pizza_name
order by Total_orders desc;

 --bottom 5 pizzas respective to orders
 select top 5 pizza_name, (count(distinct order_id)) as Total_orders from pizza_sales
group by pizza_name
order by Total_orders asc;






