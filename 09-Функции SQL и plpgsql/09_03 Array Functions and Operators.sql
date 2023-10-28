SELECT ARRAY[1,2,3];
SELECT ARRAY(SELECT product_id FROM products);
SELECT ARRAY(SELECT product_name FROM products);

SELECT array_append(ARRAY[]::int[], 1);

SELECT array_cat(ARRAY[10]::smallint[], ARRAY(SELECT product_id FROM products));
