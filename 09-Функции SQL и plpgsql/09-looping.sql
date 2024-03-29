DO $$
DECLARE
	counter int := 0;
	i int := 0;
	j int := 1;
	n int := 8;
BEGIN
	if n = 1 THEN
		RAISE NOTICE '0';
	ELSE
		RAISE NOTICE '%', i;
		RAISE NOTICE '%', j;	
	WHILE counter + 3 <= n
		LOOP
			SELECT j, i +j INTO i, j;
			counter = counter + 1;
			RAISE NOTICE '%', j;
		END LOOP;
	END IF;	
END
$$;


DO $$
DECLARE
	counter int := 0;
	i int := 0;
	j int := 1;
	n int := 8;
BEGIN
	IF n = 1 THEN
		RAISE NOTICE '0';
	ElSE
	WHILE counter + 3 <= n
		LOOP
			SELECT j, i +j INTO i, j;
			counter = counter + 1;
		END LOOP;
		
	RAISE NOTICE '%', j;
	END IF;
END $$ LANGUAGE PLPGSQL;


DO $$
DECLARE
	counter int := 0;
	i int := 0;
	j int := 1;
	n int := 8;
BEGIN
	if n <= 1 THEN
		RAISE NOTICE '0';
	
	ELSE
	RAISE NOTICE '%', i;
	RAISE NOTICE '%', j;	

	LOOP
		EXIT WHEN counter + 2 = n;
		SELECT j, i +j INTO i, j;
		counter = counter + 1;
		RAISE NOTICE '%', j;
	END LOOP;
	END IF;	
END
$$;


DO $$
DECLARE
	counter int := 0;
	i int := 0;
	j int := 1;
	n int := 8;
BEGIN
	if n <= 1 THEN
		RAISE NOTICE '0';
	
	ELSE
	LOOP
		EXIT WHEN counter + 2 = n;
		SELECT j, i +j INTO i, j;
		counter = counter + 1;
	END LOOP;
	RAISE NOTICE '%', j;
	END IF;	
END
$$	


CREATE OR REPLACE FUNCTION fibonacci (n INTEGER) 
   RETURNS INTEGER AS $$ 
DECLARE
   counter INTEGER := 0 ; 
   i INTEGER := 0 ; 
   j INTEGER := 1 ;
BEGIN
   IF n = 1 THEN
      RETURN 0 ;
   END IF; 
   
   WHILE counter + 3 <= n
   LOOP
      SELECT j, i + j INTO i, j;
	  counter := counter + 1; 
   END LOOP ; 
   
   RETURN j ;
END;
$$ LANGUAGE PLPGSQL;

SELECT fibonacci(8);

-- rewritten with explicit exit instead if WHILE--
CREATE OR REPLACE FUNCTION fibonacci_2 (n INTEGER) 
   RETURNS INTEGER AS $$ 
DECLARE
	counter INTEGER := 0 ; 
	i INTEGER := 0 ; 
	j INTEGER := 1 ;
BEGIN
	IF n <= 1 THEN
		RETURN 0 ;
	END IF; 
   
	LOOP
		EXIT WHEN counter + 2 = n;
		SELECT j, i + j INTO i, j;
		counter := counter + 1; 
	END LOOP ; 
   
	RETURN j ;
END;
$$ LANGUAGE PLPGSQL;

SELECT fibonacci_2(8);


-- FOR IN --
DO $$
BEGIN
   FOR counter IN 1..5 LOOP
   RAISE NOTICE 'Counter: %', counter;
   END LOOP;
END; $$

DO $$
BEGIN
   FOR counter IN REVERSE 5..1 LOOP
      RAISE NOTICE 'Counter: %', counter;
   END LOOP;
END; $$


DO $$
BEGIN 
  FOR counter IN 1..6 BY 2 LOOP
    RAISE NOTICE 'Counter: %', counter;
  END LOOP;
END; $$


DO $$
DECLARE
	counter RECORD;
BEGIN 
  FOR counter IN SELECT employee_id  FROM employees
  	LOOP
    RAISE NOTICE 'Counter: %', counter;
  END LOOP;
END; $$


DO $$
DECLARE
	counter int;
BEGIN
 FOREACH counter in ARRAY ARRAY[1, 8, 3, 7, 9, 8]
 	LOOP
		RAISE NOTICE '%', counter;
	END LOOP;
END;
$$;


do $body$
declare
  arr1 int[] := array[1, 2];
  arr2 int[] := array[3, 4, 5];
  var int;
begin
  <<"FOREACH eaxmple">>
  foreach var in array arr1||arr2 loop
    raise info '%', var;
  end loop "FOREACH eaxmple";
end;
$body$;


CREATE OR REPLACE FUNCTION return_ints() RETURNS SETOF int AS $$
BEGIN
	RETURN NEXT 1;
	RETURN NEXT 2;
	RETURN NEXT 3;
	--RETURN;
END;
$$ LANGUAGE PLPGSQL;

SELECT return_ints();
SELECT * FROM return_ints();


--*Continue and Iterate Over Array*--
CREATE OR REPLACE FUNCTION filter_even(variadic numbers int[]) returns setof int 
	AS $$
BEGIN
   FOR counter IN 1..array_upper(numbers, 1)
	LOOP
	CONTINUE WHEN counter % 2 != 0;
	return next counter;
   END LOOP;
END;
$$ LANGUAGE plpgsql;

select * from filter_even(1, 2, 3, 4, 5, 6)

--*FOREACH*--
CREATE OR REPLACE FUNCTION filter_even(variadic numbers int[]) returns setof int 
	AS $$
DECLARE
	counter int;
BEGIN
   FOREACH counter IN ARRAY numbers
   	LOOP
   	CONTINUE WHEN counter % 2 != 0;
   	return next counter;
   END LOOP;
END;
$$ LANGUAGE plpgsql;

select * from filter_even(1, 2, 3, 4, 5, 6)

-- Iterate Over a Query --

CREATE OR REPLACE FUNCTION iter_over_query(n INTEGER DEFAULT 5) 
	RETURNS VOID AS $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN SELECT * 
          FROM products
          ORDER BY unit_price
          LIMIT n
    LOOP 
   		RAISE NOTICE '%', rec.product_name; --don't forget to look at messages
    END LOOP;
END;
$$ LANGUAGE plpgsql;

select * from iter_over_query()

--*RETURN NEXT*--
-- Иногда нам необходима построчная обработка данных и уже затем построчный их возврат из функции
-- в таком случае надо использовать выражение RETURN NEXT для возврата каждой строки. 
-- Это выражение можно вызывать несколько раз и результатом каждого вызова будет новая строка в выходном наборе данных.
-- Вот простейший пример:
CREATE OR REPLACE FUNCTION return_setof_int() RETURNS SETOF int AS
$$
BEGIN
  RETURN NEXT 1;
  RETURN NEXT 2;
  RETURN NEXT 3;
  RETURN; -- Необязательный
END
$$ LANGUAGE plpgsql;

--RETURN NEXT:
CREATE OR REPLACE FUNCTION test0()
 RETURNS TABLE(y integer, result text) AS $$
BEGIN
    FOR y, result IN 
        SELECT s.y, 'hi' result FROM generate_series(1,10,1) AS s(y)
    LOOP
        RETURN NEXT y;
    END LOOP;
END
$$ LANGUAGE plpgsql;

SELECT * FROM test0();

--а вот пример посложнее--
CREATE OR REPLACE FUNCTION after_christmas_sale() RETURNS SETOF products AS $$
DECLARE
	product record;
BEGIN
	FOR product IN
		SELECT * FROM products
	LOOP
		IF product.category_id IN (1,4,8) THEN
			product.unit_price = product.unit_price * .80;
		ELSIF product.category_id IN (2,3,7) THEN
			product.unit_price = product.unit_price * .75;
		ELSE
			product.unit_price = product.unit_price * 1.10;
		END IF;
		RETURN NEXT product;
	END LOOP;

	RETURN;

END;
$$ LANGUAGE plpgsql;

SELECT * FROM after_christmas_sale();


SELECT product_id, product_name, unit_price * 0.8 FROM products 
WHERE category_id IN (1, 4, 8)
UNION
SELECT product_id, product_name, unit_price * 0.75 FROM products 
WHERE category_id IN (2, 3, 7)
UNION
SELECT product_id, product_name, unit_price * 1.15 FROM products 
WHERE category_id NOT IN (1, 4, 8, 2, 3, 7)
ORDER BY product_id


SELECT product_id, category_id, product_name, unit_price,
	CASE 
		WHEN category_id IN (1, 4, 8) THEN
			unit_price * 0.8
		WHEN category_id IN (2, 3, 7) THEN
			unit_price * 0.75
		ELSE
			unit_price * 1.15
	END	
FROM products
ORDER BY product_id
