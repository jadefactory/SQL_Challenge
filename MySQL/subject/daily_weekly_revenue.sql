-- Q8-1. 2020년 7월의 Daily Revenue는 증가하는 추세인가요? 평균 Daily Revenue도 구해주세요.

select avg(daily_revenue)
from (
	select date_format(purchased_at - interval 9 hour, '%Y-%m-%d') as day,
		   sum(price) as daily_revenue
	from tbl_purchase
	where purchased_at >= '2020-07-01' and purchased_at < '2020-08-01'
	group by 1
) as db;
-- Daily Revenue의 추세는 daily_revenue_visualization.ipynb파일 참고

-- Q8-2. 2020년 7월의 평균 Weekly Revenue를 구해주세요.
select avg(weekly_revenue)
from (
	select date_format(purchased_at - interval 9 hour, '%U') as week,
		   sum(price) as weekly_revenue
	from tbl_purchase
	where purchased_at >= '2020-07-05' and purchased_at < '2020-07-26'
	group by 1
) as db;