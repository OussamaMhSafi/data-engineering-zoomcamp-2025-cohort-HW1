WITH daily_longest_trip AS (
    SELECT
        DATE(lpep_pickup_datetime) AS pickup_day,
        MAX(Trip_distance) AS longest_trip_distance
    FROM
        green_tripdata_2019_10
    GROUP BY
        DATE(lpep_pickup_datetime)
)
SELECT
    pickup_day
FROM
    daily_longest_trip
WHERE
    longest_trip_distance = (SELECT MAX(longest_trip_distance) FROM daily_longest_trip);
