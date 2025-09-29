-- https://pgexercises.com/questions/joins/sub.html
Select distinct mems.firstname || ' ' || mems.surname as member,
	    (Select recs.firstname || ' ' || recs.surname as recommender from cd.members  as recs
		where recs.memid = mems.recommendedby)  from cd.members mems
		order by member;
