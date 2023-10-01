CREATE OR REPLACE PROCEDURE test()
LANGUAGE PLPGSQL
AS $$
BEGIN
	RAISE NOTICE 'Salam';
END;
$$;

call test()



CREATE OR REPLACE PROCEDURE category_add(cat_id smallint, cat_name varchar(15), descp text, picture bytea)
LANGUAGE SQL
AS $$
	INSERT INTO categories VALUES (cat_id, cat_name, descp, picture);
$$;

CALL category_add(9, 'Teafood', 'Teaweed and fish', '\x')
