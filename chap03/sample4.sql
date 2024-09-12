-- sample20.sql


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
-- 1. 단일(행) (반환)함수
-- ------------------------------------------------------
-- 단일(행) (반환)함수의 구분:
--
--  (1) 문자 (처리)함수 : 문자와 관련된 특별한 조작을 위한 함수
--  (2) 숫자 (처리)함수 : 
--  (3) 날짜 (처리)함수 :
--  (4) 강제형변환 (처리)함수 : 숫자/문자/날짜 데이터 간의 형 변환 함수
--      a. TO_CHAR   - 숫자 데이터를 문자 데이터로 변환 또는
--                     날짜 데이터를 문자 데이터로 변환
--      b. TO_NUMBER - 문자 데이터를 숫자 데이터로 변환
--      c. TO_DATE   - 문자 데이터를 날짜 데이터로 변환(주의:날짜형식의 문자열)
--  (5) 일반 (처리)함수 :
--
--  단일(행) (반환)함수는, 테이블의 행 단위로 처리됨!
-- ------------------------------------------------------

-- ------------------------------------------------------
-- Oracle Type Conversions (Chapter03 - page 52 참고)
-- ------------------------------------------------------
-- 1. 자동 형변환 (묵시적 형변환) - Promotion
--
--    <NUMBER> <--> <CHARACTER> <--> <DATE>
--
-- 2. 강제 형변환 (명시적 형변환) - Casting
--
-- (1) <NUMBER>     -- TO_CHAR      --> <CHARACTER>
--     <CHARACTER>  -- TO_NUMBER    --> <NUMBER>
-- (2) <CHARACTER>  -- TO_DATE      --> <DATE>
--     <DATE>       -- TO_CHAR      --> <CHARACTER>
-- (3) <NUMBER>     --    X         --> <DATE>
--     <DATE>       --    X         --> <NUMBER>
-- ------------------------------------------------------

-- ------------------------------------------------------
-- (0) 자동 형변환 (Promotion) 예
-- ------------------------------------------------------
-- 문자타입(CHARACTER) --> 숫자타입(NUMBER)
-- ------------------------------------------------------
DESC employees;


SELECT
    last_name,
    salary
FROM
    employees
WHERE
    -- OK: '17000' -> 17000으로 자동형변환수행
    salary = '17000';
    -- salary = 17000;


-- ------------------------------------------------------
-- (4) 변환 (처리)함수 - TO_CHAR
-- ------------------------------------------------------
-- 1. 날짜 데이터를 문자 데이터로 변환
--    예: TO_CHAR( hire_date, 'YYYY' )
--
-- 2. 숫자 데이터를 문자 데이터로 변환
--    예: TO_CHAR( 123456, '999,999' )
-- ------------------------------------------------------

-- ------------------------------------------------------
-- 1. 날짜 데이터를 문자 데이터로 변환
--    예: TO_CHAR( hire_date, 'YYYY' )
-- ------------------------------------------------------
SELECT
    to_char(sysdate, 'YYYY/MM/DD,(AM) DY HH24:MI:SS') AS DT1,
    to_char(current_date, 'YYYY/MM/DD,(AM) DY HH24:MI:SS') AS DT2
FROM
    dual;


SELECT
    last_name,
    hire_date,
    salary
FROM
    employees
WHERE
    to_char(hire_date, 'MM') = '09';


SELECT
    to_char(current_date, 'YYYY-MM-DD HH24:MI:SS DY AM') 날짜0,
    -- to_char(current_date, ' YYYY "년" MM "월" DD "일" ') 날짜1
    -- to_char(current_date, ' YYYY 년 MM 월 DD 일') 날짜2  -- XX
    -- to_char(current_date, 'YYYY '년' MM '월' DD '일'') 날짜4  -- XX
    -- to_char(current_date, ' YYYY A MM B DD C ') 날짜3     -- XX
    to_char(current_date, ' YYYY "A" MM "B" DD "C" ') 날짜3     -- ??
FROM
    dual;


-- ------------------------------------------------------
-- 2. 숫자 데이터를 문자 데이터로 변환
--    예: TO_CHAR( 123456, '999,999' )
-- ------------------------------------------------------

-- 1) 숫자 출력형식
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

-- 2) 화폐 출력형식
SELECT
    last_name,
    salary,
    to_char(salary, '$999,999') 달러,
    to_char(salary, 'L999,999') 원화
FROM
    employees;


-- ------------------------------------------------------
-- (4) 변환 (처리)함수 - TO_NUMBER
-- ------------------------------------------------------
-- 문자 데이터를 숫자 데이터로 변환
-- ------------------------------------------------------

SELECT
    to_number('123') + 100,   -- 강제형변환 (Casting)   : *Recommended*
    '456' + 100,              -- 자동형변환 (Promotion) :  Decommended
    to_char(123) || '456',    -- 강제형변환 (Casting)   : *Recommended*
    123 || '456'              -- 자동형변환 (Promotion) :  Decommended
FROM
    dual;


-- ------------------------------------------------------
-- (4) 변환 (처리)함수 - TO_DATE
-- ------------------------------------------------------
-- '날짜형태'의 문자 데이터를 날짜 데이터로 변환
-- ------------------------------------------------------

-- 1) To change Oracle's default date format
--    * Oracle SQL*Developer 에서도 수행해볼 것!
ALTER SESSION SET NLS_DATE_FORMAT='RR/MM/DD';
-- ALTER SESSION SET NLS_DATE_FORMAT='YYYY/MM/DD HH24:MI:SS';


SELECT
    current_date
FROM
    dual;


-- 2) to_date 응용
SELECT
    to_date('20170802181030', 'YYYYMMDDHH24MISS') AS D1,
    to_date('2017', 'YYYY') AS D2,
    to_date('155120', 'HH24MISS') AS D3,
    to_date('48', 'SS') AS D4
FROM
    dual;


SELECT
    current_date,
    current_date - to_date('20170101', 'YYYYMMDD') AS days,
    (current_date - to_date('20170101', 'YYYYMMDD')) / 365 * 12 AS months
FROM
    dual;