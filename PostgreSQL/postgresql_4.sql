-- 문제) 헬멧을 주문한 적 없는 고객을 보여주세요. not exists를 꼭 활용하여 풀이해주세요.
--         Hint 1. Productname을 활용하여 헬맷 확인 (카테고리 테이블 활용 X)
-- 답안) 

select c.customerid, c.custfirstname, c.custlastname
from customers c 
where not exists (
	select 1
	from orders o 
		join order_details od on o.ordernumber = od.ordernumber 
		join products p on od.productnumber = p.productnumber
	where p.productname like '%Helmet' and
		  (o.customerid = c.customerid)
	order by o.customerid
)