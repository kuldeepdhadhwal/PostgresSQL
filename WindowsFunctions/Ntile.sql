-- https://pgexercises.com/questions/aggregates/classify.html

-- the NTILE window function. NTILE groups values into a passed-in number of groups, as evenly as possible. It outputs a number from 1->number of groups. We then use a CASE statement to turn that number into a label!
Select name, case when class =1 then 'high'
					when class = 2 then 'average'
					else 'low'
					end revenue from(
Select facs.name as name, ntile(3) over (order by sum(case
					when memid = 0 then slots * facs.guestcost
					else slots*membercost
				end) desc ) as class
				
			from cd.bookings bks
			inner join cd.facilities facs
					on bks.facid = facs.facid
			group by facs.name
		) as subq

order by class, name;
