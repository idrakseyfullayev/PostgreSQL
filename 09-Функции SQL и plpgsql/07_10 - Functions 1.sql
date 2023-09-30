





















CREATE OR REPLACE FUNCTION category_add(cat_id smallint, cat_name varchar(15),
										 descp text, picture bytea) RETURNS void
LANGUAGE SQL
AS $$
	INSERT INTO categories VALUES (cat_id, cat_name,
										 descp, picture);
$$;

SELECT category_add(9::smallint, 'Teafood'::varchar(15), 'Teaweed and fish'::text, '\x'::bytea)

SELECT * FROM categories
