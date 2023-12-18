
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


CREATE OR REPLACE FUNCTION correct_salary(upper_boundry numeric DEFAULT 70,
										 correction_rate numeric DEFAULT 0.15)
										 RETURNS VOID AS $$
	UPDATE employees
	SET salary = salary + (salary * correction_rate)
	WHERE salary <= upper_boundry
$$ LANGUAGE SQL;										 

SELECT correct_salary();
SELECT correct_salary(10, 2);
SELECT salary FROM employees;


DROP FUNCTION correct_salary;
CREATE OR REPLACE FUNCTION correct_salary(upper_boundry numeric DEFAULT 70,
										 correction_rate numeric DEFAULT 0.15)
										 RETURNS SETOF employees AS $$
	UPDATE employees
	SET salary = salary + (salary * correction_rate)
	WHERE salary <= upper_boundry
	RETURNING *
$$ LANGUAGE SQL;										 

SELECT salary FROM correct_salary();
SELECT correct_salary(10, 2);
SELECT salary FROM employees;


DROP FUNCTION correct_salary;
CREATE OR REPLACE FUNCTION correct_salary(upper_boundry numeric DEFAULT 70,
										 correction_rate numeric DEFAULT 0.15)
										 RETURNS TABLE(first_name varchar, last_name
													   varchar, salary numeric) 
										 AS $$
	UPDATE employees
	SET salary = salary + (salary * correction_rate)
	WHERE salary <= upper_boundry
	RETURNING first_name, last_name, salary
$$ LANGUAGE SQL;										 

SELECT * FROM correct_salary();
SELECT * FROM correct_salary(100, 0.45);
SELECT salary FROM employees;


DROP FUNCTION get_orders_by_shiping(ship_method int)
CREATE OR REPLACE FUNCTION get_orders_by_shiping(ship_method int) RETURNS SETOF orders AS $$
DECLARE
	average numeric;
	maximum numeric;
	middle numeric;
BEGIN
	SELECT MAX(freight) INTO maximum
	FROM orders
	WHERE ship_via = ship_method;
	
	SELECT AVG(freight) INTO average
	FROM orders
	WHERE ship_via = ship_method;
	
	maximum = maximum - (maximum * 0.3);
	
	middle = (maximum + average) / 2;
-- 	return middle;
	RETURN QUERY
	SELECT * 
	FROM orders
	WHERE freight < middle AND ship_via = ship_method;
	
END;
$$ LANGUAGE PLPGSQL;

SELECT count(*) FROM get_orders_by_shiping(1);
SELECT * FROM get_orders_by_shiping(1) ORDER BY freight DESC


DROP FUNCTION should_increase_salary;
CREATE OR REPLACE FUNCTION should_increase_salary(
	cur_salary numeric,
	max_salary numeric DEFAULT 80,	
	min_salary numeric DEFAULT 30,
	increase_rate numeric DEFAULT 0.2
) RETURNS bool AS $$
DECLARE
	new_salary numeric;
BEGIN
	IF cur_salary >= max_salary	OR cur_salary >= min_salary THEN
		RETURN FALSE;
	END IF;
	
	IF cur_salary < min_salary THEN
		new_salary = cur_salary + (cur_salary * increase_rate);
	END IF;
	
	IF new_salary > max_salary THEN
		RETURN FALSE;
	ELSE
		RETURN TRUE;
	END IF;	
END;
$$ LANGUAGE PLPGSQL;

SELECT should_increase_salary(40, 80 ,30, 0.2);
SELECT should_increase_salary(79, 81, 80, 0.2);
SELECT should_increase_salary(79, 95, 90, 0.2);
