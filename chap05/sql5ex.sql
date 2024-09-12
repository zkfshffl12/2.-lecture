SELECT
    LAST_NAME,
    DEPARTMENT_ID
FROM
    EMPLOYEES
OrDER BY
 2 ASC;

 DESC DEPARTMENTS;

 SELECT
    DEPARTMENT_ID,
    DEPARTMENT_NAME
FROM
    DEPARTMENTS
OrDER BY
    1 ASC;

SELECT
    LAST_NAME,
    DEPARTMENT_ID
FROM
    EMPLOYEES
WHERE
    last_name = 'Whalen';

SELECT
    DEPARTMENT_NAME
FROM
    DEPARTMENTS
WHERE
    DEPARTMENT_ID = 10;

--여기까지가 5장1챕터

SELECT
    count(EMPLOYEE_ID) --107
FROM
    EMPLOYEES;

SELECT
    count(DEPARTMENT_ID)    --27
FROM
    DEPARTMENTS;

SELECT
    107*27
FROM
    dual;

SELECT
    -- -- count(*) --2889
    -- 107 * 27
    *
FROM
    EMPLOYEES,
    DEPARTMENTS;

SELECT
    LAST_NAME,
    DEPARTMENT_NAME
FROM
    EMPLOYEES,
    DEPARTMENTS
WHERE
    LAST_NAME = 'Abel';

SELECT

LAST_NAME,
EMPLOYEES.DEPARTMENT_ID,
DEPARTMENTS.DEPARTMENT_ID,
DEPARTMENT_NAME
FROM
    EMPLOYEES,
    DEPARTMENTS
WHERE

     --DEPARTMENT_ID= DEPARTMENT_ID --

    employees.DEPARTMENT_ID= DEPARTMENTS.DEPARTMENT_ID   --되는거

    AND LAST_NAME = 'Abel';

SELECT
    LAST_NAME
        DEPARTMENT_NAME,
        DEPARTMENTS.DEPARTMENT_ID
FROM
    EMPLOYEES,
    DEPARTMENTS
WHERE
    EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

SELECT
    LAST_NAME
    DEPARTMENT_NAME,
    EMPLOYEES.DEPARTMENT_ID
FROM
    EMPLOYEES,
    DEPARTMENTS
WHERE
    EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

SELECT
    emp.last_name,
    DEPARTMENT_NAME,
   emp.DEPARTMENT_ID
FROM
    EMPLOYEES emp,
    DEPARTMENTS dept
WHERE
    EMP.DEPARTMENT_ID = dept.DEPARTMENT_ID;

SELECT
emp.last_name,
SALARY,
DEPARTMENT_NAME,
emp.department_id,
dept.department_id
FROM
    EMPLOYEES emp,
    DEPARTMENTS dept

-- WHERE
--     emp.DEPARTMENT_ID = dept.DEPARTMENT_ID
--     AND last_name='whalen';

-- WHERE
--     dept.DEPARTMENT_ID = emp.DEPARTMENT_ID;
--     AND LAST_NAME ='whalen';

WHERE
last_name='Whalen'
AND emp.DEPARTMENT_ID = dept.DEPARTMENT_ID;

SELECT
DEPARTMENT_NAME AS 부서명,
count(EMPLOYEE_ID)AS 인원수
FROM
    EMPLOYEES e,
    DEPARTMENTS d
WHERE
    e.DEPARTMENT_ID = d.DEPARTMENT_ID
    AND TO_CHAR(hire_date , 'YYYY') <= 2005
GROUP BY

DEPARTMENT_NAME;

DROP TABLE job_grades PURGE;

CREATE TaBLE job_grades{
    grade_level VARCHAR2(3)
        CONSTRAINT job_gra_level_pk PRIMARY KEY,
    lowest_sal NUMBER,
    highet_sal NUMBER
};

DESC JOb_grades;

INSERT INTO job_grades VALUES('A', 1000, 2999);
INSERT INTO job_grades VALUES('B', 3000, 5999);
INSERT INTO job_grades VALUES('C', 6000, 9999);
INSERT INTO job_grades VALUES('D', 10000, 14999);
INSERT INTO job_grades VALUES('E', 15000, 24999);
INSERT INTO job_grades VALUES('F', 25000, 40000);

COMMIT;

DEsC job_grades;

SELECT * FROM job_grades;

SELECT
    LAST_NAME,
    SALARY,
    grade_level,
    lowest_sal,
    highest_sal
FROM
    EMPLOYEES e,
    job_grades g 
-- WHERE
-- e.SALARY BETWEEN g.lowest_sal AND g.highest_sal;

WHERE
    LAST_NAME = 'whalen'
    AND
        g.grade_level IN (
            CASE
            WHEN (SALARY >= 1000 and SALARY <= 2999) THEN 'A'
            WHEN (SALARY >= 3000 and SALARY <= 5999) THEN 'B'
            WHEN (SALARY >= 6000 and salary <= 9999) THEN 'c'
            WHEN (salary >= 10000 and SALARY <= 14999) THEN 'D'
            WHEN (SALARY >= 15000 and SALARY <= 24999) THEN 'E'
            WHEN (SALARY >= 25000 and SALARY <= 40000) THEN 'F'
        END
    );

SELECT
    LAST_NAME.
    SALARY,
    DEPARTMENT_NAME,
    grade_level
FROM
    EMPLOYEES e,
    DEPARTMENTS d,
    job_grades g
WHERE
    e,E.DEPARTMENT_ID = d.DEPARTMENT_ID
    AND e.SALARY BETWEEN g.lowest_sal AND g.highest_sal;

SELECT
    LAST_NAME,
    EMPLOYEE_ID,
    MANAGER_ID
FROM
    EMPLOYEES
WHERE
    last_name = 'Hunold';

SELECT
    EMPLOYEE_ID,
    MANAGER_ID,
    LAST_NAME
FROM
    EMPLOYEES
WHERE
    EMPLOYEE_ID = 102;

SELECT EMPLOYEE_ID, LAST_NAME
FROM EMPLOYEES e
ORDER By 1 ASC;

SELECT
    e.employee_id AS 사번,
    e.last_name AS 사원명,
    e.manager_id AS 멘토사번,
    m.employee_id AS 멘토테이블의사번,
    m.last_name AS 멘토테이블의사원명
FROM
    employees e,
    employees m
WHERE
    e.manager_id = m.employee_id;    

SELECT
    e.employee_id AS 사번,
    e.last_name As 사원명,
    e.manager_id AS 관리자사번,
    m.last_name AS 관리자명
FROM
    EMPLOYEES e,
    EMPLOYEES m
WHERE
    e.MANAGER_ID = m.EMPLOYEE_ID;

SELECT *
FROM EMPLOYEES
WHERE MANAGER_ID IS NUll;

SELECT
    e.employee_id As 사원번호,
    e.last_name AS 사원명,
    e.manager_id AS 관리자사번,

    m.*
FROM
    EMPLOYEES e,
    EMPLOYEES m
WHERE
   -- e.MANAGER_ID = m.EMPLOYEE_ID(+) ;
    e.MANAGER_ID (+)= m.EMPLOYEE_ID ;

    --사원테이블에서 고유한 관리자사번의 개수 추출

-- SELECT
--     DISTINCT
--    -- All MANAGER_ID
-- FROM
--     EMPLOYEES
-- WHERE
--     MANAGER_ID Is Not NUL;

--여기까지가 5장2챕터

SELECT
    COUNT(*)
FROM
    EMPLOYEES CROSS JoIn DEPARTMENTS;

    SELECT
    LAST_NAME,
    DEPARTMENT_NAME
FROM
    EMPLOYEES CRoss JOIN DEPARTMENTS
WHERE
    last_name = 'abel';

SELECT
t1.last_name,   -- ok 테이블 별칭 을 통한 컬럼 지정
--  LAST_NAME   -- ok t1 에만 있는 컬럼이므로 모호성 없음

t2.department_name, --ok 테이블 벌침 을 통한 컬럼 지정 
-- department_name  -- ok t2에만 있는 컬럼이므로 모호성 없음

t1.manager_id,  --ok 테이블 벌침(t1)을 통한 컬럼 지정
-- manager_id   -- xx ORA-00918: 열의 정의가 애매합니다

t2.department_id    -- OK: 테이블 별침(t2)을 통한 컬럼 지정
-- department_id    -- XX: ORA-00918: 열의 정의가 애매합니다

FROM
    EMPLOYEES t1 JoIn DEPARTMENTS t2;


SELECT
    LAST_NAME,
    EMPLOYEES.DEPARTMENT_ID,
    DEPARTMENTS.MANAGER_ID,
    EMPLOYEES.MANAGER_ID,
    DEPARTMENTS.MANAGER_ID,
    DEPARTMENT_NAME
FROM
    EMPLOYEES,
    DEPARTMENTS

    EMPLOYEES.department_id = DEPARTMENTS.DEPARTMENT_ID
    ANd EMPLOYEES.MANAGER_ID = DEPARTMENTS.MANAGER_ID;

SELECT
    LAST_NAME,
    DEPARTMENT_ID,
    MANAGER_ID,
    DEPARTMENT_NAME
FROM
    EMPLOYEES NATURAL join DEPARTMENTS;

SELECT
    t2.department_name
FROM

    EMPLOYEES t1 NATURAL JOIN DEPARTMENTS t2;

SELECT
    t1.last_name,
    t2.department_name,

    MANAGER_ID

FROM
    EMPLOYEES t1 Natural JOIN DEPARTMENTS t2;


SELECT
    t1.LAST_NAME,
    T1.LAST_NAME

    t2.DEPARTMENT_NAME,
    department_name,

    T1.DEPARTMENT_ID
    t2.DEPARTMENT_ID
--*

FROM
    EMPLOYEES t1 INNER JOIN DEPARTMENTS t2

    USING(DEPARTMENT_ID);

SELECT
    LAST_NAME,
    DEPARTMENT_NAME,

    DEPARTMENT_ID,

    t1.manager_id AS 사원의 관리자사번,
    t2.MANAGER_ID AS 부서장사번

    FROM
    EMPLOYEES t1 INNER JOIN DEPARTMENTS T2

    Using(DEPARTMENT_ID)
WHERE
    DEPARTMENT_ID = 90;

SELECT

-- t1.LAST_NAME,
-- LAST_NAME,

-- t2.DEPARTMENT_NAME
-- department_name

-- --DEPARTMENT_ID 오류 정의가 너무 애매합ㄴ다

-- t1.DEPARTMENT_ID
-- t2.DEPARTMENT_ID

*

FROM
EMPLOYEES t1 INNER JOIN DEPARTMENTS T2

ON t1.DEPARTMENT_ID = t2.DEPARTMENT_ID;

SELECT
e.last_name AS 사원명,
m.last_name AS 관리자명
FROM
    EMPLOYEES e INNER JOIN EMPLOYEES M
    ON e.MANAGER_ID = m.EMPLOYEE_ID;

SELECT
    e.last_name AS 사원명,
    d.department_name AS 부서명,
    g.grade_level AS 등급
FROM
    -- employees e INNER JOIN departments d -- INNER 키워드 생략가능
    -- ON e.department_id = d.department_id
    
    INNER JOIN job_grades g                     -- INNER 키워드 생략가능
    ON e.salary BETWEEN g.lowest_sal AND g.highest_sal; -- Non-equal 조인조건

SELECT
    e.last_name AS 사원명,
    d.department_name AS 부서명,
    g.grade_level AS 등급,
    -- d.department_id AS 부서번호 -- xx
    DEPARTMENT_ID AS 부서번호
FROM
    --employees e INNER JoIn departments d
    EMPLOYEES e JOIN DEPARTMENTS d 
    USING(departments_id)

    JOIN job_grades g 
    ON e.SALARY BETWEEN g.lowest_sal ANd g.highest_sal;

SELECT
    -- e.last_name AS 사원명,
    -- m.last_name AS 관리자명
    *

FROM
    /*
    일치하는 데이터가 없는 테이블의 별칭이 e를 가진 LEFT
    이기 떄문에 LEFT OUTER JOIN 지정하고 ON 절을 사용하여
    조인조건 지정
    */
    -- EMPLOYEES e RIGHT OUTER JOIN EMPLOYEES m

    EMPLOYEES e FULL OUTER JOIN EMPLOYEES m

    --employees e LEFT OUTER JOIN EMPLOYEES M -- OUTER 키워드 생략가능

ON e.manager_id = m.EMPLOYEE_ID;

/*
  Oracle Outer Join 과 ANSI Outer Join 에서
  (1) Equi/Non-equi Join에서는, LEFT/RIGHT 테이블의
      탈락한 행들(조인조건을 만족시키지 못한)을 살려
      보는 것은 의미가 있습니다.
  (2) 하지만, Self-Join은 한 테이블을, 테이블 별칭을
      통해서 테이블 복제를 통해서 조인하기 때문에,
      복제된 테이블에는 불필요한 데이터가 들어가 있
      기 때문에, 왼쪽(자식) 테이블의 탈락한 행들을 
      살리는 것은 의미가 있지만, 오른쪽(부모, 
      복제된 테이블)의 탈락한 행들을 살리는 것은
      의미가 없고, 오히려 예측불가능한 결과셋을 발생
*/