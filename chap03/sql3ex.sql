SELECT
   'ORACLE SQL',
   initcap('ORACLE SQL')
FROM
   dual;
---------
SELECT
   email,
   initcap(email)
FROM
   employees;
---------
SELECT
    'oracle sql',
    UPPER('oracle sql'),
    UPPER('oracle 오라클')
FROM
    dual;
----------
SELECT
    LAST_NAME,
    UPPER(LAST_NAME)
FROM
    EMPLOYEES;
-----------
SELECT
    LAST_NAME,
    SALARY
FROM
    EMPLOYEES
WHERE
    upper(LAST_NAME)='KING';
---------
SELECT
    'oracle sql',
    lower('oracle sql'),
    lower('오라클 sql')
FROM
    dual;

---------
--SELECT
 --   || (Concatenation operator) == concat FUNCTION
 --    'oracle'|| 'sql',
 --    concat('oracle','sql')
----------
SELECT
    --|| (Concatenation operator)== concat function
    'oracle'||'sql'||'third',
    concat(concat('oracle','sql'),'thied')
FROM
    dual;
----------
SELECT
    CONCAT(SALARY,LAST_NAME) AS RESULT
FROM
    EMPLOYEES;
------
SELECT
    -- || (Concatenation operator)== concat function
    last_name || SALARY
    CONCAT(LAST_NAME,SALARY)
FROM
    EMPLOYEES;
-------
SELECT
    LAST_NAME || HIRE_DATE,
    concat(LAST_NAME,HIRE_DATE)
FROM
    EMPLOYEES;
--------
SELECT
    'oracle',
    length(LAST_NAME),
    length('안희빈')
FROM
    EMPLOYEES;
--------
SELECT
    '한글',
    LENGTH('한글') AS length,
    LENGTH('한글') AS LENGTHB
FROM
    dual;
-------
SELECT
    unistr('\D55C\AE00'),
    LENGTH(unistr('\d55c\Ae00'))    As length,
    lengthb(unistr('\D55C\AE00') )   AS lengthb
FROM
    dual;
-----------
SELECT
    instr('MILLER', 'L', 1, 2),
    instr('MILLER', 'x', 1, 2)
FROM
    dual;
----------
SELECT
   -- (1) 문자열의 인덱스는 1부터 시작합니다.
   -- (2) 매개변수: substr(문자열, offset, length) => full-closed
   -- (3) 매개변수로 offset(시작인덱스번호)만 지정하면,
   --     주어진 offset 부터 문자열의 끝까지 끊어냄
   substr('123456-1234567', 1, 6),  -- (2)
   substr('123456-1234567', 8),     -- (3)
   substr('123456-1234567', 1, 7) || '*******' as "주민등록번호"
FROM
   dual;

AlTer session set NLS_DATE_FORMAT ='YYYY/MM/DD';

SELECT
    LAST_NAME,
   hire_date AS 입사일,
   substr(hire_date, 1, 4) AS 입사년도,
   -- 근속년수를 구해보라!!!
   ( substr(current_date, 1, 4) - substr(hire_date, 1, 4) ) AS 근속년수
FROM
   employees;


AlTEr Session set NLS_DATE_FORMAT = 'DD-MON-RR';

SELECT
    HIRE_DATE,
    to_char(HIRE_DATE) As 인사일,
    TO_char(HIRE_DATE, 'RR/MM/DD') As 인사일2,
    substr( to_char(hire_date), 8, 2) As 입사년도
FROM
 EMPLOYEES;

 SELECT
    '900303-1234567',
    substr('900303-1234567',8)
FROM
    dual;

SELECT
    '900303-1234567',
    SUBSTR('900303-1234567',-7)
FROM
    dual;

-- 그런데, offset index를 음수를 사용할 수 있다면????ㅠ
SELECT
    /*
        주어진 문자열의 마지막 문자의 인덱스 번호는 -1부터시작합니다
        왼쪽으로부터 인덱스 번호가 작아진다
    */
    replace('JACK and JUE','J', 'BL')
FROM
    dual;

SELECT
    lpad('MILLER',10,'*')
FROM
    dual;

SELECT
    rpad('miller',10, '*') AS R1,
    rpad('miller',3, '*') AS R1
FROM
    DUAL

Select
    SUBSTR('900303-1234567',1,8) || '******' AS 주민번호
FROM
    dual;

    SELECT
        rpad(
            substr('900303-1234567', 1, 8), 14, '*'
        ) AS "익명화된 
        주민번호"

        rpad('900303-1234567', 8)   || '******' As "익명화된 주민번호2",
        substr('900303-1234567',1,8) || '******' AS " 익명화된 주민번호3"
    FROM
        dual;

SELECT

    --주어진 문자열 리터럴에서 왼쪽부터 m 문자열을 삭제하라
    -- 그런데 언제 삭제가 멈추는거자
    ltrim('MMMIMLLER', 'M'),

    --주어진 문자열 리터럴에서 왼쪽부터 MI 문자열을 삭제하라
    --그런데 언제 삭제가 멈추는 거지!????

    ltrim('MMMIMMMMMMMLLER','MI')
FROM
    dual;

 SELECT
    ltrim(' MILLER '),
    LENGTH(ltrim(' MILLER '))
FROM
    dual;

SELECT
    rtrim('MILLREm', 'R')
FROM
    dua;

SELECT
    rtrim(' MILLER'),
    LENGTH( rtrim(' MILLER'))
FROM
    dual;

SELECT
    trim('0' FROM '0001234567000')  -- default: BOTH (양쪽에서 제거)
FROM
    dual;

SELECT
    trim( LEADING '0' FRim '0001234567000')  -- 문자열 왼쪽에서 제거
FROM
    dual;

SELECT
    trim( TRAILING '0' FROM '0001234567000')     -- 문자열 오른쪽에서 제거
FROM
    dual;

--여가까지가 3장 1챕터 

--1. ROUND  함수(양수)
SELECT
    round(456.789,2)
FROM
    dual;

--2. ROUND (음수)
SELECT
    round( 456.789, -1)
FROM
    dual;

SELECT
    trunc(456.789)
FROM
    dual;

SELECT
    mod(10,3),
    mod(10,0)
FROM
    dual;

SELECT
    EMPLOYEE_ID,
    LAST_NAME,
    SALARY
FROM
    EMPLOYEES
-- WHERE
--     mod(EMPLOYEE_ID, 2) =1;
-- WHERE
--     mod(EMPLOYEE_ID, 2) =1;

WHERE
mod(EMPLOYEE_ID, 6) !=0;

SELECT
    ceil(10.6),
    ceil(-10.6),
    ceil(10)
FROM
    dual;

SELECT
    EMPLOYEE_ID,
    LAST_NAME,
    SALARY
FROM
EMPLOYEES

WHERE
    sign(salary - 15000) =1; 
   -- sign(SALARY - 15000) !=-1;
-- sign(salary - 10000) !=0;
-- sign(salary - 10000) =0;
---여기까지가 2장 3챕터

 DESc NLS_SESSION_PARAMETERS;

 SELECT
    *
FROM
    NLS_SESSION_PARAMETERS;

AlTEr SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';

SELECT
    SYSDATE,
    CURRENT_DATE
FROM
    dual;

ALTER SELECT SET NLS_DATE_FORMAT = 'RR/MM/DD';

SELECT
    sysdate,
    CURRENT_DATE
FROM
    dual;

ALTEr SESION NLS_DATE_FORMAT= 'YYYY/MM/DD HH24:MI:ss';

SELECT
    sysdate,
    current_date,
    to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS') as now1,
    to_char(current_date, 'YYYY/MM/DD HH24:MI:SS') as now2
FROM
    dual;

ALTEr SeSsION SET NLS_DATE_FORMAT 'YYYY/MM/DD HH24:MI:SS';

SELECT
    CURRENT_DATE As 오늘,
    CURRENT_DATE AS 내일,
    CuREENI_DaTE AS 어제

FROM
    dual;

SELECT
LAST_NAME,
HIRE_DATE,
current_date - HIRE_DATE,
(CURRENT_DATE - HIRE_DATE) /365,
TRUNC((current_date - HIRE_DATE) / 365) As 근속년수
FROM
    EMPLOYEES
orDER BY
    3 DESC;

SELECT
    current_date AS 오늘,
    add_months(current_date, (80-24)*12) AS 남은인생,
    add_months(current_date, +1) AS "1개월후 오늘",   -- 현재날짜 + 1개월
    add_months(current_date, -1) AS "1개월전 오늘"    -- 현재날짜 - 1개월
FROM
    dual;

SELECT
    last_name,
    hire_date,

    -- 최초로 돌아오는 금요일('FRI')에 해당하는 날짜 출력
    next_day(hire_date, 'FRI'),     -- OK
    -- next_day(hire_date, '금'),  -- XX: ORA-01846: not a valid day of the week
    
    -- 최초로 돌아오는 금요일(6)에 해당하는 날짜 출력
    next_day(hire_date, 6)
FROM
    employees
ORDER BY
    3 desc;

SELECT
    LAST_NAME,
    HIRE_DATE,

    NEXT_DAY(ADD_MONTHS(HIRE_DATE, 5), 'sun')

FROM
    EMPLOYEES
order BY
    2 desc;

SELECT
    last_name,
    hire_date,
    
    -- 채용날짜의 월을 반올림(to YYYY/MM/01)
    round(hire_date,'MONTH'),

    -- 채용날짜의 년도를 반올림(to YYYY/01/01)
    round(hire_date,'YEAR'),

    -- 실험: 년/월/일에서, 일 기준으로 반올림이 될까?
    current_date AS 입사일자,
    round(current_date, 'DAY')  -- OK: 단, 반올림 대상이 년/월/일에서
FROM                            --     '일'이 아니라, '요일'을 기준으로
    employees;                  --      반올림 수행(결과로, 시분초는 초기화됨)


Alter session set NLS_DATE_FORMAT = "YYYY/MM/DD";
SELECT
    LAST_NAME,
    HIRE_DATE,

    CURRENT_DATE,
    trunc(CURRENT_DATE, 'YEAR')AS D1,
    trunc(current_date, 'MONTH')AS D1_2,

    TRUNC(HIRE_DATE, 'YEAR') AS D2,

    trunc(HIRE_DATE, 'MoNTh') AS D3

    FROM
        EMPLOYEES;

---여기까지가 3장3챕터

DESC EMPLOYEES;

SELECT
    LAST_NAME,
    SALARY
FROM
    EMPLOYEES
WHERE
    SALARY = 17000;

SELECT
    to_char(SYSDATE, 'YYYY/MM/DD AM "DY" HH24:MI:SS') AS DT2
FROM
    dual;

SELECT
    LAST_NAME,
    HIRE_DATE,
    SALARY
FROM
    EMPLOYEES
WHERE
    to_char(HIRE_DATE, 'MM') = '09';

SELECT
to_char(CURRENT_DATE, 'YYYY-MM-DD HH24:MI:SS DY AM') 날짜0,
to_char(CURRENT_DATE, 'YYYY"년"MM"월"DD"일" HH24:MI:SS DY AM') 날짜1

--to_char(current_date, 'YYYY년MM 월 DD 일')날짜2 --XX
--to_char(CURRENT_DATE, 'YYYY '년'MM'월'DD'일'') --XX
--to_char(CURRENT_DATE, 'YYYY A MM B DD C')날짜3
--to_char(current_date, ' YYYY "A" MM "B" DD "C" ') 날짜3  -- ??
--to_char(CURRENT_DATE, 'YYYY"Y"MM"M"DD"D"') 
FROM
    dual;

SELECT
    to_char(1234),
    to_char(1234, '99999')    AS "99999",    -- 9: 한 자리의 숫자 표현
    to_char(1234, '099999')   AS "099999",   -- 0: 앞부분을 0으로 표현
    to_char(1234, '$99999')   AS "$99999",   -- $: 달러 기호를 앞에 표현
    to_char(1234, '99999.99') AS "99999.99", -- .: 소수점을 표시
    to_char(1234, '99,999')   AS "99,999",   -- ,: 특정 위치에 , 표시
    to_char(1234, 'B9999.99') AS "B9999.99", -- B: 공백을 0으로 표현
    to_char(1234, 'B99999')   AS "B99999",   -- B: 공백을 0으로 표현
    to_char(1234, 'L99999')   AS "L99999"    -- L: 지역 통화(Local currency)
FROM
    dual;

SELECT * FROM NLS_SESSION_PARAMETERS;
AlTER SESsION SET NLS_TERRITORY = KOREA;

SELECT
    LAST_NAME,
    SALARY,
    to_char(SALARY, '$999,999') 달러,
    to_char(salary, 'L999,999')원화
FROM
    employees;

SELECT
    to_number('123')+100,
    '456' +100,
    to_char(123) || '456',
    123 || '456'
FROM
    dual;

ALTER SESSION SET NLS_DATE_FORMAT='RR/MM/DD';
-- ALTER SESSION SET NLS_DATE_FORMAT='YYYY/MM/DD HH24:MI:SS'; -- 이거는 현업용
SELECT
    CURRENT_DATE
FROM
    dual;

SELECT
    to_date('201708021181030','YYYYMMDDHH24MISS') AS D1,
    to_date('2017', 'YYYY') AS D2,
    to_date('155120','HH24MISS') AS D3,
    TO_DATE('48','ss') As D4
FROM
    dual;

SELECT
    CURRENT_DATE,
    current_date - TO_DATE('20170101', 'YYYYMMDD') AS days,
    (CURRENT_DATE-TO_DATE('20170101', 'YYYYMMDD')) / 365 * 12 AS MONTHS
FROM
    dual;

--여기가 3장3챕터

SELECT
    SALARY,
decode(
    SALARY,
        1000, SALARY *0.1,
        2000, SALARY *0.2,
        3000, SALARY *0.3,
        SALARY *0.4
    )as bouns
FROM
    EMPLOYEES;  

SELECT
    LAST_NAME,
    SALARY,
    decode(
        SALARY,
            24000, SALARY *0.3,
            17000, salary *0.2,
            SALARY) AS 보너스
FROM
    EMPLOYEES
OrDER BY
    2 desc;

SELECT
    count(*) AS "총인원수",
    sum( decode( to_char(hire_date, 'YYYY'), 2001, 1, 0) ) AS "2001",
    sum( decode( to_char(hire_date, 'YYYY'), 2002, 1, 0) ) AS "2002",
    sum( decode( to_char(hire_date, 'YYYY'), 2003, 1, 0) ) AS "2003",
    sum( decode( to_char(hire_date, 'YYYY'), 2004, 1, 0) ) AS "2004",
    sum( decode( to_char(hire_date, 'YYYY'), 2005, 1, 0) ) AS "2005",
    sum( decode( to_char(hire_date, 'YYYY'), 2006, 1, 0) ) AS "2006",
    sum( decode( to_char(hire_date, 'YYYY'), 2007, 1, 0) ) AS "2007",
    sum( decode( to_char(hire_date, 'YYYY'), 2008, 1, 0) ) AS "2008"
FROM
    employees;

SELECT
    SALARY,
    case salary
        WHEN 1000 THEN salary * 0.1
        WHEN 2000 THEN salary * 0.2
        WHEN 3000 THEN salary * 0.3
        ELSE SALARY * 0.4
    END AS 보너스
FRom
    employees;

SELECT  
LAST_NAME
SALARY,
CASE    
    wher salary >= 20000 ThEn 1000
    wher salary >= 150000 ThEn 2000
    wher salary >= 10000 ThEn 3000
    eLSe 4009
 End AS 보너스
FROM
    enployees
order BY
    2 desc;

SELECT
    LAST_NAME
    SALARY,
    CASE
        WHEN salaey BETWEEN 12000 And 2500 ThEN '상'
        WHEN salaey BETWEEN 10000 and 11999 THEN '중'
         ELSc '하'
    END AS 등급
FROM
    EMPLOYEES
order BY
    2 desc;

SELECT
    LAST_NAME,
    salary,
    CASE
        WHEN SALARY in (24000, 17000, 14000) THEN '상'
        WHEN SALARY IN (13500, 13000) THEN '중'
        ElSE '하'
    END As 등급
FROM
    EMPLOYEES
order BY
    2 desc;