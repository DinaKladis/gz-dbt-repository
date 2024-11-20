select 
  date_date,
  count(orders_id) as nb_transactions,
  round(sum(revenue)) as revenue,
  round(safe_divide(sum(revenue), count(orders_id)),1) as average_basket,
  round(sum(margin)) as margin,
  round(sum(operational_margin)) as operational_margin,
  round(sum(purchase_cost),0) as purchase_cost, 
  round(sum(shipping_fee),0) as shipping_fee,
  round(sum(log_cost),0) as log_cost,
  round(sum(ship_cost),0) as ship_cost,
  sum(quantity) as quantity 
from {{ ref('int_orders_operational') }}
group by date_date
order by date_date desc