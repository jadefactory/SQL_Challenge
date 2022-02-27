-- [ Question ]
-- Consider P1(a,c) and P2(b,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
-- Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits

/*
a = min(LAT_N)
b = max(LAT_N)
c = min(LONG_W)
d = max(LONG_W)

sqrt((a-b)^2 + (c-d)^2)
*/

select round(sqrt(power(min(LAT_N) - max(LAT_N),2) + power(min(LONG_W) - max(LONG_W),2)),4)
from STATION