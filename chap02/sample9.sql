-- sample9.sql


-- ******************************************************
-- SELECT 문의 기본구조와 각 절의 실행순서
-- ******************************************************
--  - Clauses -                 - 실행순서 -
--
-- SELECT clause                    (5) <- SELECT 연산 수행 : 출력할 컬럼들을 결정 
-- FROM clause                      (1) <- 테이블의 행을 하나씩 제공
-- [WHERE clause]                   (2) <- 1차 필터링(조건식) 만약이해가 안된다면 if을 생각하면된다
-- [GROUP BY clause]                (3) <- 끼리끼리 모이자!! ->그룹생성 (1)번에서 내려온데이터들을 한곳으로 모은다
-- [HAVING clause]                  (4) <- 2차 필터링 (조건식) -> 그룹을 필터링하자!! 3번에서 모은것을 다시한테 필터링을 한다
-- [ORDER BY clause]                (6) <- 정렬 수행
-- ******************************************************


-- ------------------------------------------------------
--        *** SELECT 문의 기본문법 구조 ***
-- ------------------------------------------------------
-- SELECT [DISTINCT] { *, column [AS] [alias], ... }
-- FROM <테이블명>
-- WHERE <predicates>
-- ------------------------------------------------------

-- ------------------------------------------------------
-- 1. Logical Operators (논리연산자)
-- ------------------------------------------------------
--  (1) AND (그리고) : 두 조건을 모두 만족하는 경우 TRUE!
--  (2) OR  (또는)  : 두 조건중, 한가지만 만족해도 TRUE!
--  (3) NOT (부정)  : 지정된 조건이 아닌 데이터를 검색
-- ------------------------------------------------------

-- 1. NOT 연산자
SELECT
    last_name,
    job_id,
    salary
FROM
    employees
-- WHERE
--    NOT salary < 20000;
-- WHERE
--    ( NOT salary < 20000 );
WHERE
    NOT ( salary < 20000 );


-- 2. NOT IN 연산자
SELECT
    last_name, 
    job_id,
    salary
FROM
    employees
-- WHERE
--    salary NOT IN ( 9000, 8000, 6000 );
WHERE
    NOT ( salary IN ( 9000, 8000, 6000 ) );


-- 3. NOT LIKE 연산자
SELECT
    last_name,
    job_id,
    salary
FROM
    employees
WHERE
    last_name NOT LIKE 'J%';
-- WHERE
--    NOT last_name LIKE 'J%';
-- WHERE
--    NOT (last_name LIKE 'J%');


-- 4. NOT BETWEEN a AND b 연산자
--   NOT (a <= x <= b) --> (x < a, x > b)
SELECT
    last_name,
    job_id,
    salary
FROM
    employees
WHERE
    salary NOT BETWEEN 2400 AND 20000;
-- WHERE
--    NOT (salary BETWEEN 2400 AND 20000);

SELECT
    last_name,
    job_id,
    salary,
    department_id
FROM
    employees
WHERE
    -- 주의사항: 같은 논리연산자라고 해도, 아래와 같이 우선순위가
    --           정해져 잇습니다:
    --           AND > OR > NOT
    (salary BETWEEN 2400 AND 20000)
    OR ( (job_id = 'IT_PROG') AND (department_id = 60) );



-- 5. IS NULL 연산자 (*******)
SELECT
    last_name,
    job_id,
    salary,
    commission_pct
FROM
    employees
-- WHERE
   -- NULL (결측치, Missing Value)은 비교연산자로 연산불가!!!
   -- commission_pct = NULL;
WHERE
    -- commission_pct IS NULL;
    commission_pct IS NOT NULL;
-- WHERE
--    nvl(commission_pct, -1) = -1;         -- INDEX 사용불가!!!


-- 6. IS NOT NULL 연산자
SELECT
    employee_id,
    last_name,
    salary,
    manager_id
FROM
    employees
WHERE
    -- manager_id IS NOT NULL;
    manager_id IS NULL;

