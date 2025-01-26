SELECT
    tz."Zone" AS pickup_zone,
    SUM(gt."total_amount") AS total_revenue
FROM
    green_tripdata_2019_10 gt
JOIN
    taxi_zones tz
ON
    gt."PULocationID" = tz."LocationID"
WHERE
    DATE(gt."lpep_pickup_datetime") = '2019-10-18'
GROUP BY
    tz."Zone"
HAVING
    SUM(gt."total_amount") > 13000
ORDER BY
    total_revenue DESC
LIMIT 3;
