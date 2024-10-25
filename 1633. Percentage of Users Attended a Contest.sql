select contest_id, round(count(distinct user_id)/(
    select count(distinct user_id)
    from Users
)*100, 2) percentage
from Register
group by contest_id
order by percentage desc, contest_id;