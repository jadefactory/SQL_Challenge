-- Q2. 2020년 7월의 MAU를 구해주세요.
-- MAU는 Monthly Active User의 줄임말로, 월간 활성 이용자 수를 의미함
-- '활성 이용자'의 정의는 조직마다 다를 수 있지만, 여기서는 1회 이상 방문한 사람을 활성 이용자로 간주함

select count(distinct customer_id) as MAU
from tbl_visit
where visited_at >= '2020-07-01'
  and visited_at < '2020-08-01';