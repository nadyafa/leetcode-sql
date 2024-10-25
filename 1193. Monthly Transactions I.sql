select 
    date_format(trans_date, '%Y-%m') month, 
    country, count(id) trans_count,
    count(case when state = 'approved' then 1 end) approved_count,
    sum(amount) trans_total_amount,
    sum(case when state = 'approved' then amount else 0 end) approved_total_amount
from Transactions
group by month, country;