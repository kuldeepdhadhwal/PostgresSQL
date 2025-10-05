-- https://pgexercises.com/questions/aggregates/count3.html
Select recommendedby, count(*) from cd.members
	where recommendedby is not null
	group by recommendedby
order by recommendedby;
