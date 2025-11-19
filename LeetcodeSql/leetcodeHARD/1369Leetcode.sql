CREATE TABLE UserActivity (
  username VARCHAR(30),
  activity VARCHAR(30),
  startdate date,
  enddate date
);

-- insert
INSERT INTO UserActivity VALUES ('Alice', 'Travel', '2020-02-12', '2020-02-12');
INSERT INTO UserActivity VALUES ('Alice', 'Dancing', '2020-02-21', '2020-02-23');
INSERT INTO UserActivity VALUES ('Alice', 'Travel', '2020-02-24', '2020-02-28');
INSERT INTO UserActivity VALUES ('Bob', 'Travel', '2020-02-11', '2020-02-18');

-- fetch

WITH cte AS (
  SELECT DISTINCT *
  FROM UserActivity
),
cte2 AS (
  SELECT *,
    RANK() OVER(PARTITION BY username ORDER BY enddate DESC) AS rnk,
    COUNT(*) OVER(PARTITION BY username) AS num_activity
FROM cte
)

SELECT username, activity, startdate, enddate
FROM cte2
WHERE (num_activity > 1 AND rnk=2) OR (num_activity=1 AND rnk=1)
;
