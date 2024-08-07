select 
  orders.orders_id,
  orders.date_date,
  round(orders.margin + ship.shipping_fee - (ship.log_cost + ship.ship_cost),2) as operational_margin,
  orders.quantity,
  orders.revenue,
  orders.purchase_cost,
  margin,
  ship.shipping_fee,
  ship.log_cost,
  ship.ship_cost,
from {{ ref('int_orders_margin') }} orders
left join {{ ref('stg_raw__ship') }} ship
using (orders_id)
order by orders_id desc