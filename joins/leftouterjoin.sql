Select m1.firstname as memfname, m1.surname as memsname, m2.firstname as recfname, m2.surname as recsname from cd.members m1
	left outer join cd.members m2
	on m2.memid = m1.recommendedby
	order by memsname,memfname;
