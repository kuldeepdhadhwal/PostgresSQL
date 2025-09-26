-- How can you produce a list of the start times for bookings by members named 'David Farrell'?
select b.starttime from cd.members m inner join cd.bookings b on m.memid = b.memid where m.firstname='David' and m.surname='Farrell';
