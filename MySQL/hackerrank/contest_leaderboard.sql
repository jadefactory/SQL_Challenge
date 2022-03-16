-- [ Question ]
-- The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. 
-- If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. 
-- Exclude all hackers with a total score of 0 from your result.

select H.hacker_id, H.name, tbl.total_score
from Hackers H
join (
    select hacker_id, sum(top_score) as total_score
    from (
        select hacker_id, challenge_id, max(score) as top_score
        from Submissions
        group by 1,2
    ) as db
    group by 1
) as tbl on tbl.hacker_id = H.hacker_id
where tbl.total_score != 0
order by tbl.total_score desc, H.hacker_id asc

-- https://www.hackerrank.com/challenges/contest-leaderboard/problem?isFullScreen=true