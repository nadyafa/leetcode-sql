select 
    query_name,
    round(sum(rating/position)/count(query_name), 2) quality,
    round(count(case when rating < 3 then 1 end)/count(query_name)*100, 2) poor_query_percentage
from Queries
where query_name is not null
group by query_name
order by query_name;