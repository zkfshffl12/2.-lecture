-- sample6.sql


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
-- 1. IN Operators (집합연산자)
-- ------------------------------------------------------
-- WHERE column IN ( value1, value2, ... )
-- ------------------------------------------------------
SELECT
    employee_id,
    last_name,
    salary,
    hire_date
FROM
    employees
-- WHERE
--     employee_id IN ( 100, 200, 300 );

-- 수학의 집합의 성질을 기억해야 합니다!!!
-- (중복 비허용, 순서를 보장하지 않는다!) 
WHERE
   employee_id IN ( 100, 100, 200, 200, 300);    -- 집합원소유형: 1. 숫자


SELECT
    employee_id,
    last_name,
    salary,
    hire_date
FROM
    employees
WHERE
    -- 참고: 논리연산자 (AND, OR, NOT) = (그리고, 또는, 부정)
    -- 아래의 조건식이, 
    -- 바로 위에서 연습한 집합연산자 IN (100,200,300)의 판단과 동일
    employee_id = 100
    OR employee_id = 200
    OR employee_id = 300;


SELECT
    employee_id,
    first_name,
    last_name,
    job_id,
    salary,
    hire_date
FROM
    employees
WHERE
    last_name IN ('King', 'Abel', 'Jones');         -- 집합원소유형: 2. 문자열

ALTER SESSION SET nls_date_format = 'RR/MM/DD';

SELECT
    employee_id,
    last_name,
    salary,
    hire_date
FROM
    employees
-- WHERE
--    hire_date IN ( '01/01/13', '07/02/07' );        -- 집합원소유형: 3. 날짜, OK only on the Oracle SQL*Developer

WHERE
    hire_date IN (
        -- to_date('문자열', '날짜포맷') 함수 => 문자열 -> 날짜 데이터로 강제형변환
        to_date('01/01/13', 'RR/MM/DD'), 
        to_date('07/02/07', 'RR/MM/DD')
    );
