-- Q3. 7월에 우리 Active 유저의 구매율(Paying Rate)은 어떻게 되나요?

select count(distinct customer_id)
from tbl_purchase
where purchased_at >= '2020-07-01'
  and purchased_at < '2020-08-01';
-- 11174
  
select count(distinct customer_id)
from tbl_visit
where visited_at >= '2020-07-01'
  and visited_at < '2020-08-01';
-- 16414

select round(11174/16414 * 100, 2);

-- 7월의 구매 고객 숫자를 활성 고객 숫자로 나누어 구매율을 계산함