-- https://pgexercises.com/questions/aggregates/fachoursbymonth3.html
With booking as  (Select facid, Extract(month from starttime) as month, sum(slots) as slots from cd.bookings
where Extract(year from starttime) = 2012 group by month, facid order by facid, month, slots)

Select facid, month, slots from booking

union all

Select facid, null , sum(slots) from booking group by facid

union all

Select null, null, sum(slots) from booking order by facid, month;
