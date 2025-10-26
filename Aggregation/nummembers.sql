-- https://pgexercises.com/questions/aggregates/nummembers.html
Select row_number() over(order by joindate), firstname, surname from cd.members;
