
DO $$
DECLARE
	number_ int := 2;
BEGIN
	IF number_ % 2 = 0 THEN
		RAISE NOTICE '% is even number', number_;
	ELSE
		RAISE NOTICE '% is odd number', number_;
	END IF;	
END;
$$;


DO $$
DECLARE
	number_ int := 16;
BEGIN
	IF number_ % 2 THEN
		RAISE NOTICE '% is odd number', number_;
	ELSE
		RAISE NOTICE '% is even number', number_;
	END IF;	
END;
$$;


DO $$
DECLARE
	count_ int;
BEGIN
	count_ := (SELECT count(*) FROM products WHERE category_id = 4);
	  
	IF count_ > 10 THEN
		RAISE NOTICE 'count % by category', count_;
	ELSE
		RAISE NOTICE 'count less than 10';
	END IF;	
END;
$$;


DO $$
DECLARE
	count_ int;
	category int;
BEGIN
	SELECT count(*), category_id INTO count_, category FROM products
			  GROUP BY category_id  HAVING category_id = 1;
			  
	IF count_ > 10 THEN
		RAISE NOTICE 'count % by category %', count_, category;
	ELSE
		RAISE NOTICE 'count less than 10';
	END IF;	
END;
$$;
