-- Q13. Q12 결과의 성별과 연령을 "남성(25-29세)"와 같이 통합해주세요.
-- 이 때, 각 성별과 연령이 전체 고객에서 얼마나 차지하는지 분포(%)를 알려주시고 분포가 높은 순서대로 정렬해주세요.

select concat(gender, '(', agezone, '세)') as category, 
       round((count(customer_id) / sum(count(customer_id)) over () * 100),2) as percentage 
       -- 다음과 같이 스칼라 서브쿼리를 사용해서 비율을 구할 수도 있음
       -- round(count(*) / (select count(*) from tbl_customer) * 100, 2) as percentage
from (
	select customer_id,
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
	from tbl_customer
) as db
group by 1
order by 2 desc;