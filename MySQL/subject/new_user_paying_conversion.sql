-- Q18. 2020년 7월에 우리 신규유저가 하루 안에 결제로 넘어가는 비율이 어떻게 되나요? 그 비율이 어떤지 알고싶고, 하루 안에 결제한 고객들이 결제까지 보통 몇 분 정도가 소요되는지 알고싶어요.

with conversion as (
	select tc.customer_id, tc.created_at,
		   ftp.customer_id as paying_user, ftp.first_purchased_at,
		   timestampdiff(second, tc.created_at, ftp.first_purchased_at) / 3600 as diff_hour
	from tbl_customer tc
	left join (
		select customer_id,
			   min(purchased_at) as first_purchased_at
		from tbl_purchase
		group by 1
	) ftp 
	on (tc.customer_id = ftp.customer_id) and (ftp.first_purchased_at < tc.created_at + interval 1 day - interval 9 hour)
	where (tc.created_at >= '2020-07-01' and tc.created_at < '2020-08-01')
)
select round(count(paying_user)/count(customer_id) * 100, 2) as conversion_ratio_and_avg_hour
from conversion
union all
select round(avg(diff_hour), 2)
from conversion;

-- 2020년 7월 신규 유저의 하루 이내 구매전환 비율: 약 20.66%
-- 2020년 7월 신규 유저의 첫 결제 평균 소요 시간: 약 10.18시간