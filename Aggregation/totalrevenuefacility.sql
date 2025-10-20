-- https://pgexercises.com/questions/aggregates/facrev.html
select facs.name, sum(slots * case
			when memid = 0 then facs.guestcost
			else facs.membercost
		end) as revenue
	from cd.bookings bks
	inner join cd.facilities facs
		on bks.facid = facs.facid
	group by facs.name
order by revenue;

-- The only real complexity in this query is that guests (member ID 0) have a different cost to everyone else.
-- We use a case statement to produce the cost for each session, and then sum each of those sessions, grouped by facility.
