DROP FUNCTION sum_
CREATE OR REPLACE FUNCTION sum_() RETURNS int
LANGUAGE PLPGSQL
AS $$
DECLARE
	s1 int := 45;
	s2 int := 30;
	result_ int;
BEGIN
	result_ := s1 + s2;
	RETURN result_;
END;
$$;
	
SELECT sum_()


DROP FUNCTION sum_
CREATE OR REPLACE FUNCTION sum_(s1 int, s2 int) RETURNS int
LANGUAGE PLPGSQL
AS $$
DECLARE
	result_ int;
BEGIN
	result_ := s1 + s2;
	RETURN result_;
END;
$$;
	
SELECT sum_(45, 30)


CREATE OR REPLACE FUNCTION category_add(cat_id smallint, cat_name varchar(15), descp text, picture bytea) RETURNS void
LANGUAGE SQL
AS $$
	INSERT INTO categories VALUES (cat_id, cat_name, descp, picture);
$$;

SELECT category_add(9::smallint, 'Teafood'::varchar(15), 'Teaweed and fish'::text, '\x'::bytea)

SELECT * FROM categories
