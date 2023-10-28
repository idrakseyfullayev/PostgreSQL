
CREATE OR REPLACE FUNCTION backup_customers() RETURNS void AS $$
	DROP TABLE IF EXISTS backedup_customers;
	
	CREATE TABLE backedup_customers AS
	SELECT * FROM customers;
-- 	SELECT INTO backedup_customers
-- 	FROM customers;
$$ LANGUAGE SQL;

SELECT backup_customers();

SELECT COUNT(*) FROM backedup_customers;


CREATE OR REPLACE FUNCTION get_avg_freight() RETURNS double precision AS $$
	SELECT AVG(freight) FROM orders;
$$ LANGUAGE SQL;

SELECT * FROM orders;
SELECT get_avg_freight();
