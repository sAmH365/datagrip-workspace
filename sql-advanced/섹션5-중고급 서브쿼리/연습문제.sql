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

-- 2. `rental` 테이블에서 고객별 평균 대여 횟수보다 많은 대여를 한 고객들의 이름(`first_name` ,`last_name`) 찾기
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
  SELECT customer_id
  FROM rental
  GROUP BY customer_id
  HAVING COUNT(*) > (
    SELECT AVG(rental_count)
    FROM (
      SELECT COUNT(*) AS rental_count
      FROM rental
      GROUP BY customer_id
    ) AS rental_count
  )
);

-- 3. 가장 많은 영화를 대여한 고객의 이름 (`first_name` ,`last_name`) 찾기
SELECT first_name, last_name
FROM customer
WHERE customer_id = (
    SELECT customer_id
    FROM rental
    GROUP BY customer_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- 4. 각 고객에 대해 자신이 대여한 평균 영화 길이(`length`)보다 긴 영화들의 제목(`title`)을 찾기
SELECT C.first_name, C.last_name, F.title
FROM customer C
JOIN rental R ON R.customer_id = C.customer_id
JOIN inventory I ON I.inventory_id = R.inventory_id
JOIN film F ON F.film_id = I.film_id
WHERE F.length > (
    SELECT AVG(FIL.length)
    FROM film FIL
    JOIN inventory INV ON INV.film_id = FIL.film_id
    JOIN rental REN ON REN.inventory_id = INV.inventory_id
    WHERE REN.customer_id = C.customer_id
);