-- sample4.sql


-- ******************************************************
-- SELECT 문의 기본구조와 각 절의 실행순서
-- ******************************************************
--  - Clauses -                 - 실행순서 -
--
-- SELECT clause                        (5)
-- FROM clause                          (1)
-- [ WHERE clause ]                     (2)
-- [ GROUP BY clause ]                  (3)
-- [ HAVING clause ]                    (4)
-- [ ORDER BY clause ]                  (6)
-- ******************************************************


-- ------------------------------------------------------
-- 4. 다중컬럼 Sub-query
-- ------------------------------------------------------
--  가. 서브쿼리에서, 여러 컬럼을 조회하여 반환
--  나. 메인쿼리의 조건절에서는, 서브쿼리의 여러 컬럼의 값과 일대일
--      매칭되어 조건판단을 수행해야 함.
--  다. 메인쿼리의 조건판단방식에 따른 구분:
--      (1) Pairwise 방식
--          컬럼을 쌍으로 묶어서, 동시에 비교
--      (2) Un-pairwise 방식
--          컬럼별로 나누어 비교, 나중에 AND 연산으로 처리
-- ------------------------------------------------------
-- * Please refer to the chapter 06, page 21.
-- ------------------------------------------------------

SELECT
    last_name,
    department_id,
    salary
FROM
    employees
WHERE
    -- 메인쿼리: 복수행 서브쿼리가 사용되었으므로, 복수 값과 연산가능한 연산자 사용가능 (IN)
    --
    -- 컬럼을 쌍으로 묶어서, 동시에 비교 (**Pairwise 방식**)
    -- 동시에 만족하는 경우에만 참(true)으로 판단.
    --
    -- 결과적으로, 부서별로 가장 많은 월급여를 받는 사원정보 조회
    -- ex: ( department_id, salary ) IN ( (40, 6500), (110, 12008), .... )

    -- ( department_id, salary ) IN (
    ( department_id, salary, salary ) IN (          -- OK
        -- 복수 행 비상관 서브쿼리: 각 부서별, 최대 월급여 반환
        -- 메인쿼리로 결과값 전달
        -- SELECT department_id, max(salary)
        SELECT department_id, max(salary), min(salary)
        FROM employees
        GROUP BY department_id  -- NULL 그룹도 포함!!
    )
ORDER BY
    2 ASC;