-- Q6. 2020년 7월의 평균 DAU를 구해주세요. Active User 수가 증가하는 추세인가요?

select avg(users)
from (
	select date_format(visited_at - interval 9 hour, '%Y-%m-%d') as date_at,
		   count(distinct customer_id) as users
	from tbl_visit
	where visited_at >= '2020-07-01' and visited_at < '2020-08-01'
	group by 1
) as db;

-- date_format에서 '%Y-%m-%d T'를 통해 시간대를 확인했을 때
-- 실제 시간보다 9시간이 더해진 상태로 표시되어있기 때문에 
-- 각각의 시간 데이터에서 9시간을 빼주지 않으면 8월 1일까지 집계됨
-- interval n hour 메소드를 사용하여 시간차를 해결

-- Active User 수의 추세는 dau_visualization.ipynb파일 참고