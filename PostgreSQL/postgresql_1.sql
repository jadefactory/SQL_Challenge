-- ����) �� ��ǰ(product)�� ��ǰ��� �� �Ǹŷ�(quantityordered)�� �˷��ּ���. �߰���, ��ü �Ǹŷ� ���� �˷��ּ���. 
-- ���)

select p.productnumber, coalesce(p.productname, 'TOTAL'), count(o.ordernumber) as order_cnt 
from products p 
	join order_details od on p.productnumber = od.productnumber
	join orders o on od.ordernumber = o.ordernumber
group by grouping sets (
	(p.productnumber, p.productname),
	()
)
order by p.productnumber