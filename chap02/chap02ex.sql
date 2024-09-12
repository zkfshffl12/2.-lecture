--Select *
--FROM employees;

--SELECT *
--from DEPARTMENTS;

--DELETE EMPLOYEES;   --  풀문장
DESC employees;       --  축양형

--SELECT
--    employee_id,
--    last_name,
--    hire_date,
--    salary
--FROM
--    employees;


--SELECT
--    salary,
--    salary + 100
--FROM employees;

--SELECT
--    SALARY,
--    salary -100
--FROM
--EMPLOYEES;

--SELECT
--    SALARY,
--    SALARY *100
--FROM
--EMPLOYEES;

--SELECT
--    SALARY,
--    SALARY /100
--FROM
--employees;

--SELECT
--    LAST_NAME,
--    SALARY,
 --   SALARY *12
--FROM
--employees;

Desc DUAL;

SELECT * FROM dual;

SELECT
    245*567
FROM
    dual;

Desc sys.DUAL;
Desc dual;

SELECT
    *
        DUAL;   --동의어

SELECT
    *
FROM
    sys.dual;   --보안상 접근재어를 완화시킨것!!!
-- 여기까지가 2장1챕터

SELECT
    last_name,
    salary,
    salary*12
FROM
    employees;

SELECT
    last_name As 이름,
    salary AS 월급,
    salary *12 As 연봉
FROM
    employees;

SELECT
    last_name As "사원 이름",
    salary AS "사원 월급",
    salary *12 AS "연   봉"
    FROM
        EMPLOYEES;

SELECT
    EMPLOYEE_ID,
    LAST_NAME,
    job_id,
    COMMISSION_PCT
FROM
    EMPLOYEES;


SELECT
    last_name AS 이름,
    salary AS 월급,
    commission_pct AS 수수료,
    SALARY *12 기본연봉,
    (salary*12)*(1+(commission_pct/100)) AS "연봉1",
    (salary*12)+((salary*12)*(commission_pct/100)) AS "연봉2"
FROM
    employees;

SELECT
    LAST_NAME 이름,
    salary 월급,
    COMMISSION_PCT 수수료,
    SALARY * 12 +nvl(COMMISSION_PCT,0) As 연봉
FROM
    EMPLOYEES;

---------여기가 2장2챕터

SELECT
    last_name || salary AS "이름 월급"
FROM
   EMPLOYEES;

SELECT 
    LAST_NAME || HIRE_DATE As "이름 날짜"
FROM
    EMPLOYEES;

SELECT
    LAST_NAME || '사원'
FROM
    EMPLOYEES;

SELECT
    LAST_NAME || '의 직무는 ' || JOB_ID || '입니다' AS "사원별 직무"
FROM
    EMPLOYEES;

SELECT
    LAST_NAME || '의 직무는' || JOB_ID, FIRST_NAME
FROM
    EMPLOYEES
WHERE   -- 1차 필터링 : 행을 필터링
    LAST_NAME ='Smith';  --= : 동등비교연산자

SELECT

/*
오라클에서는 아래와 같이 DB 기분으로 날짜와 시간값을 반환하는
함수로, (1)sysdatr  (2)SYSTIMESTAMP
        (3)CURRENT_DATE (4)CURRENT_TIMESTAMP 가 있습니다
    중요한것은 이 4개가 모두 "함수" 입니다
*/

/*
    오라클에서는 "강제형변환(casting)" 아래와 같이 함수를 제공합니다
    (1) TO_CHAR(column, 'format') : 문자데이터로 변환
    (2) TO_number(column, 'format') : 숫자데이터로 변환
    (3) TO_date(column, 'format') : 날짜데이터로 변환
*/
    TO_CHAR(CURRENT_DATE, 'yyyy/mm/dd HH24:MI:SS') AS T1,
    TO_CHAR(CURRENT_TIMESTAMP, 'yyyy/mm/dd HH24:MI:SS') AS T2,
    TO_CHAR(SYSDATE, 'yyyy/mm/dd HH24:MI:SS') AS T3,
    TO_CHAR(SYSTIMESTAMP, 'yyyy/mm/dd HH24:MI:SS') AS T4
FROM
    dual;

---------여기가 2장3챕터

SELECT
    JOB_ID
FROM
    EMPLOYEES;
 ---이거는 중복허용

 SELECT
    DISTINCT JOB_ID
FROM
    EMPLOYEES;

SELECT
    --DISTINCT *
    DISTINCT LAST_NAME, FIRST_NAME
FROM
    EMPLOYEES;


--현재의 세션(즉 물리적인 연결)에만 적용된다
--다른말로 하면 다른 세션에서는 적용되지 않는다!!
ALTER session Set NLS_DATE_FORMAT ='yyyy-MM-DD hh24:mi:ss';

SELECT
    CURRENT_DATE
    CURRENT_TIMESTAMP

FROM
    dual;


-- ALTER SESSION set NLS_TIME_FORMAT='yyyy-MM-DD hh24:mi:ss'
-- SELECT
--      CURRENT_DATE,
--     CURRENT_TIMESTAMP

-- FROM
--     dual;
--여기까지가 2장4챕터

SELECT
    EMPLOYEE_ID,
    LAST_NAME,
    JOB_ID,
    SALARY
FROM
    EMPLOYEES
WHERE
    SALARY >='10000';

SELECT

--Empty table 비어있는 행을 mt table 이라고 부른다


    EMPLOYEE_ID,
    LAST_NAME,
    JOB_ID,
    SALARY
FROM
    EMPLOYEES

WHERE
    LAST_NAME='king';

WHERE
    LAST_NAME='KING';

SELECT
    EMPLOYEE_ID,
    LAST_NAME,
    SALARY,
    HIRE_DATE   --채용일자
FROM
    EMPLOYEES

WHERE
--  hire_date>'07/12/31';
--  hire_date>'31-DEC-07';
-- WHERE
-- --강제형변환 함수: to_date(column, format)
-- hire_date>to_date('07/12/31', 'RR/MM/DD'); --for Developer
HIRE_DATE>TO_DATE('31-DEC-07', 'DD-MON-RR'); --for VSCODE

--여기까지가 2장5챕터

SELECT
    EMPLOYEE_ID,
    LAST_NAME,
    salary,
    HIRE_DATE
FROM
    EMPLOYEES
WHERE
    EMPLOYEE_ID IN (100, 200, 300);

SELECT
    EMPLOYEE_ID,
    LAST_NAME,
    salary,
    HIRE_DATE
FROM
    EMPLOYEES
WHERE
    EMPLOYEE_ID = 100
    OR EMPLOYEE_ID = 200
    OR EMPLOYEE_ID = 300;

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
    last_name IN ('King', 'Abel', 'Jones');

ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';

SELECT
    EMPLOYEE_ID,
    LAST_NAME,
    SALARY,
    HIRE_DATE
FROM
    EMPLOYEES
WHERE
    HIRE_DATE IN (
        TO_DATE('01/01/13', 'RR/MM/DD'),
        TO_DATE('07/02/07', 'RR/MM/DD')
    );

SELECT
    employee_id,
    last_name,
    salary
FROM
    employees
WHERE
    LAST_NAME LIKE 'J%';

SELECT
    employee_id,
    last_name,
    salary
FROM
    employees
WHERE
    last_name LIKE '_____d';

SELECT
    EMPLOYEE_ID,
    LAST_NAME,
    SALARY,
    COMMISSION_PCT
FROM
    EMPLOYEES;

WHERE
    --last_name Like '%';
    --COMMISSION_PCT Like '%';
    --LAST_NAME LIKE '%_%' -- last_name >= 1
    --last_name LIKE '_'; --last_name ==>
    --LAST_NAME LIKE '%%%%%%%%%%%%%%';
    -- LAST_NAME LIKE '%||king||%'; -- '%검색(ai)%'
    -- LAST_NAME Like '%ai%'; -- '%검어(ai)%'

    -- '%_%' '_'  '%%' '%';  -- % : x >= 0, _ : x == 1 (x: 문자개수)

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
    job_id LIKE '%$_%' ESCAPE '$';

SELECT
    employee_id,
    last_name,
    salary,
    job_id
FROM
    employees
WHERE
    job_id LIKE '%E___' ESCAPE 'E';

----여기까지가 2장7챕터

SELECT
    LAST_NAME,
    JOB_ID,
    SALARY
FROM
    EMPLOYEES
WHERE
    (JOB_ID = 'IT_PROG')
    AND (SALARY >= 5000);

SELECT
    LAST_NAME,
    JOB_ID,
    SALARY
FROM
    EMPLOYEES
WHERE
    -- JOB_ID = 'IT_PROG'
    -- OR SALARY >= 5000;
    -- NOt JOB_ID = 'IT_PROG' OR SALARY >= 5000;
    -- NOt (JOB_ID = 'IT_PROG' OR SALARY >= 5000);
    --NOT (JOB_ID = 'IT_PROG') OR SALARY >= 5000;
    NOT (JOB_ID = 'IT_PROG') OR NOT SALARY >= 5000;

    --여기까지가 2장8챕터

    SELECT
        last_name,
        JOB_ID,
        SALARY
    FROM
        EMPLOYEES
    -- WHERE
    -- Not SALARY <20000;
    --WHERE
        -- (not SALARY < 20000);
    WHERE
    NOT (SALARY < 20000);


SELECT
    LAST_NAME,
    JOB_ID,
    SALARY
FROM
    EMPLOYEES
-- WHERE
    -- SALARY NOT IN (9000,8000,6000);
WHERE
    not (SALARY in (9000,8000,6000));

SELECT
    LAST_NAME,
    JOB_ID,
    SALARY
FROM
    EMPLOYEES
-- WHERE
--     LAST_NAME NOt LIKE 'j%';
WHERE
    not LAST_NAME like 'j%';
-- WHERE
--     NOT (last name LIKE 'j%')

SELECT
    LAST_NAME,
    JOB_ID,
    SALARY
FROM
    EMPLOYEES
-- WHERE 
--     SALARY BETWEEN 2400 and 20000;
-- WHERE
    -- SALARY not BETWEEN 2400 and 20000;
WHERE
    not (SALARY BETWEEN 2400 and 20000);

SELECT
    LAST_NAME,
    JOB_ID,
    SALARY,
    DEPARTMENT_ID
FROM
    EMPLOYEES
WHERE
    -- 주의사항:

    (salary BETWEEN 2400 AND 20000)
    OR ( (job_id = 'IT_PROG') AND (department_id = 60) );

SELECT
LAST_NAME,
JOB_ID,
SALARY,
commission_pct
FROM
    EMPLOYEES
--  WHERE
--  NULL(결측치 Missing Value)은 비교연산지로 연산불가
--    -- COMMISSION_PCT=NUll;
--    -- COMMISSION_PCT^=NUll;
--     COMMISSION_PCT<>NUll;
-- COMMISSION_PCT is not null;
-- WHERE
    -- COMMISSION_PCT is null;
-- COMMISSION_PCT is not null;
WHERE
    -- nvl(COMMISSION_PCT, -1)= -1; --  영업수수가 없는 사원만 추출
    --nvl(COMMISSION_PCT, -1)!= -1; --  영업수수가 있는 사원만 추출
    nvl(COMMISSION_PCT, -1)>= 0.0;--  영업수수가 있는 사원만 추출

SELECT
    EMPLOYEE_ID,
    LAST_NAME,
    SALARY,
    MANAGER_ID
FROM
    EMPLOYEES
    WHERE
    MANAGER_ID is not null;
    -- MANAGER_ID is  null;
-- 여기까지가 2장 9챕터

SELECT
    LAST_NAME,
    JOB_ID,
    SALARY,
    COMMISSION_PCT
FROM
    EMPLOYEES
WHERE
    -- JOB_ID IN ('AC_MGR', 'MK_REP')
    JOB_ID='AC_MGR'Or JOB_ID='MK_REP'
    and COMMISSION_PCT is NULL
    -- and SALARY BETWEEN 4000 and 9000;
    and (SALARY BETWEEN 4000 and 9000);

    --여기까지가 2장10챕터

SELECT
    employee_id,
    last_name,
    job_id,
    salary
FROM
    EMPLOYEES
--order BY
  --  SALARY; -- default: ASc(오름차순 정렬)
--   order BY
--   salary  asc; --salary: ASc(오름차순 정렬)

order BY
    SALARY desc;    --(내림차순정렬)

SELECT
    EMPLOYEE_ID,
    LAST_NAME,
    JOB_ID,
    SALARY + 100 As 월급
FROM
    EMPLOYEES
order BY
     월급 desc;

-- order BY
--     SALARY + 100 DESC;

SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    JOB_ID,
    SALARY AS "월급"
    FROM
    EMPLOYEES
    --다른 대안이 없는 경우에만 쓸 것!!(부작용)
    --(Select절의 구성컬럼목록에 변경이 없다 라는 조전하에 ...)

    order by
    4 DESC;

 SELECT
    EMPLOYEE_ID,
    LAST_NAME AS 이름,
    JOB_ID,
    SALARY
FROM
    EMPLOYEES
order BY
    LAST_NAME ASc -- 컬럼명 정렬
-- order by 
-- 이름 asc;    --컬럼별칭으로 정렬
-- order BY
--     2 ASc; --컬럼인덱스로 정렬

Alter session set NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:ss';

SELECT
    EMPLOYEE_ID,
    LAST_NAME,
    SALARY,
    HIRE_DATE AS 입사일
FROM
    EMPLOYEES
ORDER BY
   HIRE_DATE asc;
-- order BY
--     입사일 DEsc;
-- order BY
--     4 DESC;

ALTER session set 

SELECT
    EMPLOYEE_ID,
    LAST_NAME,
    SALARY,
    HIRE_DATE
FROM
    EMPLOYEES
order BY
    SALARY DESc,    -- 컬럼명1로 내림차순 정렬
    HIRE_DATE;  -- 컬럼명2로 오름차순 정렬

SELECT
    EMPLOYEE_ID,
    LAST_NAME,
    SALARY,
    HIRE_DATE
FROM
    EMPLOYEES
order BY
    3 Desc,
    4;

SELECT
 EMPLOYEE_ID
 LAST_NAME
 COMMISSION_PCT
 FROM
 EMPLOYEES
 order BY
    COMMISSION_PCT DESC;

-- 여기가2장 11챕터끝