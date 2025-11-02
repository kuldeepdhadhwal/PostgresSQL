-- # Write your MySQL query statement below

with WeatherTable as  (Select id, temperature, lag(temperature) over( order by id) as prev_temp,
    (case when (lag(temperature) over( order by id)) > temperature then 'greater'
        else 'less' End) as weather
 from Weather)

 Select id from WeatherTable where id !=1 and weather = 'less';
