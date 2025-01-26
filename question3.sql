SELECT
    SUM(CASE WHEN Trip_distance <= 1 THEN 1 ELSE 0 END) AS "Up to 1 mile",
    SUM(CASE WHEN Trip_distance > 1 AND Trip_distance <= 3 THEN 1 ELSE 0 END) AS "1 to 3 miles",
    SUM(CASE WHEN Trip_distance > 3 AND Trip_distance <= 7 THEN 1 ELSE 0 END) AS "3 to 7 miles",
    SUM(CASE WHEN Trip_distance > 7 AND Trip_distance <= 10 THEN 1 ELSE 0 END) AS "7 to 10 miles",
    SUM(CASE WHEN Trip_distance > 10 THEN 1 ELSE 0 END) AS "Over 10 miles"
FROM
    green_tripdata_2019_10
