-- 문제) 주문일자별, 직원이 처리한 주문 수를 알려주세요. 총 전체 주문 수도 함께 보여주세요.  
-- 답안) 

select orderdate, coalesce(cast(employeeid as text),'TOTAL') as employeeid, 
	   count(ordernumber) as order_cnt
from orders
group by grouping sets (
	(orderdate, employeeid),
	()
)
order by orderdate, employeeid