SELECT
    sum(DISTINCT SALARY),
    sum(All SALARY),
    sum(SALARY)
FROM
    EMPLOYEES;

SELECT
 sum(SALARY),
 avg(DISTINCT salary),
 avg(All salary),
 avg(salary)
FROM
    employees;

SELECT
    max(SALARY),
    max(DISTINCT SALARY),

    min(SALARY),
    min(DISTINCT SALARY)
FROM
    EMPLOYEES;

SELECT
    min( HIRE_DATE),
    max(DISTINCT HIRE_DATE)
FROM
    EMPLOYEES;

SELECT
    count(LAST_NAME),
    count(COMMISSION_PCT)
FROM
    EMPLOYEES;

SELECT
    count(job_id),
    count(DISTINCT JOB_ID)
FROM
    EMPLOYEES;

SELECT
    count(*),
    COUNT(COMMISSION_PCT),
    count(EMPLOYEE_ID)
FROM
    EMPLOYEES;

--여기까지가 4장 1탭터

SELECT
    max(SALARY)
FROM
    employees;

-- SELECT
--     last_name,      -- return 107 values.
--     max(salary)     -- return only 1 value.
-- FROM
--     employees;


--여기까지가 4장 2탭터

SELECT
    DISTINCT DEPARTMENT_ID
    -- count(EMPLOYEE_ID)
FROM
    EMPLOYEES
WHERE
    DEPARTMENT_ID IS NOT NULL;

SELECT
    DEPARTMENT_ID AS 부서,
    avg(SALARY) as 평균월급
FROM
    EMPLOYEES
GROUP BY
    DEPARTMENT_ID
OrDEr BY
    1 ASC;

SELECT
    department_id   AS 부서번호,       
    min(salary)     AS 최소월급,       
    max(salary)     AS 최대월급        
FROM
    employees
GROUP BY
    department_id       
ORDER BY
    부서번호 ASC;

SELECT
    to_char( hire_date , 'YYYY')    As 년,
    to_char( hire_date , 'MM')  AS 월,
    sum(salary)
FROM
    EMPLOYEES
GROUP BY
    TO_CHAR( HIRE_DATE , 'YYYY'),
    TO_char( hire_date , 'MM')
ORDER by
    년 asc;
--여기까지가 4장 3탭터

SELECT
    DEPARTMENT_ID,
    count(salary),
    sum(SALARY)
FROM
    EMPLOYEES
GROUP BY
    DEPARTMENT_ID

HAVING
    sum(salary) >= 90000
ORDER BY
    1 ASc;

SELECT
    DEPARTMENT_ID,
    count(EMPLOYEE_ID)
FROM
    EMPLOYEES
GROUP BY
    DEPARTMENT_ID,
    DEPARTMENT_ID

-- HAVING
--     count(EMPLOYEE_ID) >= 6

-- HAVING
--     min(salary) >= 3000

-- HAVING
--     DEPARTMENT_ID IN (10,20)

-- HAVING
--     DEPARTMENT_ID >10

HAVING
    DEPARTMENT_ID IS NULL
    -- DEPARTMENT_ID NOT IS NULL
ORDER BY
    1 asc;

SELECT
    DEPARTMENT_ID,
    sum(salary)
FROM
    EMPLOYEES
WHERE
    SALARY >= 3000
GROUP BY
    DEPARTMENT_ID
HAVING
    SUM(salary) >= 90000
OrDER BY
    1 ASC;