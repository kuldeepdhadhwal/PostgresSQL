# Write your MySQL query statement below
       Select e.name, e.bonus from
        (Select    
            e.empId,
            e.name,
            b.bonus
            from Bonus b right join Employee e
            on b.empId = e.empId ) e
        left join  bonus bb
        on e.empId = bb.empId
        where e.bonus is null or e.bonus < 1000;
