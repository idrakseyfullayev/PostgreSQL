--*RETURN in plpgsql*--
CREATE OR REPLACE FUNCTION get_total_number_of_goods() RETURNS bigint AS $$
BEGIN
	RETURN sum(units_in_stock)
	FROM products;
END;
$$ LANGUAGE plpgsql;

SELECT get_total_number_of_goods();

CREATE OR REPLACE FUNCTION get_max_price_from_discontinued() RETURNS real AS $$
BEGIN
	RETURN max(unit_price)
	FROM products
	WHERE discontinued = 1;
END;
$$ LANGUAGE plpgsql;

SELECT get_max_price_from_discontinued();


DROP FUNCTION get_max_price();
CREATE OR REPLACE FUNCTION get_max_price() RETURNS bigint AS $$
BEGIN
	RETURN MAX(unit_price)
	FROM products;
END;
$$ LANGUAGE plpgsql;

SELECT get_max_price();
SELECT * FROM get_max_price();


DROP FUNCTION get_max_price_by_category();
CREATE OR REPLACE FUNCTION get_max_price_by_category() RETURNS SETOF real AS $$
BEGIN
	RETURN QUERY
	SELECT MAX(unit_price)
	FROM products
	GROUP BY category_id;
END;
$$ LANGUAGE plpgsql;

SELECT  get_max_price_by_category();
SELECT * FROM  get_max_price_by_category();


CREATE OR REPLACE FUNCTION get_price_boundaries(OUT max_price real, OUT min_price real) AS $$
BEGIN
	--max_price := MAX(unit_price) FROM products;
	--min_price := MIN(unit_price) FROM products;
	SELECT MAX(unit_price), MIN(unit_price)
	INTO max_price, min_price
	FROM products;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_price_boundaries();


DROP FUNCTION get_max_price_by_category();
CREATE OR REPLACE FUNCTION get_max_price_by_category(OUT max_price real, OUT cat_id smallint) RETURNS SETOF RECORD AS $$
BEGIN
	RETURN QUERY
	SELECT MAX(unit_price), category_id 
	FROM products
	GROUP BY category_id;
END;
$$ LANGUAGE plpgsql;

SELECT get_max_price_by_category();
SELECT * FROM get_max_price_by_category();


DROP FUNCTION get_max_price_by_category();
CREATE OR REPLACE FUNCTION get_max_price_by_category() RETURNS SETOF RECORD AS $$
BEGIN
	RETURN QUERY
	SELECT MAX(unit_price), category_id 
	FROM products
	GROUP BY category_id;
END;
$$ LANGUAGE plpgsql;

-- don't work
SELECT get_max_price_by_category();
SELECT * FROM get_max_price_by_category();

-- work this only
SELECT * FROM get_max_price_by_category() AS (max_price real, cat_id smallint);



CREATE OR REPLACE FUNCTION get_sum(x int, y int, out result_ int) AS $$
BEGIN
	result_ = x + y;
	RETURN;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_sum(2, 3);


drop function if exists get_sum;
CREATE OR REPLACE FUNCTION get_sum(x int, y int) RETURNS int AS $$
DECLARE
	result_ int;
BEGIN
	result_ = x + y;
	RETURN result_;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_sum(2, 3);



DROP FUNCTION IF EXISTS get_customers_by_country;
CREATE FUNCTION get_customers_by_country(customer_country varchar) RETURNS SETOF customers AS $$
BEGIN
	RETURN QUERY
	SELECT *
	FROM customers
	WHERE country = customer_country;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_customers_by_country('USA');


drop function if exists get_customers_by_country;
create or replace function get_customers_by_country(customer_country varchar) 
		returns table(char_code char, company_name varchar) as $$
BEGIN
	RETURN QUERY
	select customer_id, customers.company_name
	from customers	
	where country = customer_country;
END;
$$ language plpgsql;

SELECT * FROM get_customers_by_country('France')

	
--* Declaring variables*--:
drop function if exists get_square;
CREATE OR REPLACE FUNCTION get_square(ab real, bc real, ac real) RETURNS real AS $$
DECLARE
	p real;
	perimetr real;
BEGIN
	perimetr = ab + bc + ac;
	p = perimetr / 2;
	RETURN SQRT(p * (p-ab) * (p-bc) * (p-ac));
END;
$$ LANGUAGE PLPGSQL;

SELECT get_square(6, 6, 6)


drop function if exists get_square;
CREATE OR REPLACE FUNCTION get_square(ab real, bc real, ac real) RETURNS real AS $$
DECLARE
	p real;
	perimetr real;
	c real;
BEGIN
	perimetr = ab + bc + ac;
	p = perimetr / 2;
	c = SQRT(p * (p-ab) * (p-bc) * (p-ac));
	RETURN c;
END;
$$ LANGUAGE PLPGSQL;

SELECT get_square(6, 6, 6);


drop function if exists get_square;
CREATE OR REPLACE FUNCTION get_square(ab real, bc real, ac real, OUT c real) RETURNS real AS $$
DECLARE
	p real;
	perimetr real;
BEGIN
	perimetr = ab + bc + ac;
	p = perimetr / 2;
	c = SQRT(p * (p-ab) * (p-bc) * (p-ac));
	RETURN;
END;
$$ LANGUAGE PLPGSQL;

SELECT get_square(6, 6, 6);

	
--*Final example here*--
CREATE OR REPLACE FUNCTION calc_middle_price()
RETURNS SETOF products AS $$

	DECLARE
		average_price real;
		bottom_price real;
		top_price real;
	BEGIN
		SELECT AVG(unit_price) INTO average_price
		FROM products;

		bottom_price := average_price * .75;
		top_price := average_price * 1.25;

		RETURN QUERY SELECT * FROM products
		WHERE unit_price between bottom_price AND top_price;
	END;
$$ LANGUAGE plpgsql;

SELECT * FROM calc_middle_price()
