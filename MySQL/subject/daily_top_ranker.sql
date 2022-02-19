-- Q17. 일별로 많이 구매한 고객들에게 소정의 선물을 증정하려 합니다. 7월의 일별 구매 기준으로, 매일 가장 많이 지출한 고객 Top3를 뽑아주세요.

select *
from (
	select customer_id,
		   date_format(purchased_at - interval 9 hour, '%Y-%m-%d') as day,
		   sum(price) as total_charge, 
		   dense_rank () over (partition by date_format(purchased_at - interval 9 hour, '%Y-%m-%d') order by sum(price) desc) as ranking
	from tbl_purchase
	where purchased_at >= '2020-07-01' and purchased_at < '2020-08-01'
	group by 1,2
) as db
where ranking <= 3;