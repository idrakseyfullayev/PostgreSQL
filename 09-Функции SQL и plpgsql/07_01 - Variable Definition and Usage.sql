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


DO $$
DEClARE
	x int := 20;
	y int := 15;
BEGIN
	RAISE NOTICE 'value 1: %', x;
	RAISE NOTICE 'value 2: %', y;
END;	
$$;


DO $$
DEClARE
	x int := 20;
	y int := 15;
	z int;
BEGIN
	RAISE NOTICE 'value 1: %', x;
	RAISE NOTICE 'value 2: %', y;
	RAISE NOTICE 'value 3: %', z;
END;	
$$;
