DROP FUNCTION get_product
CREATE OR REPLACE FUNCTION get_product(pr_name varchar(40)) RETURNS TABLE(
pr_id smallint, cat_id smallint, prod_name varchar(40)) AS $$
BEGIN
	RETURN QUERY
	SELECT product_id, category_id, product_name
	FROM products
	WHERE product_name LIKE INITCAP(pr_name);
END;
$$ LANGUAGE PLPGSQL;

SELECT * FROM get_product('c%')

SELECT * FROM products
