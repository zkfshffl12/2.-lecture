GRANT
    connect,
    resource,
    unlimited tablespace 
TO ttt IDENTIFIED BY Oracle12345678;

ALTER USER ttt DEFAULT TABLESPACE data;
ALTER USER ttt TEMPORARY TABLESPACE temp;

GRANT
	create view,
	create synonym,
	create sequence
TO ttt;


GRANT
	select,
	update,
	insert,
	delete 
ON emp 
TO ttt;

ALTER USER ttt ACCOUNT LOCK;

ALTER USER ttt 
	IDENTIFIED BY Oracle1234567 
    ACCOUNT UNLOCK;