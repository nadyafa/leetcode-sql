select 
    round(count(case when fo.first_order = d.customer_pref_delivery_date then 1 end)/count(d.customer_id)*100, 2) immediate_percentage
from Delivery d
join (
    select 
    customer_id,
    min(order_date) first_order
    from Delivery
    group by customer_id
) fo
on d.order_date = fo.first_order
and d.customer_id = fo.customer_id;