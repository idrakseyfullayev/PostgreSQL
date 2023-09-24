DO $$
DECLARE
	sum_ int;
BEGIN
	sum_ := (SELECT COUNT(*) FROM products);
	RAISE NOTICE '%', sum_;
END;
$$;


DO $$
DECLARE
	sum_ int;
	sum_length int;
BEGIN
	sum_ := (SELECT COUNT(*) FROM products);
	sum_length := (SELECT COUNT(*) FROM products WHERE LENGTH(product_name) > 10);
	RAISE NOTICE 'product sum: %', sum_;
	RAISE NOTICE 'Product name length: %', sum_length;
END;
$$;
