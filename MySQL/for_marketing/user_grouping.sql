-- Q12. 전체 유저의 Demographic을 알고 싶어요. 성/연령별로 유저 숫자를 알려주세요. 어느 세그먼트의 숫자가 가장 많나요?
-- 참고로 기타 성별은 하나로, 연령은 5세 단위로 적당히 묶어주시고 유저 수가 높은 순서대로 보여주세요.

select gender, agezone, count(customer_id) as cnt_customer
from (
	select customer_id,
		   case when gender = '' then 'Others'
		   else gender
           end as gender,
		   case when age >= 10 and age < 15 then '10-14'
				when age >= 15 and age < 20 then '15-19'
				when age >= 20 and age < 25 then '20-24'
				when age >= 25 and age < 30 then '25-29'
				when age >= 30 and age < 35 then '30-34'
				when age >= 35 and age < 40 then '35-39'
				when age >= 40 and age < 45 then '40-44'
				when age >= 45 and age < 50 then '45-49'
				when age >= 50 and age < 55 then '50-54'
				when age >= 55 and age < 60 then '55-59'
			else 'outlier'
			end as agezone
	from tbl_customer
) as db
group by 1,2
order by cnt_customer desc;

-- 가장 고객 수가 많은 세그먼트: 20-24세 여성