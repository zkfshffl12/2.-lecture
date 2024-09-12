-- sample1.sql


-- ------------------------------------------------------
-- 1. DDL (Data Definition Language)
-- ------------------------------------------------------
-- 데이터베이스 구조(= 오라클 객체)를 생성/수정/삭제하는데,
-- 사용하는 SQL문장.
-- ------------------------------------------------------
-- 가. 자동으로 COMMIT 됨. (즉, DB에 자동 영구 반영됨)
-- 나. 데이터 딕셔너리(Data Dictionary) 에 정보 저장.
-- ------------------------------------------------------
-- 다. 오라클 객체(=데이터베이스 구조)의 종류(5가지)
-- ------------------------------------------------------
--  (1) 테이블(Table) - 데이터 저장
--      기본적인 데이터 저장 단위로, 행과 열로 구성된 객체
--  (2) 인덱스(Index) - 데이터 검색성능 향상
--      테이블에 저장된 데이터의 검색 성능 향상 목적을 위한 객체
--  (3) 뷰(View) - 가상의 테이블
--      한 개 이상의 테이블의 논리적인 부분 집합을 표시할 수 있는 객체
--  (4) 시퀀스(Sequence) - 순차번호 생성기
--      테이블의 특정 컬럼값에 숫자 값 자동 생성 목적을 위한 객체
--  (5) 동의어(Synonym) - 테이블의 별칭
--      객체에 대한 동의어를 설정하기 위한 객체
-- ------------------------------------------------------
-- 라. SQL문장 종류
-- ------------------------------------------------------
--  (1) CREATE    - DB객체(= Oracle 객체) 생성
--  (2) ALTER     - DB객체(= Oracle 객체) 변경
--  (3) DROP      - DB객체(= Oracle 객체) 삭제
--  (4) RENAME    - DB객체(= Oracle 객체) 이름 변경
--  (5) TRUNCATE  - DB객체(= Oracle 객체) 정보 절삭
-- ------------------------------------------------------


-- ------------------------------------------------------
-- (1) Table 생성
-- ------------------------------------------------------
--  가. DB에서 가장 중요한 객체
--  나. 관리할 실제 데이터를 저장하는 객체
--  다. 이름은 의미있고 사용하기 쉽게 설정하는 것이 중요
-- ------------------------------------------------------
-- Basic Syntax:
-- 
--  CREATE TABLE [스키마].테이블명 (
--       컬럼명  데이터타입  [DEFAULT 값 | 제약조건][, 
--          ... ]
--  );
--
-- ------------------------------------------------------

-- ------------------------------------------------------
--  * 스키마(Schema)
-- ------------------------------------------------------
--  가. 사용자가 DB에 접근하여, 생성한 객체들의 대표이름!!
--  나. By default, 사용자 계정명과 동일하게 부여됨!!
--  다. 생성한 객체들의 소유자는 해당 객체를 생성한 사용자 계정
--  라. 다른 스키마에 속한 객체 접근은 기본적으로 불가 (접근권한필요)
--  마. 만일 다른 스키마 내의 객체에 대한 접근권한이 있다면,
--      항상 "스키마.객체" 형식으로 사용해야 됨.
--      "스키마"를 생략하면, 현재 자신의 스키마 내에서 객체 찾음
--  바. 자신의 스키마 내의 객체 접근 시에는, 스키마 이름 생략 
-- ------------------------------------------------------

-- ORA-00942: table or view does not exist
SELECT
    deptno,
    dname,
    loc
FROM
    SCOTT.dept;

GRANT select on dept TO hr;    

-- ------------------------------------------------------
--  * Oracle Data Types (컬럼에 저장되는 데이터의 자료형)
-- ------------------------------------------------------
--  (1) CHAR(size)      - 고정길이 문자저장 (1<= size <= 2000, byte)
--      a. 지정길이보다 작은 데이터 입력 -> 나머지 공간은 공백으로 채워짐
--      b. 입력할 데이터 크기가 유동적 -> 공간낭비 초래
--      c. 고정크기 데이터 저장에 사용 -> 주민번호, 우편번호, 전화번호,... 
--  (2) VARCHAR2(size)  - 가변길이 문자저장 (1<= size <= 4000, byte)
--      a. 지정길이보다 작은 데이터 입력 -> 입력문자열 길이만큼만 공간할당
--      b. 저장공간을 매우 효율적으로 사용가능
--  (3) NVARCHAR2(size) - 가변길이 문자저장 (1<= size <= 4000, byte)
--  (4) NUMBER(s, p)    - 가변길이 숫자저장 (s: 전체자릿수, p: 소수점자릿수)
--      a. p: precision (정밀도), s: scale (스케일)
--  (5) DATE / TIMESTAMP            - 날짜 및 시간 저장
--  (6) ROWID           - 테이블 행의 고유주소(18문자로 구성) 저장 엄청중요함
--      a. 테이블에 실제 행이 저장되어 있는 논리적인 주소값
--      b. globally Unique value in the database
--      c. 테이블에 새로운 행이 삽입되면, 자동생성됨
--      d. 인덱스(Index) 내에 저장된 데이터임
--         실제 행이 저장된 주소값을 직접 알 수 있기 때문에, 검색속도가 빠르게 됨.
--      e. 문자구성
--         | 테이블객체 번호(6자리) | 파일 번호(3자리) | 블록 번호(6자리) | 행 번호(3자리) |
--  (7) BLOB            - 대용량 이진데이터 저장 (최대 4GB)
--      a. LOB == Large OBject (3가지: BLOB, CLOB, BFILE)
--      b. 대용량의 텍스트/바이너리 데이터 저장 (ex, 이미지, 동영상, 사운드 데이터)
--  (8) CLOB            - 대용량 텍스트데이터 저장 (최대 4GB)
--      a. 대용량의 텍스트 데이터 저장(ex, e-book)
--  (9) BFILE           - 대용량 이진데이터를 파일형태로 저장 (최대 4GB)

-- 7,8,9는 사용하지말것 (sql은 동시간에 작업을 하는데 금방금방 끝나야되지만 이거는 이거 3개는 너무 오래 걸림)

-- ------------------------------------------------------

SELECT
    rowid,
    deptno
FROM
    dept;  -- 테이블 내의 각 행의 ROWID 조회


-- 테이블 내의 특정 행을, ROWID 값으로, 빠르게 조회가능
-- But 인덱스(index)를 통하여, 간접적으로 ROWID 사용
-- 인덱스 내에 ROWID 저장되어 있기 때문.
SELECT
    *
FROM
    dept
WHERE
    ROWID = 'AAAR+/AAMAAAJpLAAB'; -- ROWID 이용한 조건 검색

-- ------------------------------------------------------

CREATE TABLE scott.employee (   -- 스키마.객체명 사용가능
    empno NUMBER(4),
    ename VARCHAR2(20),
    hiredate DATE,
    sal NUMBER(7,2)
);      -- employee 테이블 생성

DESC employee;

-- 동일한 이름의 객체를 재 생성하려고 시도하면...아래 오류발생.
-- ORA-00955: name is already used by an existing object

-- ------------------------------------------------------
--  * Default 옵션
-- ------------------------------------------------------
-- 가. 테이블에 데이터 저장 시, 특정 컬럼에 값을 지정하지 않으면,
--     자동으로 NULL 값이 저장됨
-- 나. 컬럼에 값을 지정하지 않아도, 자동으로 기본값 입력
-- 다. NULL 값이 입력 방지
-- 라. 현재 날짜/성별 같은, 고정된 값만 가지는 컬럼에 대해 사용
-- ------------------------------------------------------

DROP TABLE employee2;

CREATE TABLE employee2 (
    empno NUMBER(4),
    ename VARCHAR2(20),
    hiredate DATE DEFAULT current_date,
    sal NUMBER(7,2)
);      -- DEFAULT 옵션 사용


-- INSERT 문 실행
INSERT INTO employee2 (empno, ename, sal)
VALUES (10, '홍길동', 3000);    -- hiredate 컬럼제외

commit;


SELECT
    *
FROM
    employee2;     -- employee2 테이블 조회