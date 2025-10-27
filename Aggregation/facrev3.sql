-- https://pgexercises.com/questions/aggregates/facrev3.html
Select name, rank from (Select name, facid, sum(total_cost), rank() over(order by sum(total_cost) desc) as rank from (Select f.name, b.facid, case 
			when b.memid = 0 then (b.slots*f.guestcost)
			else
			(b.slots*f.membercost)
			End as total_cost
						from cd.bookings b inner join cd.facilities f on b.facid = f.facid)
						group by name, facid) where rank <=3;
