-- https://pgexercises.com/questions/updates/updatecalculated.html
Update cd.facilities 
	set membercost = Round((membercost*.10 + membercost),1),
		guestcost = Round((guestcost*.10 + guestcost),1)
	where name like 'Tennis Court 2';
