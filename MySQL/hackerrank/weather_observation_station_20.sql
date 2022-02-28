-- [ Question ]
-- A median is defined as a number separating the higher half of a data set from the lower half. 
-- Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.

select round(LAT_N, 4)
from (
    select LAT_N, percent_rank() over (order by LAT_N) as percent
    from STATION
) as db
where percent = 0.5

-- https://www.hackerrank.com/challenges/weather-observation-station-20/problem?isFullScreen=true