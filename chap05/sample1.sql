-- sample1.sql


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
-- 0. The relationship between 
--    parent(=master) table and child(=slave) table
-- ------------------------------------------------------
-- * Please refer to Chapter05 page 2.
-- ------------------------------------------------------

-- Child(= Slave) table to refer to others.
DESC employees;


-- 여러분이 정말 실력좋은 SQL문장생성자가 되시려면,
-- 테이블/컬럼/레코드에 대한 개념부터 바꾸셔야 합니다.!!!
-- 즉, (1) 테이블은 자바의 클래스와도 같고,
--     (2) 각 레코드는, 바로 하나의 객체와도 같고,
--     (3) 테이블의 각 컬럼은, 바로 객체의 속성들과도 같습니다.
SELECT
    last_name,
    department_id
FROM
    employees
ORDER BY
    2 ASC;


-- Parent(= Master) table to be referred.
DESC departments; --= 부모태이블


SELECT
    department_id,
    department_name
FROM
    departments         -- 부서 테이블
ORDER BY
    1 ASC;


-- 1. 특정 직원의 부서번호 찾아내기
SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    last_name = 'Whalen';


-- 2. 찾아낸 부서번호를 이용한 부서명 조회
SELECT
    department_name
FROM
    departments
WHERE
    department_id = 10;


-- ------------------------------------------------------
-- "JOIN" : 필요한 데이터가, 여러 테이블에 분산되어 있을 경우에,
-- 여러 테이블의 "공통된 컬럼"을 연결시켜, 원하는 데이터를 검색하는
-- 방법을 "조인"이라 한다.
--
-- 따라서, 조인은 검색하고자 하는 컬럼이, 두개 이상의 테이블에
-- 분산되어 있는 경우에 사용된다.
-- ------------------------------------------------------
