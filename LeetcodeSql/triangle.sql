# Write your MySQL query statement below
-- a + b > c; b + c > a; a + c > b

Select x,y,z, case when (( x+ y > z) and ( y+ z > x ) and ( x + z > y )) then 'Yes'
                   else 'No' end as triangle from Triangle;


select *, if(x+y>z and y+z>x and x+z>y, "Yes","No") as triangle from triangle
