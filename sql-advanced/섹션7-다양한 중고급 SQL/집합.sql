-- UNION, UNION ALL, INTERSECT, EXCEPT


/**
  UNION
  두 개 이상의 SELECT 문의 결과 집합을 결합하며, 중복된 행은 제거.
  각 SELECT 문의 열은 같은 순서를 가져야 하며, 유사한 데이터 유형을 가지고 있어야 한다
 */
SELECT film_id FROM film
UNION
SELECT film_id FROM inventory;

/**
  UNIONALL
  두 개 이상의 SELECT 문의 결과 집합을 결합하며, 중복된 행도 포함
  각 SELECT 문의 열은 같은 순서를 가져야 하며, 유사한 데이터 유형을 가지고 있어야 한다
 */
SELECT film_id FROM film
EXCEPT
SELECT film_id FROM inventory;

/**
  INTERSECT
  두 개 이상의 SELECT 문의 결과 집합의 교집합을 반환.
  모든 SELECT 문에 공통적으로 있는 행을 반환.
  각 SELECT 문의 열은 같은 순서를 가져야 하며, 유사한 데이터 유형을 가지고 있어야 한다
 */

/**
  EXCEPT
  두 개 이상의 SELECT 문의 결과 집합의 차집합을 반환.
  첫 번째 집합에는 있지만 두번째 결과 집합에는 없는 행을 반환.
  각 SELECT 문의 열은 같은 순서를 가져야 하며, 유사한 데이터 유형을 가지고 있어야 한다
 */


/**
  연습문제
  1. film 테이블과 film_category 테이블에서 각각 중복 없이 film_id를 조회하는 SQL문을 작성
  2. film테이블과 film_category 테이블에서 각각 film_id를 조회되 중복값도 포함되는 SQL문을 작성
  3. film 테이블과 film_category 테이블에서 모두 나오는 film_id를 조회하는 SQL문을 작성
  4. film 테이블에는 존재하지만 film_category 테이블에는 존재하지 않는 film_id를 조회하는 SQL문을 작성
 */

-- 1. film 테이블과 film_category 테이블에서 각각 중복 없이 film_id를 조회하는 SQL문을 작성
SELECT film_id FROM film
UNION
SELECT film_id FROM film_category;

-- 2. film테이블과 film_category 테이블에서 각각 film_id를 조회되 중복값도 포함되는 SQL문을 작성
SELECT film_id FROM film
UNION ALL
SELECT film_id FROM film_category;

-- 3. film 테이블과 film_category 테이블에서 모두 나오는 film_id를 조회하는 SQL문을 작성
SELECT film_id FROM film
INTERSECT
SELECT film_id FROM film_category;

-- 4. film 테이블에는 존재하지만 film_category 테이블에는 존재하지 않는 film_id를 조회하는 SQL문을 작성
SELECT film_id FROM film
EXCEPT
SELECT film_id FROM film_category;