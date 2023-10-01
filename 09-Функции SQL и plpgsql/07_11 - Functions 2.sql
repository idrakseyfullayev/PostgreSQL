DROP FUNCTION price_increase
CREATE OR REPLACE FUNCTION price_increase(unit_price float) RETURNS float
LANGUAGE PLPGSQL
AS $$
BEGIN
	unit_price := unit_price * 0.08 + unit_price;
	RETURN unit_price;
END;
$$;

SELECT product_name, unit_price,  price_increase(unit_price::float) from products


DROP FUNCTION price_increase
CREATE OR REPLACE FUNCTION price_increase(unit_price float, cat_id smallint ) RETURNS float
LANGUAGE PLPGSQL
AS $$
BEGIN
	IF cat_id > 3 THEN
		unit_price := unit_price * 0.08 + unit_price;
	ELSE
		unit_price := unit_price * 2;
	END IF;
	
	RETURN unit_price;
END;
$$;

SELECT product_name, category_id, unit_price,  price_increase(unit_price::float, category_id) from products


DROP FUNCTION price_increase
CREATE OR REPLACE FUNCTION price_increase(price float, cat_id smallint ) RETURNS float
LANGUAGE PLPGSQL
AS $$
DECLARE
	price_inc float;
BEGIN
	IF cat_id > 3 THEN
		price_inc := price * 0.08 + price;
	ELSE
		price_inc := price * 2;
	END IF;
	
	RETURN price_inc;
END;
$$;

SELECT product_name, category_id, unit_price,  price_increase(unit_price::float, category_id) from products
