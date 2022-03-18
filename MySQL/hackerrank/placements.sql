-- [ Question ]
-- Write a query to output the names of those students whose best friends got offered a higher salary than them. 
-- Names must be ordered by the salary amount offered to the best friends. 
-- It is guaranteed that no two students got same salary offer.

with db as (
    select S.ID, S.Name as S_Name,
           P.Salary as P_Salary,
           F.Friend_ID,
           tbl.bf_Salary as BF_Salary
    from Students S
    join Friends F on F.ID = S.ID
    join Packages P on P.ID = F.ID
    join (
        select F.Friend_ID as bf_ID, P.Salary as bf_Salary
        from Friends F
        join Packages P on P.ID = F.Friend_ID
    ) as tbl on tbl.bf_ID = F.Friend_ID
)
select S_Name
from db
where P_Salary < BF_Salary
order by BF_Salary asc

-- https://www.hackerrank.com/challenges/placements/problem?isFullScreen=true