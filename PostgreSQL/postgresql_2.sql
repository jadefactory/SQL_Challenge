-- 문제) 주문 금액이 $1000 이상이며, 총 주문 횟수가 3회 이상인 고객 번호와 이름은? 
-- 답안)
	 
select o.customerid, c.custfirstname, c.custlastname,
	   count(o.ordernumber) as order_cnt
from orders o 
	join order_details od on o.ordernumber = od.ordernumber 
	join customers c on o.customerid = c.customerid
where od.quotedprice * od.quantityordered >= 1000
group by o.customerid, c.custfirstname, c.custlastname
having count(o.ordernumber) >= 3