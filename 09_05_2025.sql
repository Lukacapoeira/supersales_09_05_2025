-- 🧮 SQL Task: Products with above-average revenue in their product group

-- Goal:
-- For each product group, calculate average revenue (quantity × price)
-- and return only those products whose revenue is higher than the group average.
select * 
from
(select 
	sells.product_group
	,sells.category
	,sells.product_id
	,sells.product_price
	,sells.revenue 
	,round(avg(sells.revenue) over (partition by sells.product_group),2) as avg_group_revenue
from 
(select 
	pg.product_group
	,pg.category
	,p.product_id
	,p.product_price
	,sum(op.item_quantity)
	,round(p.product_price * sum(op.item_quantity),2)as revenue
from product_groups pg 
	left join products p on p.group_id = pg.group_id
	left join order_positions op on p.product_id = op.product_id
	group by 1,2,3,4) as sells )
	as ranked
where ranked.revenue > avg_group_revenue 