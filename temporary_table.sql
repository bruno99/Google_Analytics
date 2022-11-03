WITH
   longest_used_bike AS (
     SELECT 
        bikeid,
        SUM(duration_minutes) AS trip_duration
     FROM
        `bigquery-public-data.austin_bikeshare_trips`
     GROUP BY
        bikeid
     ORDER BY
        trip_duration DESC
     LIMIT 1
   )

SELECT 
   trips.start_station_id,
   COUNT(*) AS trip_ct
 FROM 
  longest_used_bike AS longest
 INNER JOIN
  `bigquery-public-data.austin_bikeshare_trips`AS trips
 ON longest.bikeid = trips.bikeid
 GROUP BY
   trips.start_station_id
 LIMIT 1
