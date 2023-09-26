DO $$
DECLARE
	test_1 int := 60;
	test_2 int := 80;
	test_3 int := 69;
	avg_ int;
BEGIN
	avg_ := (test_1 + test_2 + test_3) / 3;
	RAISE NOTICE 'Average: %', avg_;
	
	IF avg_ >= 70 THEN
		RAISE NOTICE 'Successful';
	ELSE
		RAISE NOTICE 'Unsuccessful';
	END IF;	
		
END;
$$;
