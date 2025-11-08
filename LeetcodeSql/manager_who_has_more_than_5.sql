# Write your MySQL query statement below
Select name from (Select e1.id, e1.name, count(*) as current_count from Employee e1 inner join Employee e2 on e1.id = e2.managerId and e1.id != e2.id group by e1.id) c where current_count >=5;
