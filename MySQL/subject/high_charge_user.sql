-- Q5. 2020년 7월에 가장 많이 구매한 고객 Top3와 Top10~15 고객을 뽑아주세요.

select *
from (
	select customer_id, sum(price) as sum_price, 
		   rank() over (order by sum(price) desc) as ranking
	from tbl_purchase
	where purchased_at >= '2020-07-01' and purchased_at < '2020-08-01'
    group by customer_id
) as db
where (ranking between 1 and 3) or (ranking between 10 and 15);