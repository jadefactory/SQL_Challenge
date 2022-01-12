-- 문제) 2017년 09월에 해당하는 주문에 대해서, 1~10일, 11~20일, 21~30일에 대한 각각의 구간에 대한 주문 금액을 보여주세요. 
--         row 수는 1개로 1~10일에 해당하는 주문금액, 11~20일에 해당하는 주문금액, 21~30일에 해당하는 주문금액과, 총 주문금액에 대한 컬럼으로 보여주세요.
-- 답안) 

select max(case when order_info = 'order01_10' then total_price) as 'order01_10',
	   max(case when order_info = 'order11_20' then total_price) as 'order11_20',
	   max(case when order_info = 'order21_30' then total_price) as 'order21_30',
	   max(case when order_info = 'TOTAL' then total_price) as 'TOTAL'
from (
	select coalesce(order_info, 'TOTAL') as order_info,
	   sum(paid_price) as total_price
	from (
		select o.orderdate, sum(od.quotedprice * od.quantityordered) as paid_price,
			   case when orderdate between '2017-09-01' and '2017-09-10' then 'order01_10'
					when orderdate between '2017-09-11' and '2017-09-20' then 'order11_20'
					when orderdate between '2017-09-21' and '2017-09-30' then 'order21_30'
					end as order_info
		from orders o 
			join order_details od on o.ordernumber = od.ordernumber
		where o.orderdate between '2017-09-01' and '2017-09-30'
		group by o.orderdate
		order by o.orderdate
	) as db
	group by grouping sets (
		(order_info),
		()
	)
	order by order_info
) as outer_db