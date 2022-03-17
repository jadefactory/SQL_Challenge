-- [ Question ]
-- Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.
-- Note: Print NULL when there are no more names corresponding to an occupation.

select min(case when A.OCCUPATION = 'Doctor' then name else null end) as Doctor,
       min(case when A.OCCUPATION = 'Professor' then name else null end) as Professor,
       min(case when A.OCCUPATION = 'Singer' then name else null end) as Singer,
       min(case when A.OCCUPATION = 'Actor' then name else null end) as Actor
from (
    select name, occupation, rank() over(partition by occupation order by name asc) as name_order
    from OCCUPATIONS
) as A
group by A.name_order

-- https://www.hackerrank.com/challenges/occupations/problem?isFullScreen=true