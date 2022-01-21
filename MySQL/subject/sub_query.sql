DROP DATABASE IF EXISTS pokemon;
CREATE DATABASE pokemon;
USE pokemon;
CREATE TABLE mypokemon (
	   number  INT,
       name	VARCHAR(20)
);
INSERT INTO mypokemon (number, name)
VALUES (10, 'caterpie'),
	   (25, 'pikachu'),
       (26, 'raichu'),
       (133, 'eevee'),
       (152, 'chikoirita');
CREATE TABLE ability (
	   number INT,
	   type	VARCHAR(10),
       height FLOAT,
       weight FLOAT,
       attack INT,
       defense INT,
       speed int
);
INSERT INTO ability (number, type, height, weight, attack, defense, speed)
VALUES (10, 'bug', 0.3, 2.9, 30, 35, 45),
	   (25, 'electric', 0.4, 6, 55, 40, 90),
       (26, 'electric', 0.8, 30, 90, 55, 110),
	   (133, 'normal', 0.3, 6.5, 55, 50, 55),
	   (152, 'grass', 0.9, 6.4, 49, 65, 45);

/*
MISSION (1)
내 포켓몬 중에 몸무게가 가장 많이 나가는 포켓몬의 번호를 가져와 주세요.
*/
select number
from ability
order by weight desc
limit 1;

select number
from ability
where weight = (select max(weight) from ability);

/*
MISSION (2)
속도가 모든 전기 포켓몬의 공격력보다 하나라도 작은 포켓몬의 번호를 가져와 주세요.
*/
select number
from ability
where speed < any(select attack from ability where type = 'electric');



/*
MISSION (3)
공격력이 방어력보다 큰 포켓몬이 있다면 모든 포켓몬의 이름을 가져와 주세요.
*/
select *
from ability a
join mypokemon m on m.number = a.number
where a.attack > a.defense; 

select name
from mypokemon
where exists (select * from ability where attack > defense);