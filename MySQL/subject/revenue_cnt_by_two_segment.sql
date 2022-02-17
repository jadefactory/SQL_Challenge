-- Q15. 2020년 7월의 성별/연령대에 따른 총 구매건수와 총 Revenue를 구해주세요.

select gender, agezone, 
	   count(purchased_id) as purchase_cnt, 
       sum(price) as revenue
from (
	select tp.id as purchased_id,
		   tp.price,
		   case when gender = '' or gender = 'Others' then '성별미상'
				when gender = 'M' then '남성'
				when gender = 'F' then '여성'
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
	from tbl_purchase tp
	join tbl_customer tc on tc.customer_id = tp.customer_id
	where tp.purchased_at >= '2020-07-01' and tp.purchased_at < '2020-08-01'
) as db
group by 1,2
order by 4 desc;