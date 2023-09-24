DO $$
BEGIN
	RAISE NOTICE  'Salam';
	RAISE NOTICE 'value 1: %', 1;
END;	
$$;

DO $$
DEClARE
	x int := 20;
BEGIN
	RAISE NOTICE  '%', x;
	RAISE NOTICE 'value 1: %', 1;
END;	
$$;
