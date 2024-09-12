-- sample10.sql


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
-- 연산자 우선순위 (The operator's priorities)
-- ------------------------------------------------------
-- (1) 괄호( )
-- (2) 비교 연산자
-- (3) NOT 연산자
-- (4) AND 연산자
-- (5) OR 연산자
--
--  * 우선순위: 괄호( ) > 비교 > NOT > AND > OR
-- ------------------------------------------------------

-- 1. AND 연산자가 우선실행 : 예상치 못한 결과
SELECT
    last_name,
    job_id,
    salary,
    commission_pct
FROM
    employees
WHERE
    -- 1 + 2 * 3 / 4 = ?
    -- job_id ='AC_MGR' OR job_id='MK_REP'
    job_id IN ( 'AC_MGR', 'MK_REP' )
    AND commission_pct IS NULL
    AND salary BETWEEN 4000 AND 9000;
    -- AND salary >= 4000 AND salary <= 9000;

-- 2. 연산자 우선순위 조정(소괄호 이용): 올바른 결과
SELECT
    last_name,
    job_id,
    salary,
    commission_pct
FROM
    employees
WHERE 
    ( job_id ='AC_MGR' OR job_id='MK_REP' )
    AND commission_pct IS NULL
    AND ( salary BETWEEN 4000 AND 9000 )
    -- AND salary >= 4000
    -- AND salary <= 9000;
