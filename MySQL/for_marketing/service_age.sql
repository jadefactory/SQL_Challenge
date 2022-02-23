-- Q20. 우리 서비스는 신규유저가 많나요? 아니면 기존 유저가 많나요? 유저들이 가입한 기간별로 그룹지어 고객분포가 어떤지 알려주세요. DAU기준으로 부탁합니다.

with data as (
	select date, tc.customer_id, tc.created_at, ltv.last_visit,
		   timestampdiff(day, tc.created_at, ltv.last_visit) as service_age
	from tbl_customer tc
	join (
		select date_format(visited_at - interval 9 hour, '%Y-%m-%d') as date,
			   customer_id, 
			   max(visited_at) as last_visit
		from tbl_visit
		where visited_at >= '2020-07-01' and visited_at < '2020-08-01'
		group by 1,2
		order by 1
	) as ltv on ltv.customer_id = tc.customer_id
)
select date, 
	   case when service_age >= 730 then 'f_2년이상'
			when service_age >= 365 and service_age < 730 then 'e_1년이상'
            when service_age >= 180 and service_age < 365 then 'd_6개월이상'
			when service_age >= 90 and service_age < 180 then 'c_3개월이상'
			when service_age >= 30 and service_age < 90 then 'b_1개월이상'
            else 'a_1개월미만'
			end as segment,
       sum(count(customer_id)) over (partition by date) as daily_customer_cnt,
	   count(customer_id) as cnt_customer,
       round(count(customer_id) / sum(count(customer_id)) over (partition by date), 2) * 100 as ratio
from data
group by 1,2
order by 1,2;