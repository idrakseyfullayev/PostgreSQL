INSERT INTO sum_products (number_) VALUES (77);
SELECT COUNT(*) FROM products;

SELECT * FROM sum_products;

DROP FUNCTION test_1;
CREATE OR REPLACE FUNCTION test_1() RETURNS TRIGGER AS $$
BEGIN
	UPDATE sum_products SET number_ = number_ + 1;
	RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;


CREATE TRIGGER testtrig
AFTER INSERT
ON products
FOR EACH ROW
EXECUTE PROCEDURE test_1();

SELECT * FROM sum_products;

SELECT * FROM products;

INSERT INTO products VALUES (78, 'Azerigold', 12, 2, '12 boxes',
							 13, 32, 0, 15, 0);
INSERT INTO products VALUES (79, 'AzeriTea', 12, 2, '12 boxes',
							 13, 32, 0, 15, 0);

SELECT * FROM sum_products

