with my_table as (
Select Team_1, total_matches, 
  case 
    when win_count is Null 
    then 0 
    else win_count
    End as win_count from (
Select t1.Team_1, t1.total_matches, t2.win_count from (
SELECT e.Team_1, COUNT(*) as total_matches FROM (SELECT Team_1 from icc_world_cup

UNION all

SELECT Team_2 from icc_world_cup ) e
GROUP BY Team_1)  t1 
 left join (

SELECT Winner, Count(Winner) as win_count FROM  icc_world_cup group by Winner)  t2 
on t1.Team_1 = t2.Winner) t
)

Select Team_1 as team_name, total_matches as no_of_matches_played,
    win_count as no_of_matches_won,
    (total_matches - win_count) as no_of_losses from my_table
order by no_of_matches_won desc,team_name desc, no_of_losses asc
;


Output:

+--------+---------------+-----------+--------------+
| Team_1 | total_matches | win_count | no_of_losses |
+--------+---------------+-----------+--------------+
| India  |             2 |         2 |            0 |
| SL     |             2 |         0 |            2 |
| SA     |             1 |         0 |            1 |
| Eng    |             2 |         1 |            1 |
| Aus    |             2 |         1 |            1 |
| NZ     |             1 |         1 |            0 |
+--------+---------------+-----------+--------------+
