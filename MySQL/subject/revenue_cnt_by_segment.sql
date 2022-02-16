-- Q14. 2020년 7월 기준, 성별에 따른 총 구매건수와 총 Revenue를 구해주세요. 이전처럼 남녀 이외의 성별은 하나로 묶어주세요.

select case when tc.gender = '' or tc.gender = 'Others' then '성별미상' 
			when tc.gender = 'M' then '남성'
            when tc.gender = 'F' then '여성'
			else tc.gender 
	   end as gender,
	   count(tp.id) as purchase_cnt, sum(tp.price) as revenue
from tbl_purchase tp
join tbl_customer tc on tc.customer_id = tp.customer_id
where tp.purchased_at >= '2020-07-01' and tp.purchased_at < '2020-08-01'
group by 1;