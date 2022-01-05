-- 문제) 미국 서해안에 있는 주(custstate)에서 전체 주문 금액이 $1,000,000가 넘는 주를 보여주세요.
--         Hint1. 서해안 주: custstate = 'WA','OR','CA'
-- 답안) 

select custstate, sum(price) as total_price
from (
	select c.custstate, od.quotedprice * od.quantityordered as price
	from customers c 
		join orders o on c.customerid = o.customerid 
		join order_details od on o.ordernumber = od.ordernumber
	where c.custstate in ('WA', 'OR', 'CA')
) as db
group by custstate
having sum(price) >= 1000000