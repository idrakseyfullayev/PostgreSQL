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
