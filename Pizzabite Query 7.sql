-- Determine the distribution of orders by hour of the day.

select 
	extract(hour from time) as hour , count (order_id) as orders
	from orders
	group by hour;