SELECT * FROM products
JOIN categories USING(category_id)
WHERE category_name = 'Seafood';
	
SELECT * FROM products WHERE category_id = (SELECT category_id 
                      			    FROM categories 
                      			    WHERE category_name= 'Seafood');	
