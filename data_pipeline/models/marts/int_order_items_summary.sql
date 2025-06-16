select
order_key,
sum(extended_price) as total_extended_price,
sum(discounted_price) as total_discounted_price,
from {{ ref('int_order_items') }}
group by order_key