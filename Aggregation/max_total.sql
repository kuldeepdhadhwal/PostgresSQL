with booking as (Select facid, sum(slots) as "total" from cd.bookings group by facid)

select facid, total from booking where total = (select max(total) as "total" from booking);
