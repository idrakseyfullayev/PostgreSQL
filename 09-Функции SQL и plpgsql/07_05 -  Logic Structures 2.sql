
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
