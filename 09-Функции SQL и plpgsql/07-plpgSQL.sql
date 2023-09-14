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



CREATE OR REPLACE FUNCTION get_sum(x int, y int, out result int) AS $$
BEGIN
	result = x + y;
	RETURN;
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



--* Declaring variables*--:
drop function if exists get_square;
create or replace function get_square(ab real, bc real, ac real) returns real AS $$
declare
	perimeter real;
begin
	perimeter:=(ab+bc+ac)/2;
	return sqrt(perimeter * (perimeter - ab) * (perimeter - bc) * (perimeter - ac));
end;
$$ language plpgsql;

select get_square(6, 6, 6)

--*Final example here*--
CREATE OR REPLACE FUNCTION middle_priced()
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
