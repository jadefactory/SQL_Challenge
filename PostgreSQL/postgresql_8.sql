-- 문제) 주문을 많이 한 고객 순서대로 순위를 매겨 나열하세요.(analytic function 활용)
--         - 주문량이 같을 경우, 같은 등수로 보여주세요.
--         - 순위는 1,2,3등의 형식으로 순차적인 값이 노출되어야 합니다.
--         - 단, 고객의 리스트는 다음에 제한 조건을 가집니다.
--         - 월별 주문 5회 이상의 Case를 3개월 이상 경험한 고객으로만 제한합니다.(3개월은 연속이든 불연속이든 상관없습니다.)
--           ex) 고객1이 1월에 6회, 3월에 5회, 9월에 5회 주문한 경험이 있다면 포함해야합니다. 
-- 답안) 

select o2.customerid, count(o2.ordernumber) as order_cnt,
	   dense_rank () over (order by count(o2.ordernumber) desc)
from orders o2
where o2.customerid in (
	select customerid
	from (
		select o.customerid
		from orders o
		group by extract(month from o.orderdate), o.customerid
		having count(o.ordernumber) >= 5
		order by o.customerid, extract(month from o.orderdate)
	) as db
	group by customerid
	having count(customerid) >= 3
)
group by o2.customerid