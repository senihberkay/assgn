-- A report on whether customers who purchased the product named 
-- '2TB Red 5400 rpm SATA III 3.5 Internal NAS HDD' buy the products below or not



SELECT 
	Purchased_table.*,

	ISNULL(NULLIF(ISNULL(STR(First_product.customer_id), 'No'), STR(First_product.customer_id)), 'Yes') First_product,
	ISNULL(NULLIF(ISNULL(STR(Second_product.customer_id), 'No'), STR(Second_product.customer_id)), 'Yes') Second_product,
	ISNULL(NULLIF(ISNULL(STR(Third_product.customer_id), 'No'), STR(Third_product.customer_id)), 'Yes') Third_product

FROM
(
SELECT DISTINCT A.customer_id,
A.first_name,
A.last_name
FROM sale.customer A
inner join  sale.orders B
on A.customer_id = B.customer_id
inner join sale.order_item C
on B.order_id = C.order_id
inner join product.product D
on C.product_id = D.product_id
where D.product_name = '2TB Red 5400 rpm SATA III 3.5 Internal NAS HDD'
) AS Purchased_table

left join
(
select distinct A.customer_id,
A.first_name,
A.last_name
from sale.customer A
inner join  sale.orders B
on A.customer_id = B.customer_id
inner join sale.order_item C
on B.order_id = C.order_id
inner join product.product D
on C.product_id = D.product_id
where D.product_name = 'Polk Audio - 50 W Woofer - Black'
) AS First_product
on Purchased_table.customer_id = First_product.customer_id

left join
(
select distinct A.customer_id,
A.first_name,
A.last_name
from sale.customer A
inner join  sale.orders B
on A.customer_id = B.customer_id
inner join sale.order_item C
on B.order_id = C.order_id
inner join product.product D
on C.product_id = D.product_id
where D.product_name = 'SB-2000 12 500W Subwoofer (Piano Gloss Black)'
) AS Second_product
on Purchased_table.customer_id = Second_product.customer_id

left join
(
select distinct A.customer_id,
A.first_name,
A.last_name
from sale.customer A
inner join  sale.orders B
on A.customer_id = B.customer_id
inner join sale.order_item C
on B.order_id = C.order_id
inner join product.product D
on C.product_id = D.product_id
where D.product_name = 'Virtually Invisible 891 In-Wall Speakers (Pair)'
) AS Third_product
on Purchased_table.customer_id = Third_product.customer_id