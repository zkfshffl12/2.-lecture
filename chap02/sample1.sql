-- sample1.sql


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
--          (중복제거: 오른쪽 중괄호 블록에서 지정된 컬럼들에 대해서 모든컬럼의 값이 같은 행 제거)
-- SELECT [DISTINCT] { * | column [AS] [alias], ... }
-- FROM <테이블명>
-- ------------------------------------------------------

--SELECT 문의 수행결과 발생되는 결과
--set 수학의 집합-> 테이블
--테이블을 구성하는 각각의 컬럼역시
--하나의 집합

------------------------------------
--    이름  | 나이
-------------------------------------
--  홍길동  | 23
-----------------------------------

--데이터베이스에서 null은
--  "결측치(missing value)" (값자체가 없다) 라고 한다!!

-- ------------------------------------------------------
-- 1. To project all columns of the table
-- ------------------------------------------------------
-- SELECT *
-- FROM table;
-- ------------------------------------------------------
SELECT *
FROM employees;



SELECT *
FROM departments;

-- ------------------------------------------------------
-- 2. To project only the specified columns of the table
-- ------------------------------------------------------
-- SELECT column1[, column2, ..., columnN]
-- FROM table;
-- ------------------------------------------------------
DESCRIBE employees;
DESC employees;

SELECT
    employee_id,
    last_name,
    hire_date,
    salary
FROM
    employees;

-- ------------------------------------------------------
-- 3. 산술연산자의 활용 ( +, - , *, / )
-- ------------------------------------------------------
-- SELECT column1 + column2 FROM table;
-- SELECT column1 - column2 FROM table;
-- SELECT column1 * column2 FROM table;
-- SELECT column1 / column2 FROM table;
-- ------------------------------------------------------
SELECT
    salary,
    salary + 100
FROM employees;

SELECT
    salary,
    salary - 100
FROM
    employees;

SELECT
    salary,
    salary * 100 
FROM
    employees;

SELECT
    salary,
    salary / 100
FROM
    employees;

SELECT
    last_name,
    salary,
    salary * 12
FROM
    employees;

-- ------------------------------------------------------
-- 4. About SYS.DUAL table
-- ------------------------------------------------------
-- SYS account owns this DUAL table.
-- If you don't need a table, the DUAL table needed.
-- ------------------------------------------------------
DESC dual;

SELECT * FROM dual;

--Dummy table
 --   (1)from  절을 생략할 수는 없고 ->나와야하고
 --    (2) 하지만 그렇다고 지금 작성하는 Select문이 테이블 데이터를 필요로 하지 않는 경우

 --결과셋 -> 테이블(행과 열로 구성)
 --테이블 중에 특히 모양(Shape)이 1x1 Shape을 가지는 테이블
 --을 우리는 "스칼라(Scalar, 즉 단일값)"라고 부른다!!
--SELECT
----    245 * 567 
FROM
    dual;          -- 참고로, MySQL/Mariadb/Postgresql 에서는 생략가능!


DESC sys.dual;
DESC dual;


SELECT
    *
FROM
    dual;

SELECT
    * 
FROM
    sys.dual;

Desc sys.dual;  --소유자를 기재하지 않고도 dual 테이블을 사용가능한 상태로표현
desc dual;      --이유는 뒤에서 배우실 동의어 객체를 통해가지고 하기