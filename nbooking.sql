-- https://pgexercises.com/questions/aggregates/nbooking.html
with booking as (Select m.surname, m.firstname, m.memid, b.starttime,
ROW_NUMBER() Over(Partition by m.memid order by m.memid asc) as "row_num" from cd.members m inner join cd.bookings b
on m.memid = b.memid where b.starttime >= '2012-09-01 00:00:00' order by m.memid)

Select surname, firstname, memid, starttime from booking where row_num=1;
