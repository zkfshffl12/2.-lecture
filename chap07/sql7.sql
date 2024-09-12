SELECT
    *
FROM
    dept;

SHOW AUTOCOMMIT

SET AUTOCOMMIT on;
set AUTOCOMMIT off;

show AUTOCOMMIT;

INSERT INTO dept (deptno, dname, loc)
VALUES (50, '개발', '서울');

-- TCL : transaction control language
COMMIT;

INSERT into DEPT
VALUES (60,'인사', '경기');

ROLLBACK;

insert into dept(deptmo.dname)
VALUES (70,'인사');

commit;

INSERT into ept (DEPTNO,1ocl);
values ('11.인사')(11, '인사';)

INSERT into dept(DEPTNO, dname, loc)
values ('개발', 14, '인사');

show AUTOCOMMIT

insert into dept (DEPTNO, dname, loc)
VALUES (77,'인턴', '독산');

--commit
--ROLLBACK

DISCONNECT;



DROP TABLE myemp_hire;

create table mydept
AS
SELECT * from dept;

desc mydept;

SELECT * FROM dept;

DELETE FROM dept WHERE DEPTNO > 40;
COMMIT

DELETE mydept;
commit;

INSERT into mydept
SELECT
*

FROM
   mydept


insert into mydept

SELECT
    t.*,
FROM
    dept t;

DROP TaBle myemp_hire;

CREATE TABLE myemp_hire AS
SELECT
    empno,
    ename,
    hiredate,
    SAL
FROM
    EMP
WHERE
    1= 2;

DESC myemp_hire;

SELECT * FROM emp;

INSERT ALL
    INTO myemp_hire VALUES (empno, ename, hiredate, sal)
    INTO myemp_mgr  VALUES (empno, ename, mgr)

    SELECT
        empno,
        ename,
        hiredate,
        sal,
        mgr
    FROM
        emp;

SELECT 
    *
FROM
    myemp_hire;

SELECT
    *
FROM
    myemp_mgr;

DROP TABLE myemp_hire2 ;

CREATE TABLE myemp_hire2 AS
SELECT
    EMPNO,
    ENAME,
    mgr
FROM
    EMP
WHERE
    1=2;

DESC MYEMP_HIRE2;


DELETE MYEMP_HIRE2
delete myemp_mgr2

DROP TaBle  MYEMP_HIRE2;
DROP TaBle myemp_mgr2;

WHEN sal>3000 THEN
    INTO MYEMP_HIRE2 VALUES 
    --(empno, ename, HIREDATE, sal)

WHEN mgr = 7698 THEN
    INTO myemp_mgr2 VALUES 
    --(emono, ename, mgr)

SELECT  * 
    -- empno,
    -- ename,
    -- hiredate,
    -- sal,
    -- mgr
FROM
    emp;

drop table myemp_hire3;

create table MYEMP_HIRE3 AS
SELECT
    EMPNO,
    ename,
    HIREDATE,
    SAL
FROM
    EMP
WHERE
    1 = 2;

DESC myemp_hire3;

---여기 까지가 7장1챕터

SELECT
    job_id,
    avg(salary) as "avg salary"
FROM
    Employees
WHERE
    job_id NOT like '%clerk'
GROUP BY
    job_id
HAVING
    avg(salary) > 10000
Order BY
    avg(salary) DESC;

UPDATE mydept
SET
    dname = '영업',
    loc ='경기'
WHERE
    deptno = 40;

UPDATE mydept
SET
    dname = (select dname from dept WHERE deptno = 10),
    loc = (select loc FROM dept WHERE deptno = 20)
WHERE
    deptno = 40;

SELECT
    *
FROM
    MYDEPT
WHERE
    DEPTNO =40;

--여기까지가 7장3챕터

BEGIN

    DELETE from mydept
    where deptno = 20;

    DELETE from MYDEPT
    where deptno = 40;

    SAVEPOINT s1;

    commit;

    ROLLBACK;

END;

SELECT
    *
FROM
    mydept;


BEGIN

    DELETE FROM mydept
    WHERE loc =(
        SELECT DISTINCT loc
        FROM DEPT
        WHERE deptno = 20
    );

DELETE FROM MYDEPT
WHERE (loc, dname) = (
        SELECT loc, DNAME
        FROM DEPT
        where deptno = 40
    );
COMMIT;

ROLLBACK;

END;

DELETE FROM MYDEPT;

DELETE MYDEPT;
COMMIT

TRUNCATE TABLE MYDEPT;

--여기까지가 7장4챕터

Drop table pt_01;

CREATE table pt_01(
    판매번호 VARCHAR2(8),
    제품번호 NUMBER,
    수량 number,
    금액 NUMBER
);

Drop table pt_02;

CREATE table pt_02(
    판매번호 VARCHAR2(8),
    제품번호 NUMBER,
    수량 number,
    금액 NUMBER
);

Drop TABLE p_toral;

CREATE table p_toral(
    판매번호 VARCHAR2(8),
    제품번호 NUMBER,
    수량 number,
    금액 NUMBER
);

DESC pt_01;
DESC pt_02;
DESC p_total;

BEGIN       -- To start a transaction.

    -- 1월달 판매현황 테이블 데이터 생성
    INSERT INTO pt_01 VALUES ( '20170101', 1000, 10, 500 );
    INSERT INTO pt_01 VALUES ( '20170102', 1001, 10, 400 );
    INSERT INTO pt_01 VALUES ( '20170103', 1002, 10, 300 );

    -- 2월달 판매형환 테이블 데이터 생성
    INSERT INTO pt_02 VALUES ( '20170201', 1003,  5, 500 );
    INSERT INTO pt_02 VALUES ( '20170202', 1004,  5, 400 );
    INSERT INTO pt_02 VALUES ( '20170203', 1005,  5, 300 );

    COMMIT;

END;

SELECT 
    *
FROM
    PT_01;

select
    pt_02;

TRUNCATE Table P_total;

MERGE INTO p_toral total

    using pt_01 p01
    ON(total.판매번호 = p01.판매번호)

    WHEN MATCHED THEN

    
        UPDATE
        SET
         total.제품번호 = p01.제품번호

    when not matched THEN

    INSERT
    vaLues (p01.판매번호, p01.제품번호, p01.수량, p01.금액);

commit;

SELECT
    *
FROM
    PT_02;

SELECT      
 *
FROM
    p_toral