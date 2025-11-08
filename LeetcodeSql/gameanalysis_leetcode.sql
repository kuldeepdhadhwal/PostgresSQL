https://leetcode.com/problems/game-play-analysis-iv/description/
-- # Write your MySQL query statement below
With custom_query as (Select customer_number, count(customer_number) as count_number from Orders group by customer_number)

Select customer_number from custom_query where count_number = (Select max(count_number) from custom_query);


select customer_number from orders
group by customer_number
order by count(*)desc
limit 1;
