-- Q10. 2020년 7월 시간대별 평균 Revenue를 구해주세요. 
-- 가장 높은 평균 Revenue는 몇 시에 발생했는지, 가장 낮은 평균 Revenue는 몇 시에 발생했는지를 찾아주세요.

select timezone, avg(revenue)
from (
	select date_format(purchased_at - interval 9 hour, '%Y-%m-%d') as day,
		   date_format(purchased_at - interval 9 hour, '%H') as timezone,
		   sum(price) as revenue
	from tbl_purchase
	where purchased_at >= '2020-07-01' and purchased_at < '2020-08-01'
	group by 1,2
) as db
group by timezone
order by avg(revenue) desc;

-- 가장 Revenue가 높은 시간대: 18시
-- 가장 Revenue가 낮은 시간대: 06시