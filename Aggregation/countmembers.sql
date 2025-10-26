Select count(*) over() as count, firstname, surname from cd.members;

-- Alternate way
with total_members as (Select count(*) as total_count from cd.members)
 
select total_count as "count", firstname, surname from cd.members cross join total_members;
