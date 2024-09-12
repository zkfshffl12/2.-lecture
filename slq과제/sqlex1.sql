--19번
SELECT
    employee_id,
    last_name,
    job_id,
    salary
FROM
    employees
WHERE
    salary > (SELECT salary 
    FROM employees 
    WHERE last_name = 'Tucker');

--25번
SELECT
    LAST_NAME,
    HIRE_DATE,
    SALARY,
    CASE
        WHEN HIRE_DATE BETWEEN TO_DATE('2001-01-01', 'YYYY-MM-DD') AND TO_DATE('2001-12-31', 'YYYY-MM-DD') THEN SALARY * 0.05
        WHEN HIRE_DATE BETWEEN TO_DATE('2002-01-01', 'YYYY-MM-DD') AND TO_DATE('2002-12-31', 'YYYY-MM-DD') THEN SALARY * 0.03
        WHEN HIRE_DATE BETWEEN TO_DATE('2003-01-01', 'YYYY-MM-DD') AND TO_DATE('2003-12-31', 'YYYY-MM-DD') THEN SALARY * 0.01
        ELSE 0.0
    END AS "인상금액",
    SALARY + CASE
        WHEN HIRE_DATE BETWEEN TO_DATE('2001-01-01', 'YYYY-MM-DD') AND TO_DATE('2001-12-31', 'YYYY-MM-DD') THEN SALARY * 0.05
        WHEN HIRE_DATE BETWEEN TO_DATE('2002-01-01', 'YYYY-MM-DD') AND TO_DATE('2002-12-31', 'YYYY-MM-DD') THEN SALARY * 0.03
        WHEN HIRE_DATE BETWEEN TO_DATE('2003-01-01', 'YYYY-MM-DD') AND TO_DATE('2003-12-31', 'YYYY-MM-DD') THEN SALARY * 0.01
        ELSE 0
    END AS "지급금액"
FROM
    EMPLOYEES
WHERE
    HIRE_DATE BETWEEN TO_DATE('2001-01-01', 'YYYY-MM-DD') AND TO_DATE('2003-12-31', 'YYYY-MM-DD')
ORDER BY
    HIRE_DATE ASC;

--31번문제
SELECT
employee_id, job_id

from employees

intersect

select employee_id, job_id

from job_history;