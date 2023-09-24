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


DO $$
DECLARE
	sum_ int;
	sum_length int;
	difference_sum int;
BEGIN
	sum_ := (SELECT COUNT(*) FROM products);
	sum_length := (SELECT COUNT(*) FROM products WHERE LENGTH(product_name) > 10);
	difference_sum := sum_ - sum_length;
	RAISE NOTICE 'product sum: %', sum_;
	RAISE NOTICE 'Product name length: %', sum_length;
	RAISE NOTICE 'Difference: %', difference_sum;
END;
$$;
