-- [ Question ]
-- Write a query to print the hacker_id, name, and the total number of challenges created by each student. 
-- Sort your results by the total number of challenges in descending order. 
-- If more than one student created the same number of challenges, then sort the result by hacker_id. 
-- If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

select H.hacker_id, H.name, C.total_number
from Hackers H
join (
    select hacker_id, count(challenge_id) as total_number
    from Challenges
    group by 1
) as C on C.hacker_id = H.hacker_id
where C.total_number = 50 or 
      C.total_number in (
          select total_number
          from (
                select hacker_id, count(challenge_id) as total_number
                from Challenges
                group by 1
          ) as tbl
          group by total_number
          having count(hacker_id) = 1
      )
order by C.total_number desc, H.hacker_id asc

-- https://www.hackerrank.com/challenges/challenges/problem?isFullScreen=true