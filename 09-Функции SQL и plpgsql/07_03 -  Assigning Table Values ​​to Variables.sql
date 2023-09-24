DO $$
DECLARE
	sum_ int;
BEGIN
	sum_ := (SELECT COUNT(*) FROM products);
	RAISE NOTICE '%', sum_;
END;
$$;
