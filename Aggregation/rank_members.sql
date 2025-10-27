-- https://pgexercises.com/questions/aggregates/rankmembers.html
Select firstname, surname, hours, rank() over(order by hours desc ) as "rank" from (Select m.firstname, m.surname, b.memid, ((sum(b.slots)+10)/20)*10 as "hours" from cd.members m 
	inner join cd.bookings b on m.memid = b.memid
	group by b.memid, m.firstname, m.surname) order by rank, surname, firstname;

---- to round of instead of doing calculation we can add round(sum(b.slots), -1) it will produce the same results
----- also why we have used +10 and divide by 20 is because slots were 30 minutes.
