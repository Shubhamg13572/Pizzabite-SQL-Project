-- Calculate the percentage contribution of each pizza type to total revenue.

select 
	pizza_types.category, 
	round(sum(order_details.quantity * pizzas.price :: numeric) / (select
	sum(order_details.quantity * pizzas.price::numeric) as total_sales
from
order_details join pizzas
on
pizzas.pizza_id = order_details.pizza_id)* 100,2) || '%' as percentage_contribution
from
    pizza_types join pizzas
on
   pizzas.pizza_type_id = pizza_types.pizza_type_id
join
    order_details
on
   order_details.pizza_id = pizzas.pizza_id
group by pizza_types.category
order by percentage_contribution desc;