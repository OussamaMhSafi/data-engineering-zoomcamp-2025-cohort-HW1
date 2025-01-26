WITH trips_with_pickup_zone AS (
    SELECT
        gt."DOLocationID",
        tz_pickup."Zone" AS pickup_zone,
        tz_dropoff."Zone" AS dropoff_zone,
        gt."tip_amount"
    FROM
        green_tripdata_2019_10 gt
    JOIN
        taxi_zones tz_pickup ON gt."PULocationID" = tz_pickup."LocationID"
    JOIN
        taxi_zones tz_dropoff ON gt."DOLocationID" = tz_dropoff."LocationID"
    WHERE
        tz_pickup."Zone" = 'East Harlem North'
)
SELECT
    dropoff_zone,
    MAX(tip_amount) AS largest_tip
FROM
    trips_with_pickup_zone
GROUP BY
    dropoff_zone
ORDER BY
    largest_tip DESC
LIMIT 1;
