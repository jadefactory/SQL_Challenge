-- 문제) 고객의 월별 주문 횟수가 3번 이상을 기록한적 있는 모든 고객 이름은 무엇인가요? (GROUP BY, HAVING, JOIN 사용)
-- 답안) 

select distinct customerid, custfirstname, custlastname
from (
	select extract(month from o.orderdate) as order_month,
	   c.customerid, c.custfirstname, c.custlastname,
	   count(o.ordernumber) as order_cnt
	from orders o 
		join customers c on o.customerid = c.customerid
	group by extract(month from o.orderdate),
		     c.customerid, c.custfirstname, c.custlastname
	having count(o.ordernumber) >= 3
	order by c.customerid
) as db
order by customerid