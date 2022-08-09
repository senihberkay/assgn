-- discount effects on whether the increase in the discount rate 
-- positively impacts the number of orders for the products


with t1 as
(
select product_id, sum(quantity) sum_quantity,
		lead(sum(quantity)) over(partition by product_id order by discount) as lead1
from sale.order_item
group by product_id, discount
),
t2 as
(
select product_id, sum_quantity, lead1,
	case	
		when lead1 > sum_quantity then 1
		when lead1 < sum_quantity then -1
		when lead1 = sum_quantity then 0
	end as effect
from t1
)
select product_id,
	case
		when sum(effect) > 0 then 'Positive'
		when sum(effect) < 0 then 'Negative'
		else 'Neutral'
	end as Discount_Effect
from t2
group by product_id



