-- Q11-1. 2020년 7월의 요일 및 시간대별 평균 Revenue를 구해주세요.
select yoil, timezone, avg(revenue)
from (
	select date_format(purchased_at - interval 9 hour, '%Y-%m-%d') as day,
		   date_format(purchased_at - interval 9 hour, '%W') as yoil,
		   date_format(purchased_at - interval 9 hour, '%H') as timezone,
		   sum(price) as revenue
	from tbl_purchase
    where purchased_at >= '2020-07-01' and purchased_at < '2020-08-01'
	group by 1,2,3
) as db
group by 1,2
order by 3 desc;


-- Q11-2. 2020년 7월의 요일 및 시간대별 평균 Active User 수를 구해주세요.

select yoil, timezone, avg(active_user)
from (
	select date_format(visited_at - interval 9 hour, '%Y-%m-%d') as day,
		   date_format(visited_at - interval 9 hour, '%W') as yoil,
		   date_format(visited_at - interval 9 hour, '%H') as timezone,
		   count(distinct customer_id) as active_user
	from tbl_visit
    where visited_at >= '2020-07-01' and visited_at < '2020-08-01'
	group by 1,2,3
) as db
group by 1,2
order by 3 desc;