Select make_timestamp(2012,08,31,01,00,00) as timestamp;

Select (make_timestamp(2012,08,31,01,00,00) - make_timestamp(2012,07,30,01,00,00)) as interval ; 

select generate_series(timestamp '2012-10-01', timestamp '2012-10-31', interval '1 day') as ts;     

-- extract the days
Select distinct Extract('day' from starttime) as date_part from cd.bookings where starttime > '2012-08-31 00:00:00' and 
starttime <= '2012-08-31 12:00:00'

-- trim 
select trim_scale(extract(epoch from (timestamp '2012-09-02 00:00:00' - '2012-08-31 01:00:00')))::int as int;

--  extract days from a month https://pgexercises.com/questions/date/daysinmonth.html
select 	extract(month from cal.month) as month,
	(cal.month + interval '1 month') - cal.month as length
	from
	(
		select generate_series(timestamp '2012-01-01', timestamp '2012-12-01', interval '1 month') as month
	) cal
order by month;
