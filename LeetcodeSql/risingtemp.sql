-- # Write your MySQL query statement below

with WeatherTable as  (Select id, temperature, lag(temperature) over( order by id) as prev_temp,
    (case when (lag(temperature) over( order by id)) > temperature then 'greater'
        else 'less' End) as weather
 from Weather)

 Select id from WeatherTable where id !=1 and weather = 'less';



-- # Write your MySQL query statement below
SELECT w1.id
FROM Weather w1
JOIN Weather w2
  ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
 AND w1.temperature > w2.temperature;
