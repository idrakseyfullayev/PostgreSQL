CREATE TABLE sum_products_2
(
	counter_ int
);

SELECT * FROM sum_products_2;

INSERT INTO sum_products_2 VALUES (0);
SELECT * FROM sum_products_2;

SELECT * FROM products;

DROP FUNCTION test_2
CREATE OR REPLACE FUNCTION test_2() RETURNS TRIGGER	AS $$
DECLARE
	length_ int;
BEGIN
	length_ = (SELECT LENGTH(product_name) 
			   FROM products ORDER BY product_id DESC LIMIT 1);
	UPDATE sum_products_2 SET counter_ = counter_ + length_;
	RETURN NEW;				   
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER testtrig_2
AFTER INSERT
ON products
FOR EACH ROW
EXECUTE PROCEDURE test_2();

SELECT * FROM sum_products_2;
SELECT * FROM products;
INSERT INTO products VALUES (81, 'AzeriXurma', 12, 2, 
							 '12 boxes', 13, 32, 0, 15, 0);

SELECT * FROM sum_products_2;
