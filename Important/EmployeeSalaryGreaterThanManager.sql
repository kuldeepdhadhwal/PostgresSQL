create table emp(emp_id int,emp_name varchar(10),salary int ,manager_id int);

insert into emp values(1,'Ankit',10000,4);
insert into emp values(2,'Mohit',15000,5);
insert into emp values(3,'Vikas',10000,4);
insert into emp values(4,'Rohit',5000,2);
insert into emp values(5,'Mudit',12000,6);
insert into emp values(6,'Agam',12000,2);
insert into emp values(7,'Sanjay',9000,2);
insert into emp values(8,'Ashish',5000,2);

select * from emp;

SELECT 
    emp1.emp_id, emp1.emp_name, manage.emp_name as manager_name, emp1.salary,   manage.salary as manager_salary
FROM emp emp1
    INNER JOIN 
    emp manage
ON
    emp1.manager_id = manage.emp_id
WHERE 
    emp1.salary > manage.salary order by emp1.emp_id;


---emp table ----
+--------+----------+--------+------------+
| emp_id | emp_name | salary | manager_id |
+--------+----------+--------+------------+
|      1 | Ankit    |  10000 |          4 |
|      2 | Mohit    |  15000 |          5 |
|      3 | Vikas    |  10000 |          4 |
|      4 | Rohit    |   5000 |          2 |
|      5 | Mudit    |  12000 |          6 |
|      6 | Agam     |  12000 |          2 |
|      7 | Sanjay   |   9000 |          2 |
|      8 | Ashish   |   5000 |          2 |
+--------+----------+--------+------------+

--- output table----
+--------+----------+--------------+--------+----------------+
| emp_id | emp_name | manager_name | salary | manager_salary |
+--------+----------+--------------+--------+----------------+
|      1 | Ankit    | Rohit        |  10000 |           5000 |
|      2 | Mohit    | Mudit        |  15000 |          12000 |
|      3 | Vikas    | Rohit        |  10000 |           5000 |
+--------+----------+--------------+--------+----------------+
