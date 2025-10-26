-- https://pgexercises.com/questions/aggregates/fachours3.html
Select b.facid, f.name,
				 cast(sum(b.slots)/2.0 As Numeric(10,2)) as "hours" from cd.bookings b inner join cd.facilities f 
on b.facid = f.facid
group by b.facid, f.name order by b.facid;


-- CAST(SUM(b.slots) / 2.0 AS NUMERIC(10,2)) AS Hours
