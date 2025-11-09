Select GOLD, count(1) from events
where GOLD not in (Select SILVER from events union ALL SELECt BRONZE from events) group by GOLD;
