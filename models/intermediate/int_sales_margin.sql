select 
  products_id,
  date_date,
  orders_id,
  revenue,
  quantity,
  cast(purchase_price as float64) as purchase_price,
  round(quantity*cast(purchase_price as float64),2) as purchase_cost,
  round(revenue - round(quantity*cast(purchase_price as float64),2),2) as margin
from 
  {{ref('stg_raw__sales')}}
left join
  {{ref('stg_raw__product')}}
using (products_id)
