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
