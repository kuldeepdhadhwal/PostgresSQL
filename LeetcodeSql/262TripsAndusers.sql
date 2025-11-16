-- # Write your MySQL query statement below
Select  t.request_at as Day,
    round(count(case when t.status <> 'completed' then 1.0 else null end)/count(t.request_at),2) as 'Cancellation Rate' from 
    Trips t inner join Users u on t.client_id = u.users_id
    inner join Users d on t.driver_id = d.users_id where u.banned='No' and d.banned='No'
    and t.request_at between '2013-10-01' and '2013-10-03' group by request_at order by request_at asc;
