Delete from cd.members where memid not in (Select memid from cd.bookings);
