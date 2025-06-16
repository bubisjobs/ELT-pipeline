select
orders.*,
order_items_summary.total_extended_price,
order_items_summary.total_discounted_price,
from {{ ref('int_order_items_summary') }} as order_items_summary
join 
{{ ref('stg_tpch_orders') }} as orders
on order_items_summary.order_key = orders.order_key
order by orders.order_date