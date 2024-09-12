SELECT
    SALARY
FROM
    EMPLOYEES
WHERE
    last_name = 'Whalen';

SELECT
    LAST_NAME,
    SALARY
FROM
    EMPLOYEES
WHERE
    SALARY >4400;

SELECT
    LAST_NAME,
    SALARY
FROM
    EMPLOYEES
WHERE

salary >(

    SELECT SALARY
    from EMPLOYEES
    WHERE last_name = 'Whalen'
);

--여기까지가 6장1챕터

SELECT
    LAST_NAME,
    SALARY
    (SELECT avg(salary) FROM EMPLOYEES) AS 평균급여
FROM
    EMPLOYEES
WHERE
    --메인쿼이: 단일행 서브쿼리가 사용되었으므로 단일값과 비교가능한 비교연산자 사용가능
    SALARY >= (
        -- 단일 행 비상관 서브쿼리 모든 사원의 평균 월급여 반환
        -- 메인쿼리로 결과값 전달

        SELECT avg(SALARY)
        FROM EMPLOYEES
    );

SELECT
    LAST_NAME,
    SALARY
FROM
    EMPLOYEES
WHERE

    SALARY = (

        SELECT max(salary)
        FROM EMPLOYEES
        WHERE DEPARTMENT_ID = 100
    );

SELECT

    department_id,
    min(salary)
FROM
    EMPLOYEES
GROUP BY
    DEPARTMENT_ID
HAVING

    min(salary)>(

        SeLECT max(salary)
        FROM EMPLOYEES
        WHERE DEPARTMENT_ID = 100

    );

SELECT
    last_name,
    salary,
    hire_date
FROM
    employees
WHERE
    -- 메인쿼리 1차 필터링: 단일행 서브쿼리가 사용되었으므로, 단일 값과 비교가능한, 비교연산자 사용가능
    hire_date > (
        -- 단일 행 비상관 서브쿼리: Whalen의 채용일자 반환
        -- 메인쿼리로 결과값 전달
        SELECT hire_date
        FROM employees
        WHERE last_name = 'Whalen'
    );

SELECT
    e.employee_id As 사번,
    e.last_name AS 이름,
    e.manager_id AS 관리자사번,

    ( SeLECT LAST_NAME
      FROM  EMPLOYEES m
      WHERE m.EMPLOYEE_ID = e.manager_id)
      AS 관리자명
FROM
    employees e;

--여기까지가 6장2챕터

SELECT
    SALARY
FROM
    EMPLOYEES
WHERE

    last_name = 'Whalen' OR LAST_NAME = 'fay';

SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary IN (6000, 4400);


SELECT
    last_name,
    salary
FROM
    employees
WHERE
-- 메인쿼리: 복수행 서브쿼리가 사용되었으므로, 
    -- 복수 값과 연산가능한 연산자 사용가능 (IN)
    -- salary IN (
    -- 복수행에 단일행 연산자 사용한 경우: 오류 잘 확인!
    --  ORA-01427: single-row subquery returns more than one row
    -- salary = (6000, 4400);

--salary=(6000,4400);
salary = (
    -- 복수 행 비상관 서브쿼리: 'whalen' 와 'FAY' 월급여 반환
    --메인쿼리로 결과값 전달
    SELECT salary
    FRom employees
    WHERE last_name IN('whalen', 'Fay')
);

SELECT
    LAST_NAME,
    DEPARTMENT_ID,
    SALARY
FROM
    EMPLOYEES
WHERE

    DEPARTMENT_ID IN (

        SELECT
            DEPARTMENT_ID
        FROM
            EMPLOYEES
        WHERE
            salary > 13000
    )

SELECT
    SALAR
FROM
    EMPLOYEES
WHERE
    job_id = 'IT_PROG'
ORDER BY
    1 ASC;

SELECT
    LAST_NAME,
    DEPARTMENT_ID,
    SALARY
FROM
    EMPLOYEES
WHERE

salary < ALL (
    /*
        메인쿼리1 ; 복수행 서브쿼리가 사용되었으므로 복수 값과 연산가능한 연산자 사용가능

        아래조건은 단일 값 연산자인 비교연산자(<) 사용 ==> *오류발생*
        왜? 오라클 입장에서는 여러 월급 중에서 관연 어떤 월급보다 작아야 하는지
        판단할 수 없기 때문
        -- ORA-01427: single-row subquery returns more than one row
        SALARY

        메인쿼스트2; 복수행 서브쿼리가 사용되었으므로 복수 값과 연산가능한 연산자 사용가능한

        아래조건은 단일값 연산자인 비교연산자(<) -->
    */
    SELECT SALARY
    FROM EMPLOYEES
    WHERE job_id = 'IT_PROG'
);

SELECT
    last_name,
    DEPARTMENT_ID,
    SALARY
FROM
    EMPLOYEES
WHERE

salary >ALL (
    SELECT SALARY
    FRom EMPLOYEES
    where job_id = 'IT_PROG'

);

SELECT
    LAST_NAME,
    DEPARTMENT_ID,
    SALARY
FROM
    EMPLOYEES
WHERE

    SALARY < ALL (
        SELECT SALARY
        FROM EMPLOYEES
        WHERE job_id = 'IT_PROG'
    );

SELECT
    LAST_NAME,
    DEPARTMENT_ID,
    SALARY
FROM
    EMPLOYEES
where
    salary < ANY(
        SeLECT SALARY
        FROM    EMPLOYEES
        WHERE   job_id = 'IT_PROG'
    );

    SELECT
        LAST_NAME,
        DEPARTMENT_ID,
        SALARY,
        COMMISSION_PCT
    FROM
        EMPLOYEES
WHERE
    ExisTs(
        SELECT distinct 1
        FRom EMPLOYEES
        WhERE COMMISSION_PCT IS NOT NULL


        /*
        자바 빈문자열 은? 하나의 문자로 없는 문자열 =>에: ""

        EXCEPT 연산자는 오른쪽에 나오는 피연산자인 
        복수행 서브쿼리의 결과셋이
        (1) IF empty result set do NOT run main query
        */

    );

SELECT
    LAST_NAME,
    DEPARTMENT_ID,
    SALARY
FROM
    EMPLOYEES
WHERE

    exists(
        SELECT 1
        FRom EMPLOYEES
        WHEre salary > 30000
    );

SELECT
    LAST_NAME.
    DEPARTMENT_ID,
    SALARY
FROM

    ALL(
        SELECT 1
        FROM deoartnebt_id
        WHERE DEPARTMENT_ID Is NULL
    );

-- 여기까지가 5장3정
SELECT
    LAST_NAME,
    DEPARTMENT_ID,
    SALARY
FROM
    EMPLOYEES
WHERE

-- ( DEPARTMENT_ID, SALARY ) In (
( DEPARTMENT_ID, SALARY, SALARY) IN (

    SELECT department_id, max(salary)
    -- SELECT DEPARTMENT_ID, max(salary), min(salary)
    FRom EMPLOYEES
    GROUP BY DEPARTMENT_ID
)
ORDER BY
    2 asc;

SELECT
    e.department_id,
    SUM(SALARY)AS 총합,
    avg(salary) AS 평균,
    count(EMPLOYEE_ID) AS 인원수
FROM

    EMPLOYEES e,
    DEPARTMENTS d
WhERE
    e.DEPARTMENT_ID = d.department_id
GROUP BY
    e.DEPARTMENT_ID
ORDER BY
    1 ASC;

SELECT e.department_id, d.department_name, 총합, 평균, 인원수
FROM
    -- CROSS JOIN(== Cartesian Product) Size: 12 x 27 = 324    
    (   -- 인라인 뷰(Inline View) 크기: 12 x 4 shape
        SELECT department_id, sum(salary) AS 총합, 
               avg(salary) AS 평균, count(employee_id) AS 인원수
        FROM employees
        GROUP BY department_id
    ) e,
    -- departments d   -- 부서크기: 27
    (SELECT department_id, department_name
     FROM departments) d
WHERE
    e.department_id = d.department_id       -- 조인조건(공통컬럼지정)
ORDER By
    1 ASC;

---------------------

SELECT *
FROM (
    SeLECT employee_id, last_name , PHONE_NUMBER
    FROM EMPLOYEES
    where COMMISSION_PCT is NOT NUll
) t

