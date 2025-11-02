-- # Write your MySQL query statement below
Select c.customer_id, count(c.customer_id) as count_no_trans from (Select v.visit_id, v.customer_id, t.transaction_id from Visits v left join Transactions t  on  v.visit_id = t.visit_id 
where t.transaction_id is null) c group by customer_id;
