# Write your MySQL query statement below
-- Select player_id,event_date, dense_rank() over(Order by player_id) as upd_rank from Activity;

Select player_id, min(event_date) as first_login from Activity group by player_id;
