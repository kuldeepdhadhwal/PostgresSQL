with booking as (Select facid, sum(slots) as "total" from cd.bookings group by facid)

select facid, total from booking where total = (select max(total) as "total" from booking);

_________________________________________________________________________________________________

Select facid, total from (Select facid, total, rank() over(order by total desc) as rank from (
  select facid, sum(slots) as "total" from cd.bookings group by facid)) where rank = 1;
