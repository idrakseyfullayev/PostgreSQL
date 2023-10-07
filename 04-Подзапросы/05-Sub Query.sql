SELECT * FROM products;
SELECT * FROM products WHERE unit_price = (SELECT MAX(unit_price) FROM products);

SELECT * FROM categories;
SELECT * FROM products WHERE unit_price = (SELECT MAX(unit_price) 
					   FROM products WHERE category_id = 8);

SELECT * FROM products WHERE unit_price = (SELECT MAX(unit_price) 
					   FROM products
					   JOIN categories USING(category_id)
					   WHERE category_name = 'Seafood');
