-- 1. 간단한 서브쿼리
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
  SELECT customer_id
  FROM payment
  WHERE amount > (SELECT AVG(amount) FROM payment)
);

-- 2. GROUP BY가 있는 서브 쿼리
-- 평균 결제 횟수보다 많은 결제를 한 고객
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id -- GROUP BY 해서 조건 주고 싶을 때는 HAVING 절 사용
    HAVING COUNT(*) > (
        SELECT AVG(payment_count)
        FROM (
          SELECT COUNT(*) AS payment_count
          FROM payment
          GROUP BY customer_id
        ) AS payment_count -- 서브쿼리로 테이블을 만들경우 반드시 alias를 줘야함
    )
);

-- 3. 최대값을 가진 행 찾기
SELECT first_name, last_name
FROM customer
WHERE customer_id = (
    SELECT customer_id
    FROM (
      SELECT customer_id, COUNT(*) AS payment_count
      FROM payment
      GROUP BY customer_id
    ) AS payment_counts
    ORDER BY payment_count DESC
    LIMIT 1
);

-- 4. 상관 서브쿼리 :: 서브쿼리가 외부 변수를 참조
SELECT p.customer_id, p.amount, p.payment_date
FROM payment p
WHERE p.amount > (
 SELECT AVG(amount)
 FROM payment
 WHERE customer_id = p.customer_id
);