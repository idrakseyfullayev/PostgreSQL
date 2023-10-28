
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


DROP FUNCTION get_salary_bounds_by_city(emp_city varchar,
								OUT min_salary numeric, OUT max_salary numeric)
CREATE OR REPLACE FUNCTION get_salary_bounds_by_city(emp_city varchar,
								OUT min_salary numeric, OUT max_salary numeric) AS $$
	SELECT MIN(salary), MAX(salary)
	FROM employees
	WHERE city = emp_city;
$$ LANGUAGE SQL;								

SELECT * FROM get_salary_bounds_by_city('London')

ALTER TABLE employees ADD column salary numeric; 
SELECT salary FROM employees;
SELECT * FROM employees;

UPDATE employees
SET salary = employee_id * 0.4 * 20;


CREATE OR REPLACE FUNCTION correcrt_salary(upper_boundry numeric DEFAULT 70,
										 correction_rate numeric DEFAULT 0.15)
										 RETURNS VOID AS $$
	UPDATE employees
	SET salary = salary + (salary * correction_rate)
	WHERE salary <= upper_boundry
$$ LANGUAGE SQL;										 

SELECT correcrt_salary();
SELECT correcrt_salary(10, 2);
SELECT salary FROM employees;

