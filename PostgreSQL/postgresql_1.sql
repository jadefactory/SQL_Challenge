-- 문제) 각 제품(product)의 제품명과 총 판매량(quantityordered)을 알려주세요. 추가로, 전체 판매량 또한 알려주세요. 
-- 답안)

select p.productnumber, coalesce(p.productname, 'TOTAL'), count(o.ordernumber) as order_cnt 
from products p 
	join order_details od on p.productnumber = od.productnumber
	join orders o on od.ordernumber = o.ordernumber
group by grouping sets (
	(p.productnumber, p.productname),
	()
)
order by p.productnumber