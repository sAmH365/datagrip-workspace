-- 1. LENGTH(sting) 문자열의 길이를 반환
SELECT title, LENGTH(title)
FROM film
LIMIT 10;

-- 2. UPPER(string). LOWER(string)
SELECT title, UPPER(title), LOWER(title)
FROM film
LIMIT 10;

-- 3. CONCAT(string1, string2, ...)
SELECT
    CONCAT(first_name, ' ', last_name)
FROM actor
LIMIT 10;

-- 4. SUBSTRING(string, start, length) : 문자열에서 부분 문자열을 추출
SELECT SUBSTRING(description, 1, 10) as short_description
FROM film
LIMIT 10;

/**
-- 연습 문제 --
1. film 테이블에서 영화 제목( title )의 길이가 15자인 영화들을 찾아주세요.
2. actor 테이블에서 첫 번째 이름( first_name )이 소문자로 'john'인 배우들의 전체 이름을 대문자로 출력해주세요.
3. film 테이블에서 description 의 3번째 글자부터 6글자가 'Action'인 영화의 제목을 찾아주세요.
4. rental 테이블에서 대여 시작 날짜( rental_date )가 2006년 1월 1일 이후인 모든 대여에 대해, 예상 반납 날짜를
대여 날짜로부터 5일 뒤로 설정해주세요.
5. payment 테이블에서 결제 금액( amount )이 5 이하인 모든 결제에 대해, 절대값을 계산하여 출력해주세요.
6. film 테이블에서 영화 길이( length )가 120분 이상인 모든 영화에 대해, 영화 길이의 제곱근을 계산해주세요.
7. payment 테이블에서 결제 금액( amount )을 소수점 첫 번째 자리에서 반올림하여 출력해주세요.
*/

 -- 1. film 테이블에서 영화 제목( title )의 길이가 15자인 영화들을 찾아주세요.
SELECT *
FROM film
WHERE LENGTH(title) = 15;

-- 2. actor 테이블에서 첫 번째 이름( first_name )이 소문자로 'john'인 배우들의 전체 이름을 대문자로 출력해주세요.
SELECT actor_id, CONCAT(first_name, ' ', last_name) as name
FROM actor
WHERE LOWER(first_name) = 'john';

-- 3. film 테이블에서 description 의 3번째 글자부터 6글자가 'Action'인 영화의 제목을 찾아주세요.
SELECT title
FROM film
WHERE SUBSTRING(description, 3, 6) = 'Action';

-- 4. rental 테이블에서 대여 시작 날짜( rental_date )가 2006년 1월 1일 이후인 모든 대여에 대해, 예상 반납 날짜를 대여 날짜로부터 5일 뒤로 설정해주세요.
