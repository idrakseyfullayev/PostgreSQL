

DROP FUNCTION a_products_by_category()
CREATE OR REPLACE FUNCTION a_products_by_category() RETURNS SETOF categories  AS $$
DECLARE
	  cats RECORD;
	  counter smallint;
BEGIN
	SELECT category_id INTO cats  
	FROM products
	GROUP BY category_id
	HAVING SUM(unit_price) > 320;
	
	FOR counter IN SELECT * FROM cats
	LOOP
		RETURN QUERY
		SELECT * FROM categories WHERE category_id = counter;
	END LOOP;
END;
$$ LANGUAGE PLPGSQL;

SELECT * FROM a_products_by_category() 

-- SELECT category_id 
-- 	FROM products
-- 	GROUP BY category_id
-- 	HAVING SUM(unit_price) > 320;


DROP FUNCTION b_products_by_category()
CREATE OR REPLACE FUNCTION b_products_by_category() RETURNS SETOF smallint AS $$
DECLARE
	  cats RECORD;
	  counter smallint;
BEGIN
	SELECT category_id INTO cats  
	FROM products
	GROUP BY category_id
	HAVING SUM(unit_price) > 320;
	
	FOR counter in SELECT * FROM cats
	LOOP
	RETURN NEXT counter;
	END LOOP;
END;
$$ LANGUAGE PLPGSQL;

SELECT * FROM  b_products_by_category() 

DROP FUNCtion c_products_by_category
CREATE OR REPLACE FUNCTION c_products_by_category() RETURNS SETOF record AS $$
DECLARE
	  cats RECORD;
	  counter smallint;
BEGIN
	SELECT category_id INTO cats  
	FROM products
	GROUP BY category_id
	HAVING SUM(unit_price) > 320;
	
	RETURN QUERY SELECT * FROM cats;
END;
$$ LANGUAGE PLPGSQL;

SELECT * FROM c_products_by_category() as (n smallint)


DROP FUNCtion d_products_by_category
CREATE OR REPLACE FUNCTION d_products_by_category() RETURNS SETOF smallint AS $$
DECLARE
	  x smallint[];	
	  counter smallint;
BEGIN
		SELECT ARRAY(SELECT category_id
		FROM products
		GROUP BY category_id
		HAVING SUM(unit_price) > 320) INTO x;
		
	FOREACH counter in ARRAY x
		LOOP	
			RETURN NEXT counter;
		END LOOP;
END;
$$ LANGUAGE PLPGSQL;

SELECT * FROM  d_products_by_category()



DROP FUNCtion e_products_by_category
CREATE OR REPLACE FUNCTION e_products_by_category() RETURNS  smallint[] AS $$
DECLARE
	  x smallint[];	
BEGIN
		SELECT ARRAY(SELECT category_id
		FROM products
		GROUP BY category_id
		HAVING SUM(unit_price) > 320) INTO x;
		
		RETURN x;
END;
$$ LANGUAGE PLPGSQL;

SELECT * FROM  e_products_by_category()


DROP FUNCtion f_products_by_category
CREATE OR REPLACE FUNCTION f_products_by_category() RETURNS SETOF categories AS $$
DECLARE
	  x smallint[];	
	  counter smallint;
BEGIN
		SELECT ARRAY(SELECT category_id
		FROM products
		GROUP BY category_id
		HAVING SUM(unit_price) > 320) INTO x;
		
	FOREACH counter in ARRAY x
		LOOP	
			RETURN QUERY SELECT * FROM categories WHERE category_id = counter;
		END LOOP;
END;
$$ LANGUAGE PLPGSQL;

SELECT * FROM  f_products_by_category()


CREATE OR REPLACE FUNCTION "GetNumbers"(maxNo INTEGER) RETURNS TEXT[] AS $nums$

DECLARE 
    counter INTEGER := 0;
    nums TEXT[] := ARRAY[]::TEXT[];

BEGIN
    LOOP
        EXIT WHEN counter = maxNo;
        counter = counter + 1;
        nums = array_append(nums, counter::TEXT);
    END LOOP;

    RETURN nums;
END ;

$nums$ LANGUAGE plpgsql;

SELECT "GetNumbers"(5); -- {1,2,3,4,5}
