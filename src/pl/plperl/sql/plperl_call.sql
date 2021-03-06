CREATE PROCEDURE test_proc1()
LANGUAGE plperl
AS $$
undef;
$$;

CALL test_proc1();


CREATE PROCEDURE test_proc2()
LANGUAGE plperl
AS $$
return 5
$$;

CALL test_proc2();


CREATE TABLE test1 (a int);

CREATE PROCEDURE test_proc3(x int)
LANGUAGE plperl
AS $$
spi_exec_query("INSERT INTO test1 VALUES ($_[0])");
$$;

CALL test_proc3(55);

SELECT * FROM test1;


DROP PROCEDURE test_proc1;
DROP PROCEDURE test_proc2;
DROP PROCEDURE test_proc3;

DROP TABLE test1;
