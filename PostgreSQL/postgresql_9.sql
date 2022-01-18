-- 문제) Tire 카테고리 주문량이 매달 증가하고 있나요?(2017년 1월 ~ 12월까지 판매량만 확인하시면 됩니다.)
--         월별 주문량을 이전 달 주문량과 함께 표기하여 증가 여부를 알려주세요.(analytic function 활용)
--         - 아래의 표기 값으로 산출해주세요. 
--         - 이전 달보다 값이 크다면? 'PLUS'
--         - 이전 달의 값이 현재 값 보다 크다면? 'MINUS'
--         - 현재 달의 판매 량과 이전 달 값이 같다면? 'SAME'
--         - 이 외의 Case는? NULL 
--         Hint1. 카테고리 테이블 활용 필요 - "Tires" 카테고리 확인 
-- 답안) 

select *, 
	   lag(order_cnt, 1) over (order by month) as prev_order,
	   case when order_cnt - lag(order_cnt, 1) over (order by month) > 0 then 'PLUS'
	   		when order_cnt - lag(order_cnt, 1) over (order by month) < 0 then 'MINUS'
	   		when order_cnt - lag(order_cnt, 1) over (order by month) = 0 then 'SAME'
	   		else null
	   end as order_diff
from (
	select extract(month from o.orderdate) as month, 
		   count(o.ordernumber) as order_cnt
	from orders o
		join order_details od on o.ordernumber = od.ordernumber
		join products p on od.productnumber = p.productnumber
		join categories c on p.categoryid = c.categoryid
	where c.categorydescription = 'Tires' and
		  (o.orderdate between '2017-01-01' and '2017-12-31')
	group by extract(month from o.orderdate)
	order by extract(month from o.orderdate)
) as db