Select  distinct(m.firstname) as firstname, m.surname from cd.members m join cd.members c on m.memid = c.recommendedby order by surname,firstname;
