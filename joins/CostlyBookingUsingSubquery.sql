-- https://pgexercises.com/questions/joins/tjsub.html
Select member, name, cost from (select mems.firstname || ' '|| mems.surname as member, facs.name,
	case 
		when mems.memid = 0 then
			book.slots * facs.guestcost
		else
			book.slots * facs.membercost
	end as cost
	
	from 
		cd.members 
			mems inner join cd.bookings book 
				on mems.memid = book.memid
			inner join cd.facilities  facs 
				on book.facid = facs.facid
	
	where (
	  book.starttime between '2012-09-14' and '2012-09-15')) as booking
	  
	  where cost > 30 order by cost desc;
								
	
