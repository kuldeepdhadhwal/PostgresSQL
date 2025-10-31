Select make_timestamp(2012,08,31,01,00,00) as timestamp;

Select (make_timestamp(2012,08,31,01,00,00) - make_timestamp(2012,07,30,01,00,00)) as interval ; 

select generate_series(timestamp '2012-10-01', timestamp '2012-10-31', interval '1 day') as ts;     
