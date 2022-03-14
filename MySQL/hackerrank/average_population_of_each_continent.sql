-- [ Question ]
-- Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

select co.Continent, floor(avg(ci.Population))
from CITY ci
join COUNTRY co on co.Code = ci.CountryCode
group by co.Continent

-- https://www.hackerrank.com/challenges/average-population-of-each-continent/problem?isFullScreen=true