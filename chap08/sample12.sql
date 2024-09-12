-- sample12.sql


-- ------------------------------------------------------
-- 5. 제약조건 추가 (ALTER TABLE 문장)
-- ------------------------------------------------------
-- 가. 기존 테이블에 제약조건 추가
-- 나. PK/FK/UK/CK 제약조건 추가 -> ALTER TABLE ADD 문 사용
-- 다. NN 제약조건 추가 -> ALTER TABLE MODIFY 문 사용
-- 라. 기존 테이블에 추가적인 제약조건도 추가 가능
-- ------------------------------------------------------
-- Basic Syntax:
--
--  ALTER TABLE 테이블명
--  ADD [CONSTRAINT 제약조건명] 제약조건타입(컬럼명);
-- ------------------------------------------------------


-- ------------------------------------------------------
-- (1) PRIMARY KEY 제약조건 추가
-- ------------------------------------------------------
-- 제약조건 없는 테이블 생성
CREATE TABLE dept03 (
    deptno  NUMBER(2),
    dname   VARCHAR2(15),
    loc     VARCHAR2(15)
);


DESC dept03;


-- 테이블에 제약조건 추가
ALTER TABLE dept03
ADD CONSTRAINT dept03_deptno_pk PRIMARY KEY(deptno);

-- CTAS 기법으로 복제한 사원테이블(emp04)에는 PK가 없습니다.
-- 그래서 추가해 봅시다.단, 주의하실 것은 데이터가 들어있다!!!
SELECT count(empno)
FROM emp04
WHERE empno IS NULL;

-- 중복체크필요. 어떻게!?
SELECT count(DISTINCT empno)
FROM emp04;

SELECT empno, count(empno)
FROM emp04
GROUP BY empno
HAVING count(empno) > 1;

ALTER TABLE emp04
ADD CONSTRAINT emp04_empno_pk PRIMARY KEY(empno);

ALTER TABLE emp04
ADD CONSTRAINT emp04_ename_uk UNIQUE(ename);


-- 기본키 제약조건 추가 확인
SELECT
    table_name,
    constraint_type,
    constraint_name,
    r_constraint_name
FROM
    user_constraints
WHERE
    table_name IN ('DEPT03', 'EMP04');
    -- table_name IN ('DEPT');


-- ------------------------------------------------------
-- (2) NOT NULL 제약조건 추가 (CK/PK/FK 제약조건 추가는 ADD로 수행)
-- ------------------------------------------------------
-- Basic Syntax:
--
--  ALTER TABLE 테이블명
--  MODIFY ( 컬럼명 데이터타입 [CONSTRAINT 제약조건명] NOT NULL );
-- ------------------------------------------------------

DESC dept03;


-- NOT NULL 제약조건 추가
ALTER TABLE dept03
MODIFY ( dname VARCHAR2(15) CONSTRAINT dept03_dname_nn NOT NULL );


-- NOT NULL 제약조건 추가 확인
DESC dept03;


SELECT
    table_name,
    constraint_type,
    constraint_name,
    r_constraint_name
FROM
    user_constraints
WHERE
    table_name IN ('DEPT03');




