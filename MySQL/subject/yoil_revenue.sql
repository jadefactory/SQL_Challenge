-- Q9.2020년 7월의 요일별 평균 Revenue를 구해주세요. 어느 요일의 평균 Revenue가 가장 높고 낮나요?

select date_format(july_date, '%W') as yoil,
	   avg(revenue) as yoil_revenue
from (
	select date_format(purchased_at - interval 9 hour, '%Y-%m-%d') as july_date, 
		   sum(price) as revenue
	from tbl_purchase
	where purchased_at >= '2020-07-01' and purchased_at < '2020-08-01'
	group by 1
) as db
group by 1
order by 2 desc;

-- 평균 Revenue가 가장 높은 요일: 월요일
-- 평균 Revenue가 가장 낮은 요일: 토요일 