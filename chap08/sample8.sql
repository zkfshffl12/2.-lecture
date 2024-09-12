-- sample8.sql


-- ------------------------------------------------------
-- (5) FOREIGN KEY 제약조건 (= 참조무결성 제약조건)
-- ------------------------------------------------------
-- 가. '외래키' 또는 '참조키' 라고 부름
-- 나. 자식 테이블에서 부모 테이블을 참조할 때, 올바른 데이터만
--     참조 가능하도록 제약하는 방법
-- 다. null 값 허용
-- 라. 제약조건명 형식: table_column_fk
-- ------------------------------------------------------

-- deptno: 외래키(foreign key) or 참조키(reference key)
SELECT
    empno,
    deptno
FROM
    emp;


-- deptno: 기본키(primary key)
SELECT
    *
FROM
    dept;

-- 참조 무결성 제약조건 위배
-- ORA-02291: integrity constraint (SCOTT.FK_DEPTNO) violated - parent key not found
INSERT INTO emp (empno, ename, deptno)
VALUES (9000, 'Yoseph', 50);


-- USER_CONSTRAINTS 데이터 사전
-- 두 테이블 간의 제약조건 확인
DESC user_constraints;


SELECT
    table_name,
    constraint_type,
    constraint_name,
    r_constraint_name
FROM
    user_constraints
WHERE
    table_name IN ('DEPT', 'EMP');


-- ------------------------------------------------------
-- Basic Syntax1: column-level
--
--  CREATE TABLE [스키마].테이블명 (
--      컬럼명1 데이터타입 [CONSTRAINT 제약조건명] 
--                          REFERENCES 부모테이블명(컬럼명),
--      컬럼명2 데이터타입,
--      ...
--  );
--
-- ** 주의1 ** :
-- 참조하는 부모테이블의 컬럼은, 반드시 
--  (1) 기본키(Primary Key) OR
--  (2) UNIQUE 제약조건이 설정된 컬럼 
-- 이어야 함!!!
--
-- PK/UK 아닌 컬럼을, 외래키 제약조건으로 설정 시도 -> 오류발생
--
-- ** 주의2 ** :
-- 외래키(FK)는, 부모 테이블과 자식 테이블 간의 참조무결성을 위한
-- 제약조건이기 때문에, 자식 테이블에서 참조하게 되는 컬럼을
-- 부모 테이블에서 기본키 또는 UNIQUE 제약조건이부여된 컬럼들로 
-- 지정해 두어야 함!!!
-- (PK 이나 UK는 한 개이상의 복합컬럼으로 구성가능!!!)
-- ------------------------------------------------------
DROP TABLE dept02;


CREATE TABLE dept02 (
    -- PK == UK + NN
    deptno  NUMBER(2)  CONSTRAINT dept02_deptno_pk PRIMARY KEY,
    dname   VARCHAR2(15),
    loc     VARCHAR2(15)
);


INSERT INTO dept02 (deptno, dname, loc)
VALUES (10, '인사', '서울');

INSERT INTO dept02 (deptno, dname, loc)
VALUES (20, '개발', '광주');

INSERT INTO dept02 (deptno, dname, loc)
VALUES (30, '관리', '부산');

INSERT INTO dept02 (deptno, dname, loc)
VALUES (40, '영업', '경기');


COMMIT;

SHOW AUTOCOMMIT;
SET AUTOCOMMIT ON;
SET AUTOCOMMIT OFF;
SHOW AUTOCOMMIT;

-- ------------------------------------------------------

DROP TABLE emp02 PURGE;

CREATE TABLE emp02 (
    empno   NUMBER(4)
        CONSTRAINT emp02_empno_pk PRIMARY KEY,
    ename   VARCHAR2(15),
    deptno  NUMBER(2)
        CONSTRAINT emp02_deptno_fk REFERENCES dept02(deptno)
);


INSERT INTO emp02 (empno, ename, deptno)
VALUES (1000, 'John', 10);

INSERT INTO emp02 (empno, ename, deptno)
VALUES (2000, 'Smith', 20);

INSERT INTO emp02 (empno, ename, deptno)
VALUES (3000, 'Sam', NULL);

COMMIT;

-- ORA-02291: integrity constraint (SCOTT.EMP02_DEPTNO_FK) violated - parent key not found
INSERT INTO emp02 (empno, ename, deptno)
VALUES (4000, 'Mike', 50);

COMMIT;


-- USER_CONSTRAINTS 데이터 사전
DESC user_constraints;


SELECT
    table_name,
    constraint_type,
    constraint_name,
    r_constraint_name
FROM
    user_constraints
WHERE
    table_name IN ('DEPT02', 'EMP02');


-- ------------------------------------------------------
-- Basic Syntax2: table-level
--
--  CREATE TABLE [스키마].테이블명 (
--      컬럼명1 데이터타입,
--      컬럼명2 데이터타입,
--      ...,
--      [CONSTRAINT 제약조건명] 
--          FOREIGN KEY(컬럼명n) REFERENCES 부모테이블명(컬럼명)
--  );
--
-- ** 주의1 ** :
-- 참조하는 부모테이블의 컬럼은, 반드시 1) 기본키(Primary Key) 
-- 또는 2) UNIQUE 제약조건이 설정된 컬럼 이어야 함!!!
--
-- PK/UK 아닌 컬럼을, 왜래키 제약조건으로 설정 시도 -> 오류발생
--
-- ** 주의2 ** :
-- 외래키는, 부모 테이블과 자식 테이블 간의 참조 무결성을 위한
-- 제약조건이기 때문에, 자식 테이블에서 참조하게 되는 컬럼을
-- 부모 테이블에서 기본키 또는 UNIQUE로 지정해 두어야 함!!!
-- ------------------------------------------------------

CREATE TABLE emp03 (
    empno   NUMBER(4) CONSTRAINT emp03_empno_pk PRIMARY KEY,
    ename   VARCHAR2(15),
    deptno  NUMBER(2),

    CONSTRAINT emp03_deptno_fk 
        FOREIGN KEY(deptno) REFERENCES dept02(deptno)
);


INSERT INTO emp03 (empno, ename, deptno)
VALUES (1000, 'John', 10);


INSERT INTO emp03 (empno, ename, deptno)
VALUES (2000, 'Smith', 20);


INSERT INTO emp03 (empno, ename, deptno)
VALUES (3000, 'Sam', NULL);


-- FOREIGN KEY 제약조건 위배
-- ORA-02291: integrity constraint (SCOTT.EMP03_DEPTNO_FK) violated - parent key not found
INSERT INTO emp03 (empno, ename, deptno)
VALUES (4000, 'Mike', 50);


COMMIT;

-- ------------------------------------------------------

-- USER_CONSTRAINTS 데이터 사전
DESC user_constraints;


SELECT
    table_name,
    constraint_type,
    constraint_name,
    r_constraint_name
FROM
    user_constraints
WHERE
    table_name IN ('DEPT02', 'EMP02', 'EMP03');


-- ------------------------------------------------------
-- 참조 무결성 제약조건 위배
-- ------------------------------------------------------

-- 특정부서(부모)를 참조하고 있는 사원(자식)들이 있으므로, 
-- 부서를 삭제할 수 없음 (참조관계 존재)
-- ORA-02292: integrity constraint (SCOTT.EMP02_DEPTNO_FK) violated - 
--            child record found
DELETE FROM dept02
WHERE deptno = 10;      -- 부모 테이블의 특정부서 삭제


-- 해결방법(2가지)
-- ------------------------------------------------------
-- 1) ON DELETE CASCADE
-- ------------------------------------------------------
-- 참조하는 부모테이블의 행이 삭제되면, 해당 행을 참조하는 
-- 자식테이블의 행도 연쇄삭제 됨.
-- ------------------------------------------------------
DROP TABLE emp02;
DROP TABLE emp03;


INSERT INTO dept02 (deptno, dname, loc)
VALUES (10, '인사', '서울');


CREATE TABLE emp02 (
    empno   NUMBER(4) CONSTRAINT emp02_empno_pk PRIMARY KEY,
    ename   VARCHAR2(15),
    deptno  NUMBER(2) 
        CONSTRAINT emp02_deptno_fk 
            REFERENCES dept02(deptno) ON DELETE CASCADE
);


INSERT INTO emp02 (empno, ename, deptno)
VALUES (1000, 'John', 10);

INSERT INTO emp02 (empno, ename, deptno)
VALUES (2000, 'Smith', 20);

INSERT INTO emp02 (empno, ename, deptno)
VALUES (3000, 'Sam', NULL);

COMMIT;


SELECT
    *
FROM
    dept02;


DELETE FROM dept02
WHERE deptno = 10;      -- 부모 테이블의 특정부서 삭제


SELECT
    *
FROM
    emp02;

commit;    


-- ------------------------------------------------------
-- 2) ON DELETE SET NULL
-- ------------------------------------------------------
-- 참조하는 부모 테이블의 행이 삭제되면, 해당 행을 참조하는 자식
-- 테이블의 컬럼값을 NULL로 설정한다.
-- ------------------------------------------------------
DROP TABLE emp02;
DROP TABLE emp03;


INSERT INTO dept02 (deptno, dname, loc) 
VALUES (10, '인사', '서울');



-- CREATE TABLE 사원 (
--     사원번호   NUMBER(4)      CONSTRAINT emp02_empno_pk PRIMARY KEY,
--     사원명   VARCHAR2(15),
--     부서번호  NUMBER(2) CONSTRAINT emp02_deptno_fk 
--             REFERENCES 부서(부서번호) ON DELETE SET NULL
-- );


DROP TABLE emp02 PURGE;

CREATE TABLE emp02 (
    empno   NUMBER(4)      CONSTRAINT emp02_empno_pk PRIMARY KEY,
    ename   VARCHAR2(15),
    deptno  NUMBER(2) 
        CONSTRAINT emp02_deptno_fk 
            -- REFERENCES dept02(deptno) ON DELETE SET NULL
            REFERENCES dept02(deptno) ON DELETE SET DEFAULT 20
);


INSERT INTO emp02 (empno, ename, deptno)
VALUES (1000, 'John', 10);

INSERT INTO emp02 (empno, ename, deptno)
VALUES (2000, 'Smith', 20);

INSERT INTO emp02 (empno, ename, deptno)
VALUES (3000, 'Sam', NULL);


COMMIT;


SELECT
    *
FROM
    dept02;


DELETE FROM dept02
WHERE deptno = 10;      -- 부모 테이블의 특정부서 삭제


SELECT
    *
FROM
    emp02;


