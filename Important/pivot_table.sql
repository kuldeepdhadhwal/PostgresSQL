create table emp_compensation (
emp_id int,
salary_component_type varchar(20),
val int
);

insert into emp_compensation
values (1,'salary',10000),(1,'bonus',5000),(1,'hike_percent',10)
, (2,'salary',15000),(2,'bonus',7000),(2,'hike_percent',8)
, (3,'salary',12000),(3,'bonus',6000),(3,'hike_percent',7);

select * from emp_compensation;

Select emp_id, 
  sum(Case when salary_component_type = 'salary' then val End) as Salary,
  sum(Case when salary_component_type = 'bonus' then val End) as Bonus,
  sum(Case when salary_component_type = 'hike_percent' then val End) as hike_percent

from emp_compensation
Group by emp_id;


-- Input ----
+--------+-----------------------+-------+
| emp_id | salary_component_type | val   |
+--------+-----------------------+-------+
|      1 | salary                | 10000 |
|      1 | bonus                 |  5000 |
|      1 | hike_percent          |    10 |
|      2 | salary                | 15000 |
|      2 | bonus                 |  7000 |
|      2 | hike_percent          |     8 |
|      3 | salary                | 12000 |
|      3 | bonus                 |  6000 |
|      3 | hike_percent          |     7 |
+--------+-----------------------+-------+

  -- Output --
+--------+--------+-------+--------------+
| emp_id | Salary | Bonus | hike_percent |
+--------+--------+-------+--------------+
|      1 |  10000 |  5000 |           10 |
|      2 |  15000 |  7000 |            8 |
|      3 |  12000 |  6000 |            7 |
+--------+--------+-------+--------------+
