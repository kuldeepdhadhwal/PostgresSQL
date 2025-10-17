Select facid, sum(slots) from cd.bookings group by facid having sum(slots) > 1000 order by facid;


-- It turns out that there's actually an SQL keyword designed to help with the filtering of output from aggregate functions. This keyword is HAVING.

-- The behaviour of HAVING is easily confused with that of WHERE. 
-- The best way to think about it is that in the context of a query with an aggregate function, WHERE is used to filter what data gets input into the aggregate function, while HAVING is used to filter the data once it is output from the function. Try experimenting to explore this difference!
