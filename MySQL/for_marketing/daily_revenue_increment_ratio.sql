-- Q16. 2020년 7월 일별 매출의 전일 대비 증감폭, 증감률을 구해주세요.

 with db as (
	 select date_format(purchased_at - interval 9 hour, '%Y-%m-%d') as day, 
			sum(price) as daily_revenue
	 from tbl_purchase
	 where purchased_at >= '2020-07-01' and purchased_at < '2020-08-01'
	 group by 1
) 
select *, 
	   lag (daily_revenue, 1) over () as prev_revenue, 
	   daily_revenue - lag (daily_revenue, 1) over (order by day) as increment,
       round((daily_revenue - lag (daily_revenue, 1) over (order by day)) / (lag (daily_revenue, 1) over (order by day)) * 100, 2) as rate_of_change
from db;