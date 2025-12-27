create table entries ( 
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(10));

insert into entries 
values ('A','Bangalore','A@gmail.com',1,'CPU'),('A','Bangalore','A1@gmail.com',1,'CPU'),('A','Bangalore','A2@gmail.com',2,'DESKTOP')
,('B','Bangalore','B@gmail.com',2,'DESKTOP'),('B','Bangalore','B1@gmail.com',2,'DESKTOP'),('B','Bangalore','B2@gmail.com',1,'MONITOR');

Select * from entries;

With ranked_floor AS (
  Select name, floor, count(*) as floor_visited, dense_rank() over(partition by name order by count(1) desc) as most_visited
  from entries group by name, floor),
  

most_visited_floor AS (Select name, floor from ranked_floor where most_visited = 1),

total_number_visited_floor AS (Select name, count(*) as total_asset_count from entries group by name),

group_concated_resources AS ( SELECT name, GROUP_CONCAT(a.resources SEPARATOR ',') as resources_name from (Select distinct resources, name from entries) a GROUP BY name)


Select most_vf_tv.name, most_vf_tv.most_visited_floor, most_vf_tv.total_visits, gcr.resources_name  as used_resources from 
  (Select mvf.name, mvf.floor as most_visited_floor, tnvf.total_asset_count as total_visits  from most_visited_floor mvf 
    inner join total_number_visited_floor tnvf on mvf.name = tnvf.name) as most_vf_tv
    inner join group_concated_resources  as gcr on most_vf_tv.name = gcr.name ; 


-- Input Table
+------+-----------+--------------+-------+-----------+
| name | address   | email        | floor | resources |
+------+-----------+--------------+-------+-----------+
| A    | Bangalore | A@gmail.com  |     1 | CPU       |
| A    | Bangalore | A1@gmail.com |     1 | CPU       |
| A    | Bangalore | A2@gmail.com |     2 | DESKTOP   |
| B    | Bangalore | B@gmail.com  |     2 | DESKTOP   |
| B    | Bangalore | B1@gmail.com |     2 | DESKTOP   |
| B    | Bangalore | B2@gmail.com |     1 | MONITOR   |
+------+-----------+--------------+-------+-----------+

-- Output Table
+------+--------------------+--------------+-----------------+
| name | most_visited_floor | total_visits | used_resources  |
+------+--------------------+--------------+-----------------+
| A    |                  1 |            3 | CPU,DESKTOP     |
| B    |                  2 |            3 | DESKTOP,MONITOR |
+------+--------------------+--------------+-----------------+
