-- Q1. 2020년 7월의 총 Revenue를 구해주세요. 
select sum(price) as revenue
from tbl_purchase
where purchased_at >= '2020-07-01' 
  and purchased_at < '2020-08-01';