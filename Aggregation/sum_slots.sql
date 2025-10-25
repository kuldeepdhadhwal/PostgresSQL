Select facid, sum(slots) from cd.bookings group by facid
	having sum(slots) = (Select max(total) from (Select sum(slots) as total from cd.bookings group by facid) As d);
