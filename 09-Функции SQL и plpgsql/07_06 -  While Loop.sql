DO $$
DECLARE
	counter int := 0;
BEGIN
	WHILE counter <= 10
	LOOP
		RAISE NOTICE '%', counter;
		counter := counter + 1;
	END LOOP;
END;
$$;


DO $$
DECLARE
	counter int := 1;	
	sum_ int := 0;
BEGIN
	WHILE counter <= 10
	LOOP
		RAISE NOTICE '%', counter;
		sum_ := sum_ + counter;
		counter := counter + 1;
	END LOOP;
	RAISE NOTICE 'sum: %', sum_;
END;
$$;
