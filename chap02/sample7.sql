-- sample7.sql


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
-- 1. LIKE Operators (패턴매칭연산자)
-- ------------------------------------------------------
-- WHERE column LIKE <패턴>
-- ------------------------------------------------------
-- <패턴>에 사용가능한 Wildcard 문자들:
--  (1) %       ( x >= 0,     x: 문자개수 )
--  (2) _       ( x == 1,     x: 문자개수 )
-- ------------------------------------------------------
SELECT
    employee_id,
    last_name,
    salary
FROM
    employees
WHERE
    last_name LIKE 'J%';        -- % : x >= 0 (x: 문자개수)


SELECT
    employee_id,
    last_name,
    salary
FROM
    employees
WHERE
    -- 'aiXXXXX', 'XXXXai', 'XXXXaiYYYY', 'ai'
    last_name LIKE '%ai%';      -- % : x >= 0 (x: 문자개수)


SELECT
    employee_id,
    last_name,
    salary
FROM
    employees
WHERE
    last_name LIKE '%in';       -- % : x >= 0 (x: 문자개수)


-- ------------------------------------------------------

SELECT
    employee_id,
    last_name,
    salary
FROM
    employees
WHERE
    last_name LIKE '_b%';       -- % : x >= 0, _ : x == 1 (x: 문자개수)

-- ------------------------------------------------------


SELECT
    employee_id,
    last_name,
    salary
FROM
    employees
WHERE
    last_name LIKE '_____d';    -- _ : x == 1 (x: 문자개수)


SELECT
    employee_id,
    last_name,
    salary
FROM
    employees
WHERE
    last_name LIKE '%d';        -- % : x >= 0 (x: 문자개수)

-- ------------------------------------------------------


SELECT
    employee_id,
    last_name,
    salary
FROM
    employees
WHERE
    -- last_name LIKE '%';
    -- last_name LIKE '%_%';
    -- last_name LIKE '_';
    -- last_name LIKE '%%%%%%%%%%%%%%%%%%%%%%%%%';
    -- last_name LIKE '%'||?||'%'; -- '%검색어%'

    --  '%_%' '_'  '%%' '%';  -- % : x >= 0, _ : x == 1 (x: 문자개수)
;

SELECT
    employee_id,
    last_name,
    salary,
    job_id
FROM
    employees
WHERE
    -- 탈출문자(Escape Character):
    -- 특수한 의미를 가지는 기호의 기능을 없애는 문자
    -- 를 탈출문자라고 함.
    job_id LIKE '%$_%' ESCAPE '$';      -- % : x >= 0, _ : x == 1 (x: 문자개수)
                -- '%_%' ('_': 일반문자)

SELECT
    employee_id,
    last_name,
    salary,
    job_id
FROM
    employees
WHERE
    job_id LIKE '%E___' ESCAPE 'E';     -- % : x >= 0, _ : x == 1 (x: 문자개수)




