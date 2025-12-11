SELECT candidate_id FROM 
  (SELECT * FROM candidates where skill in ('Python', 'Tableau', 'PostgreSQL')) AS E
  GROUP BY candidate_id HAVING count(candidate_id)=3;
