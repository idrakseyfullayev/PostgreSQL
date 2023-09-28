DO $$
DECLARE
	counter int := 1;
BEGIN
	LOOP
		RAISE NOTICE 'Salam dunya';
		EXIT WHEN counter = 5;
		counter := counter + 1;
	END LOOP;
END;
$$;
