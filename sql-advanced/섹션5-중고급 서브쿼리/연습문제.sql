/**
-- 기본 연습문제 --
1. film 테이블에서 평균 영화 길이(`length`)보다 긴 영화들의 제목(`title`) 찾기
2. `rental` 테이블에서 고객별 평균 대여 횟수보다 많은 대여를 한 고객들의 이름(`first_name` ,`last_name`) 찾기
3. 가장 많은 영화를 대여한 고객의 이름 (`first_name` ,`last_name`) 찾기
4. 각 고객에 대해 자신이 대여한 평균 영화 길이(`length`)보다 긴 영화들의 제목(`title`)을 찾기
*/

-- 1. film 테이블에서 평균 영화 길이(`length`)보다 긴 영화들의 제목(`title`) 찾기
SELECT title
FROM film
WHERE length > (SELECT AVG(length) FROM film);

/**
-- 복합 연습문제
1. `rental` 과`inventory` 테이블을 JOIN하고,`film` 테이블에 있는
`replacement_cost` 가 $20 이상인 영화를 대여한 고객의 이름을 찾기. 고객 이름은 소문자로 출력.
2. `film` 테이블에서 `rating` 이 'PG-13'인 영화들에서,평균 `description` 길이보다 긴 영화의 제목을 찾기.
3. `customer` 와 `rental`, `inventory`, `film` 테이블을 JOIN하여, 2005년 8월에 대여된 모든 'R' 등급 영화의 제목
과 해당 영화를 대여한 고객의 이메일을 찾기.
4. `payment` 테이블에서 가장 마지막에 결재된 일시에서 30일 이전까지의 모든 결제 내역을 찾고, 해당 결재 내역에 대해서,
각 고객별 총 결제 금액과 평균 결제 금액을 소수점 둘째 자리에서 반올림하여 출력
5. `actor`와 `film_actor` 테이블을 JOIN하고, 'Sci-Fi' 카테고리에 속한 영화에 출연한 배우의 이름을 찾기. 배우의 이름은 성과 이름을 연결하여 대문자로 출력.
*/