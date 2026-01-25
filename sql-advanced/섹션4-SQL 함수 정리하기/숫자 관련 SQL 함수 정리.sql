-- 1. ABS(number) : 절대 값
SELECT ABS(-1);
SELECT ABS(-1232);

-- 2. CEIL(number): 올림
SELECT CEIL(0.1);

-- 3. FLOOR(number): 내림
SELECT FLOOR(1.9999);

-- 4. ROUND(nuber, decimals): 특정 소수점 자리수로 반올림 (decimals 표시된 숫자 까지 표현)
SELECT ROUND(12.15, 1); -- 12.2

-- 5. SQRT(number) 제곱근
SELECT SQRT(16);

/**
-- 연습 문제 --
5. payment 테이블에서 결제 금액( amount )이 5 이하인 모든 결제에 대해, 절대값을 계산하여 출력해주세요.
6. film 테이블에서 영화 길이( length )가 120분 이상인 모든 영화에 대해, 영화 길이의 제곱근을 계산해주세요.
7. payment 테이블에서 결제 금액( amount )을 소수점 첫 번째 자리에서 반올림하여 출력해주세요.
*/

-- 5. payment 테이블에서 결제 금액( amount )이 5 이하인 모든 결제에 대해, 절대값을 계산하여 출력해주세요.
SELECT ABS(amount)
FROM payment
WHERE amount <= 5;

-- 6. film 테이블에서 영화 길이( length )가 120분 이상인 모든 영화에 대해, 영화 길이의 제곱근을 계산해주세요.
SELECT length, SQRT(length)
FROM film
WHERE length >= 120;

-- 7. payment 테이블에서 결제 금액( amount )을 소수점 첫 번째 자리에서 반올림하여 출력해주세요..
SELECt amount, ROUND(amount, 0)
FROM payment