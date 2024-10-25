select s.user_id, 
    round(coalesce(sum(c.action='confirmed')/count(*), 0), 2) confirmation_rate
from Signups s
left join Confirmations c on s.user_id = c.user_id
group by s.user_id;