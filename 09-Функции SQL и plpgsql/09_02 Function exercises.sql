
CREATE OR REPLACE FUNCTION backup_customers() RETURNS void AS $$
	DROP TABLE IF EXISTS backedup_customers;
	
	CREATE TABLE backedup_customers AS
	SELECT * FROM customers;
-- 	SELECT INTO backedup_customers
-- 	FROM customers;
$$ LANGUAGE SQL;

SELECT backup_customers();

SELECT COUNT(*) FROM backedup_customers;


CREATE OR REPLACE FUNCTION get_avg_freight() RETURNS double precision AS $$
	SELECT AVG(freight) FROM orders;
$$ LANGUAGE SQL;

SELECT * FROM orders;
SELECT get_avg_freight();


SELECT FLOOR(10.6); 
SELECT RANDOM();
SELECT * FROM generate_series( 1, 5 );
SELECT * FROM generate_series( 1, 5, 2 );
SELECT * FROM generate_series( 5, 1, -1 );
SELECT * FROM generate_series( 1.5, 7.5, 1.5 );
SELECT * FROM generate_series(
    '2035-01-01 00:00'::timestamp,
    '2035-01-03 12:00', '8 hours'
    );
SELECT * FROM generate_series( 1, 5, 0 );
SELECT * FROM generate_series( 1, NULL );
SELECT generate_subscripts('{NULL,1,NULL,2}'::int[], 1) AS s;

CREATE OR REPLACE FUNCTION random_between(low int, high int) RETURNS int AS $$
BEGIN
	RETURN FLOOR(RANDOM() * (high - low + 1) + low);
END;
$$ LANGUAGE PLPGSQL;

SELECT random_between(7, 10)
FROM GENERATE_SERIES(1, 7);

SELECT random_between(7, 10)
FROM GENERATE_SERIES(1, 7, 2);
