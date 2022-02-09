-- Q7. 2020년 7월의 평균 WAU를 구해주세요.
select avg(WAU)
from (
	select date_format(visited_at - interval 9 hour, '%U') as week,
		   count(distinct customer_id) as WAU
	from tbl_visit
	where visited_at >= '2020-07-05' and visited_at < '2020-07-26'
	group by 1
) as db;

-- 7월 첫째 주와 다섯째 주에는 각각 6월 마지막 주와 8월 첫째 주의 값이 섞여있기 때문에 해당 구간을 제외하고 계산함 