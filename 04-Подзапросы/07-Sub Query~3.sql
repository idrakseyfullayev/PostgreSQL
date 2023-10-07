SELECT * FROM products WHERE category_id = 8

UPDATE products set unit_price = unit_price + unit_price * 0.1
						       WHERE category_id = (SELECT category_id
									    FROM categories
									    WHERE category_name = 'Seafood')
