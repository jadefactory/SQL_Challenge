-- Q4. 2020년 7월 구매 유저의 월 평균 구매금액은 어떻게 되나요?
-- ARPPU = Average Revenue per Paying User
 
select avg(revenue) as ARPPU_July
from (
	select customer_id, sum(price) as revenue
	from tbl_purchase
	where purchased_at >= '2020-07-01'
	and purchased_at < '2020-08-01'
	group by customer_id
) as db;