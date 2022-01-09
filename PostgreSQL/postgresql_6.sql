-- 문제) 직원과 고객 중에 이름이 동일한 사람이 있을까요? 있다면 해당 사람의 이름에 대해서 (이름+성) 형식으로 알려주세요.
-- 답안) 

select firstname || ' ' || lastname as fullname
from (
	select e.empfirstname as firstname, e.emplastname as lastname
	from employees e 
	intersect
	select c.custfirstname, c.custlastname
	from customers c
) as db