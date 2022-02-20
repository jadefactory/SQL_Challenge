-- Q19. 우리 서비스는 유저의 재방문율이 높은 서비스인가요? 이를 파악하기 위해 7월 기준 Day1 Retention이 어떤지 구해주시고 추세를 보기 위해 Daily로 추출해주세요.
-- * Retention: 시간이 지날수록 얼마나 많은 유저가 제품이나 서비스로 다시 돌아오는지를 보여주는 지표

select date_format(A.visited_at, '%Y-%m-%d') as date,
	   count(distinct A.customer_id) as active_user,
       count(distinct B.customer_id) as retained_user,
       count(distinct B.customer_id) / count(distinct A.customer_id) as retention
from tbl_visit A
left join tbl_visit B 
	   on A.customer_id = B.customer_id
	  and date_format(A.visited_at, '%Y-%m-%d') = date_format(B.visited_at - interval 9 hour - interval 1 day, '%Y-%m-%d')
where date_format(A.visited_at, '%Y-%m-%d') < '2020-08-01'
group by 1;