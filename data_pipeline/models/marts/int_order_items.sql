select 
line_items.order_item_key,
line_items.part_key,
line_items.line_number,
line_items.extended_price,
orders.order_key,
orders.customer_key,
orders.order_date,
{{discounted_amount('line_items.extended_price', 'line_items.discount') }} as discounted_price,
from {{ ref('stg_tcph_line_items') }} as line_items
 join {{ ref('stg_tpch_orders') }} as orders
on line_items.order_key = orders.order_key
order by orders.order_date 
