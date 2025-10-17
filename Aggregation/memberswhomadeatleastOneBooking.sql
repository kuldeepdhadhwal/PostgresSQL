-- Find the total number of members (including guests) who have made at least one booking.


Select count(distinct memid) from cd.bookings ;

select count(*) from 
	(select distinct memid from cd.bookings) as mems
