DO $$
DEClARE
	x int := 20;
	y int := 15;
	sum_ int := x+y;
BEGIN
	RAISE NOTICE 'value 1: %', x;
	RAISE NOTICE 'value 2: %', y;
	RAISE NOTICE 'Sum: %', sum_;
END;	
$$;


DO $$
DEClARE
	x int := 20;
	y int := 15;
BEGIN
	RAISE NOTICE 'value 1: %', x;
	RAISE NOTICE 'value 2: %', y;
	RAISE NOTICE 'Sum: %', x+y;
END;	
$$;


DO $$
DEClARE
	x int := 20;
	y int := 15;
	sum_ int;
BEGIN
	sum_ := x+y;
	RAISE NOTICE 'value 1: %', x;
	RAISE NOTICE 'value 2: %', y;
	RAISE NOTICE 'Sum: %', sum_;
END;	
$$;
