-- 1. NOW()
SELECT NOW();

-- 2. CURDATE() : 현재 날짜를 반환
SELECT CURDATE();

-- 2. CURTIME() : 현재 시간을 반환
SELECT CURTIME();

-- 4. DATE_ADD(date, INTERVAL unit) : 날짜에 간격을 추가, ADDDATE(date, int day)
SELECT
    rental_date,
    DATE_ADD(rental_date, INTERVAL 8000 DAY)
FROM rental
LIMIT 10;

SELECT
    rental_date,
    DATE_ADD(rental_date, INTERVAL 10000 HOUR )
FROM rental
LIMIT 10;

-- 4. DATE_SUB(date, INTERVAL unit) : 날짜에 간격을 뺀다
SELECT
    rental_date,
    DATE_SUB(rental_date, INTERVAL 8000 DAY)
FROM rental
LIMIT 10;

SELECT
    rental_date,
    DATE_SUB(rental_date, INTERVAL 3 SECOND )
FROM rental
LIMIT 10;

-- 5. EXTRACT(field FROM source),
-- '날짜 필드' 에서 특정 부분을 추출 할 때 사용
    --  `field`: 추출할 날짜의 부분 (YEAR, MONTH, DAY, HOUR, MINUTE 등)

-- ex1) 모든 결제 레코드에서 년도만 추출 하기
SELECT EXTRACT(YEAR FROM payment_date)
FROM payment
LIMIT 10;

SELECT
    payment_date,
    EXTRACT(HOUR FROM payment_date)
FROM payment
LIMIT 10;

-- 5.1 YEAR(), MONTH(), DAY(), HOUR(), MINUTE() 함수로도 뽑아낼수 있음
SELECT YEAR(payment_date)
FROM payment
LIMIT 10;

-- 5.2 DAYOFWEEK() : 주어진 날짜가 일요일부터 시작하여 몇 번째 요일인지를 반환
-- (일: 1 월: 2 화: 3 수: 4 목: 5 금: 6 토: 7)
SELECT
    payment_date,
    DAYOFWEEK(payment_date)
FROM payment
LIMIT 10;

-- 6. TIMESTAMPDIFF(unit, start_datetime, end_datetime): 두 날짜 또는 시간 값 사이의 차이를 계산  :: end_time - start_time
-- DATEDIFF(date1, date2) :: date1 - date2
-- TIMEDIFF(time1, time) :: time1 - time2

-- ex1) 대여와 반납 사이의 일수 차이
SELECT
    rental_date,
    return_date,
    TIMESTAMPDIFF(DAY, rental_date, return_date)
FROM rental
LIMIT 10;

-- 7. DATE_FORMAT()
/*
%Y: 4자리 연도 표시
%M: 영문 월 표시
%m: 월을 두 자리 숫자로 표시  01, 02
%c: 월을 한 자리 숫자로 표시  1, 2
%D: 일을 두 자리 숫자와 영문 접미사로 표시 (1st, 2nd...)
%d: 일을 두 자리 숫자로 표시
%H: 시간을 24시간 형태의 두 자리 숫자로 표시
%h: 시간을 12시간 형태의 두 자리 숫자로 표시 (%I도 같은듯)
%l: 시간을 12시간 형태의 한 자리 또는 두자리 숫자로 표시
%i: 분을 두 자리 숫자로 표시
%s: 초를 두자리 숫자로 표시
*/

SELECT
    rental_date,
    DATE_FORMAT(rental_date, '%Y년-%m월-%d일-%H시-%i분-%s초')
FROM rental
LIMIT 30;


/*
-- 연습 문제 --
 4. rental 테이블에서 대여 시작 날짜( rental_date )가 2006년 1월 1일 이후인 모든 대여에 대해, 예상 반납 날짜를
대여 날짜로부터 5일 뒤로 설정해주세요.
*/

SELECT
    rental_id,
    rental_date,
    ADDDATE(rental_date, 5)
FROM rental
WHERE rental_date >= '2006-01-01';

SELECT
    rental_date,
    return_date,
    DATEDIFF(return_date, rental_date) as DIFF
FROM rental
LIMIT 10;


SELECT
    rental_date,
    return_date,
    TIMESTAMPDIFF(DAY, rental_date, return_date)
FROM rental
LIMIT 10;